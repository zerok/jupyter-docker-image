# Jupyter Docker image

This Docker image contains Jupyter including the following extensions:

- JupyterLab
- Pandas
- PyYAML
- Requests
- Matplotlib

Add the following line to your `.bashrc` or `.zshrc`:

```
eval $(docker run --rm zerok/jupyter bash-func)
```

This will register the function `lab` for starting the container with
default parameters.
