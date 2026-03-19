# Эталонное решение: Jupyter использует системное ядро, а не venv

## Диагностика

1. В ноутбуке выполнить `import sys; print(sys.executable)` — путь указывает на системный Python (например, `/usr/bin/python3`), а не на venv.
2. В меню Kernel → Change kernel — venv отсутствует в списке доступных ядер.
3. Вывод `jupyter kernelspec list` — ядра с именем venv нет.

## Шаги решения

1. Активировать venv: `source kernels-debug-env/bin/activate`
2. Установить ipykernel: `pip install ipykernel`
3. Зарегистрировать venv как ядро:
   ```bash
   python -m ipykernel install --user --name kernels-debug-env --display-name "Python (kernels-debug-env)"
   ```
4. В Jupyter: Kernel → Change kernel → выбрать «Python (kernels-debug-env)».
5. Перезапустить ядро (Kernel → Restart) и выполнить `import requests`.

## Ожидаемый результат

- `import sys; print(sys.executable)` показывает путь внутри `kernels-debug-env`.
- `import requests` выполняется без ошибки.
