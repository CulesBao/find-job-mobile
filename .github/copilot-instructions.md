# Commit Convention Guidelines

## Conventional Commits

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

### Scope (Optional)

The scope should be the name of the area or module affected (e.g., components, api, auth, ui, etc.)

### Subject

The subject contains a succinct description of the change:

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
- No dot (.) at the end

### Body (Optional)

The body should include the motivation for the change and contrast this with previous behavior.

### Footer (Optional)

The footer should contain any information about Breaking Changes and is also the place to reference GitHub issues that this commit closes.

## Examples

### Simple commit
```
feat: add user authentication
```

### Commit with scope
```
fix(auth): resolve login token expiration issue
```

### Commit with body
```
feat(api): add job search endpoint

Implement a new REST API endpoint for searching job listings
with filters for location, salary, and job type.
```

### Breaking change
```
refactor(api)!: change authentication method

BREAKING CHANGE: Authentication now uses JWT tokens instead of session cookies.
All clients must update to use the new Authorization header format.
```

### Commit referencing an issue
```
fix(ui): correct job card layout on mobile

Fixes #123
```

## Best Practices

1. **Keep commits atomic**: Each commit should represent a single logical change
2. **Write clear subjects**: Be descriptive but concise (max 50 characters recommended)
3. **Use the body for context**: Explain "why" not "what" (the code shows "what")
4. **Reference issues**: Link related issues in the footer
5. **Test before committing**: Ensure your changes work as expected
6. **Don't commit sensitive data**: Never include passwords, API keys, or secrets

## Tools

Consider using tools to help enforce commit conventions:
- [Commitizen](https://github.com/commitizen/cz-cli) - Interactive commit message builder
- [Commitlint](https://github.com/conventional-changelog/commitlint) - Linter for commit messages
- [Husky](https://github.com/typicode/husky) - Git hooks to enforce conventions
