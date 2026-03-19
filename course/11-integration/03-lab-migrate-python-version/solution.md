# Эталонное решение: Переключение проекта на другую версию Python (миграция)

## Шаги решения

1. **Установить целевую версию Python** (если отсутствует):
   ```bash
   pyenv install 3.12.0
   ```

2. **Перейти в директорию проекта и деактивировать venv** (если активирован):
   ```bash
   cd ~/m11-project-from-scratch
   deactivate   # если venv был активирован
   ```

3. **Обновить локальную версию Python:**
   ```bash
   pyenv local 3.12.0
   pyenv version   # проверить
   ```

4. **Удалить старый venv:**
   ```bash
   rm -rf venv
   ```

5. **Создать новый venv на базе новой версии:**
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```

6. **Восстановить зависимости:**
   ```bash
   pip install -r requirements.txt
   ```

7. **Удалить старое ядро** (если зарегистрировано под тем же именем):
   ```bash
   jupyter kernelspec remove m11-from-scratch
   ```
   (Если ядро не было зарегистрировано под этим именем — пропустить или использовать фактическое имя.)

8. **Зарегистрировать venv как ядро Jupyter:**
   ```bash
   python -m ipykernel install --user --name m11-from-scratch --display-name "Python (m11-from-scratch)"
   ```

9. **Проверить:**
   ```bash
   python --version
   jupyter kernelspec list
   jupyter notebook   # или jupyter lab — ядро должно быть доступно
   ```

## Ожидаемый результат

- `pyenv version` показывает выбранную версию (например, 3.12.0).
- `python --version` в активированном venv совпадает.
- `jupyter kernelspec list` содержит `m11-from-scratch`.
- Jupyter запускается, в Kernel → Change kernel доступно ядро проекта.
