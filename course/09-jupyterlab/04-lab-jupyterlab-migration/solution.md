# Эталонное решение: работа в JupyterLab (миграция с Notebook)

## Шаги решения

1. **Подготовка окружения.** Убедитесь, что JupyterLab установлен в venv (как в тренажёре 02): `source ~/jupyterlab-demo/.venv/bin/activate`, `pip show jupyterlab`. Если venv создан с другим путём — используйте его.

2. **Регистрация ядра (если ещё не сделано).** Зарегистрируйте venv как ядро Jupyter:
   ```bash
   source ~/jupyterlab-demo/.venv/bin/activate
   python -m ipykernel install --user --name=jupyterlab-demo --display-name="Python (jupyterlab-demo)"
   ```

3. **Запуск JupyterLab.** Из активированного venv:
   ```bash
   jupyter lab
   ```

4. **Открытие ноутбука.** Через файловый менеджер (слева) перейдите к директории с .ipynb (например, `course/08-jupyter-practice/01-lab-data-visualization/`) и дважды щёлкните по `practice-data-visualization.ipynb`. Либо File → Open и выберите файл.

5. **Проверка ядра.** В ноутбуке выберите Kernel → Change kernel → «Python (jupyterlab-demo)» (или ваше ядро). В новой ячейке выполните:
   ```python
   import sys
   print(sys.executable)
   ```
   Путь должен указывать на Python внутри вашего venv.

6. **Элементы интерфейса.** Используйте боковую панель (файловый менеджер), перетаскивание вкладок; File → New → Terminal — встроенный терминал. В терминале `which python` покажет путь к Python из venv.

## Ожидаемый результат

- JupyterLab открыт в браузере, ноутбук отображается во вкладке.
- `sys.executable` в ячейке — путь внутри venv.
- Файловый менеджер и терминал доступны в интерфейсе.
