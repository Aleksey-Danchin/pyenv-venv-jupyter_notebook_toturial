← [Назад](../07-test-jupyter-basics/README.md) | [Оглавление](../../README.md) | [Далее →](../09-magic-commands/README.md)

# Лабораторная: Jupyter Notebook — установка, запуск и ячейки

> **Модуль 6 · Лабораторная** | Время: ~30 мин

## Задание

В директории `~/lab-jupyter-basics` (создайте её) выполните полный цикл:

1. Создайте виртуальное окружение и установите Jupyter Notebook.
2. Запустите notebook-сервер.
3. Создайте новый ноутбук и назовите его `intro.ipynb`.
4. Добавьте ячейку Code с кодом `print("Hello, Jupyter!")`, выполните её.
5. Добавьте ячейку Markdown с заголовком `## Введение` и кратким описанием.
6. Сохраните ноутбук и остановите сервер.

В конце проверьте: файл `~/lab-jupyter-basics/intro.ipynb` должен существовать и содержать обе ячейки.

## Требования

- Директория: `~/lab-jupyter-basics`
- Виртуальное окружение (venv)
- Jupyter установлен в venv
- Файл `intro.ipynb` с ячейкой Code (print) и ячейкой Markdown (## Введение)

## Подсказка 1

<details><summary>Показать подсказку</summary>

Создайте директорию: `mkdir -p ~/lab-jupyter-basics && cd ~/lab-jupyter-basics`. При необходимости используйте `pyenv local` для выбора версии Python. Создайте venv: `python -m venv venv`, активируйте: `source venv/bin/activate`. Установите Jupyter: `pip install jupyter notebook`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Запустите `jupyter notebook`. В браузере откроется интерфейс. Нажмите New → Python 3 (или Python (venv), если ядро от venv зарегистрировано). Создайте ячейку Code, введите `print("Hello, Jupyter!")`, выполните Shift+Enter. Добавьте ячейку (B в режиме команд), переключите на Markdown (M), введите `## Введение` и текст. Переименуйте ноутбук через File → Rename в `intro.ipynb`. Сохраните (Ctrl+S).

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Убедитесь, что ноутбук сохранён в `~/lab-jupyter-basics/`. Вернитесь в терминал и нажмите Ctrl+C дважды, чтобы остановить сервер. Проверьте: `ls ~/lab-jupyter-basics/intro.ipynb` и `ls ~/lab-jupyter-basics/venv`. Запустите `check.sh` из директории лабораторной для автоматической проверки.

</details>

## Самопроверка

```bash
ls ~/lab-jupyter-basics/intro.ipynb
ls ~/lab-jupyter-basics/venv
python3 -c "
import json
with open('/home/'"$(whoami)"'/lab-jupyter-basics/intro.ipynb') as f:
    nb = json.load(f)
cells = nb.get('cells', [])
types = [c['cell_type'] for c in cells]
assert 'code' in types, 'Нет ячейки Code'
assert 'markdown' in types, 'Нет ячейки Markdown'
code_cells = [c for c in cells if c['cell_type'] == 'code']
has_print = any('print' in ''.join(c.get('source', [])) for c in code_cells)
assert has_print, 'В Code-ячейке нет print'
print('OK')
"
```

**Ожидаемый результат:** файл существует, `OK` в конце.

---
← [Назад](../07-test-jupyter-basics/README.md) | [Оглавление](../../README.md) | [Далее →](../09-magic-commands/README.md)
