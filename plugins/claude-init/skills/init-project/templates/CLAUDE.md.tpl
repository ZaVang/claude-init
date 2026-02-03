# {{PROJECT_NAME}}

## Task Planning

1. **Think Deeper First** - Think thoroughly before starting. Break complex tasks into 3+ steps.
2. **Implementation Plan** - Write plans to `docs/implementation_plan.md` for complex tasks, confirm with user before executing.
3. **Minimal Changes** - Follow the principle of least change. Keep code concise.

## Implementation Principles

### 1. Architecture First
- **Design before coding**: Plan overall architecture and module structure before implementing features.
- **Decouple modules**: Separate functionality into independent files. Don't pile everything into one file.
- **Single responsibility**: Each module/file should handle only one functional domain.

### 2. Skeleton First
- **Write skeleton first**: Implement function signatures and class structures first. Use TODO or docstring placeholders for details.
- **Confirm before implementing**: Wait for user confirmation after skeleton is complete before implementing logic.
- **Example**:
  ```python
  def process_data(data: InputSchema) -> OutputSchema:
      """Process input data and return result.

      TODO: Implement data processing logic
      """
      raise NotImplementedError
  ```

### 3. Schema First
- Define data models before implementing features.
- Place schemas in `src/schemas/` directory.
- Language-specific:
  - **Python**: Use Pydantic models (not dataclass)
  - **TypeScript**: Use interfaces or Zod schemas

## Project Structure

```
{{PROJECT_STRUCTURE}}
```

## Quick Commands

```bash
# Run tests
{{TEST_COMMAND}}

# Start development
{{DEV_COMMAND}}
```
