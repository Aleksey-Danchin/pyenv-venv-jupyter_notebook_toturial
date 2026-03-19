# Эталонное решение: Воспроизведение окружения по requirements.txt и .python-version

## Шаги решения

1. Создать директорию и подготовить файлы:
   ```bash
   mkdir -p ~/m11-colleague-reproduce
   cd ~/m11-colleague-reproduce
   echo "3.11.7" > .python-version
   cat > requirements.txt << 'EOF'
   jupyter>=1.0.0
   ipykernel>=6.0.0
   requests>=2.28.0
   EOF
   ```

2. Установить Python (если не установлен) и привязать к проекту:
   ```bash
   pyenv install 3.11.7   # если ещё нет
   pyenv local 3.11.7
   ```

3. Создать venv и установить зависимости:
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

4. Зарегистрировать venv как ядро Jupyter:
   ```bash
   python -m ipykernel install --user --name=m11-colleague-env --display-name="Python (m11-colleague-env)"
   ```

5. Проверка:
   ```bash
   python -c "import requests; import jupyter; print('OK')"
   jupyter kernelspec list
   ```

## Ожидаемый результат

- `python -c "import requests; import jupyter; print('OK')"` выводит `OK`
- В списке ядер присутствует `m11-colleague-env`
