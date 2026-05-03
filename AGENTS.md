# OpenCode Agent Directives

## 1. Goal
Execute tasks, verify them, and open a PR. Work autonomously. Do not wait for human input unless stuck.

## 2. Rules of Engagement
* **Read First:** Always read `opencode.json` ignores to avoid scanning junk files.
* **Stay Focused:** Only touch files needed for the current prompt.
* **Small Steps:** Make changes in small, logical chunks.

## 3. Workflow to PR
Follow these exact steps for every task:

1. **Analyze:** Review the prompt and explore relevant code.
2. **Execute:** Write the required code and tests.
3. **Verify:** Run the project's test suite (e.g., `npm test`, `pytest`, `cargo test`).
4. **Fix:** If tests fail, read the logs, fix the code, and re-run until they pass.
5. **Format & Lint:** Run formatting and linting tools. Fix any errors.
6. **Commit:** Stage changes. Write clear, concise commit messages.
7. **Push & PR:** Push the branch to the remote repo. Create a Pull Request summarizing the changes and confirming tests pass.

# SkunkAgent Repo Rules

## Commands
- Start: uv run python run.py
- Use: POST localhost:8000/apply {"text":"..."}
- Stop: Ctrl+C

## Files
- run.py: starts server
- api.py: web stuff
- agent.py: brain
- deps: uv

## Tech
- Python 3.13
- AI: 192.168.1.33:8080/v1
- Tool: get_weather (fake)
- Stack: FastAPI + LangGraph + OpenAI

## Notes
- No tests
- No lint
- deps: .venv (uv)
- Fix deps: uv sync
