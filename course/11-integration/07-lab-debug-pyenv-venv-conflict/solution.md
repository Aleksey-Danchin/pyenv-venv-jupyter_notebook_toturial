# Эталонное решение: Конфликт pyenv local vs venv от другой версии

## Диагностика

1. `cat .python-version` — показывает `3.11.7`.
2. `./venv/bin/python --version` — показывает `Python 3.12.x`.
3. Ядро Jupyter «Python (m11-debug-conflict)» использует Python 3.12.
4. **Причина:** venv был создан, когда `pyenv local` указывал на 3.12.5. Затем `.python-version` изменили на 3.11.7, но venv «привязан» к той версии, с которой создан.

## Шаги решения

1. Удалить venv:
   ```bash
   cd ~/m11-debug-conflict
   deactivate 2>/dev/null || true
   rm -rf venv
   ```

2. Удалить старое ядро:
   ```bash
   jupyter kernelspec remove m11-debug-conflict 2>/dev/null || true
   ```

3. Убедиться, что `pyenv local` указывает на 3.11.7:
   ```bash
   pyenv local 3.11.7
   pyenv version   # должно показать 3.11.7
   ```

4. Создать venv заново на правильной версии:
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install ipykernel
   python -m ipykernel install --user --name m11-debug-conflict --display-name "Python (m11-debug-conflict)"
   deactivate
   ```

## Ожидаемый результат

- `pyenv version` → 3.11.7
- `source venv/bin/activate && python --version` → Python 3.11.7
- Ядро «Python (m11-debug-conflict)» использует Python 3.11.7
