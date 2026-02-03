# Python Project Rules

## Schema First

- Define data models before implementing features
- Place schemas in `src/schemas/` directory
- Use Pydantic classes instead of dataclass

## Module Decoupling

- Each subfolder covers only one submodule
- Use `__init__.py` for unified exports, implementations in separate files
- **Do not** mix implementation and invocation logic in the same file

## File Organization Example

```
src/services/
├── __init__.py           # Export all service functions
├── intent_detection.py   # Intent detection implementation
├── curriculum.py         # Curriculum management implementation
└── engagement.py         # Engagement detection implementation
```

## Type Hints

- Always use type annotations for function parameters and return values
- Use `Optional[T]` for nullable types
- Use `list[T]` instead of `List[T]` (Python 3.9+)

## Error Handling

- Use specific exception types, not bare `except:`
- Log errors with context information
- Use `raise ... from e` to preserve stack traces
