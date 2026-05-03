from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from agent import app as agent_app

app = FastAPI()

class TextRequest(BaseModel):
    text: str

@app.post("/apply")
async def apply_agent(request: TextRequest):
    try:
        # The agent_app is the compiled LangGraph workflow
        inputs = {"messages": [("user", request.text)]}
        
        # Run the graph. We take the last message from the final state.
        final_state = await agent_app.ainvoke(inputs)
        
        # The last message in the state is the agent's response
        last_message = final_state["messages"][-1]
        
        return {"response": last_message.content}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
