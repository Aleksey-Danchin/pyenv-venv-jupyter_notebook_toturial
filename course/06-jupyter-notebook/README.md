← [Предыдущий модуль](../05-venv-advanced/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../07-jupyter-kernels/README.md)

# Модуль 6. Jupyter Notebook

> **Время:** ~3 дня (при темпе 1–2 часа в день)

## Чему вы научитесь

- Объяснять назначение Jupyter Notebook и его место в экосистеме Python.
- Устанавливать Jupyter в виртуальное окружение и запускать notebook-сервер.
- Ориентироваться в браузерном интерфейсе Jupyter.
- Создавать, переименовывать и удалять ноутбуки.
- Работать с типами ячеек (Code, Markdown, Raw) и горячими клавишами.
- Использовать магические команды для оболочки и shell.
- Экспортировать ноутбуки в HTML, PDF и .py.

## Что будет рассмотрено

| Тема | Описание |
|------|----------|
| Что такое Jupyter Notebook | Ноутбук как смесь кода и документации, сервер + браузерный интерфейс. |
| Установка в venv | pip install jupyter notebook, проверка версии. |
| Запуск сервера | jupyter notebook, token, порты, остановка сервера. |
| Управление ноутбуками | Создание, переименование, удаление .ipynb файлов. |
| Типы ячеек | Code, Markdown, Raw — назначение и переключение. |
| Горячие клавиши | Режимы (command/edit), выполнение, вставка, удаление, смена типа. |
| Магические команды | %timeit, %run, !команда, %env и др. |
| Экспорт | nbconvert, HTML, PDF, .py; File → Download as. |

## Инструменты и команды

| Команда / инструмент | Назначение |
|---------------------|-----------|
| `pip install jupyter notebook` | Установить Jupyter в активированное venv. |
| `jupyter --version` | Проверить версию Jupyter. |
| `jupyter notebook` | Запустить notebook-сервер (по умолчанию порт 8888). |
| `jupyter notebook --port <N>` | Запустить на указанном порту. |
| `jupyter nbconvert --to html` | Экспортировать ноутбук в HTML. |
| `jupyter nbconvert --to pdf` | Экспортировать ноутбук в PDF. |

## Содержание модуля

| # | Юнит | Тип | Время |
|---|------|-----|-------|
| 01 | [Что такое Jupyter Notebook](01-what-is-jupyter-notebook/README.md) | Урок | ~10 мин |
| 02 | [Установка Jupyter внутри venv](02-trainer-jupyter-install/README.md) | Тренажёр | ~15 мин |
| 03 | [Запуск notebook-сервера, интерфейс браузера](03-notebook-server-interface/README.md) | Урок | ~15 мин |
| 04 | [Создание, переименование, удаление ноутбуков](04-create-rename-delete-notebooks/README.md) | Урок | ~10 мин |
| 05 | [Типы ячеек: Code, Markdown, Raw](05-cell-types/README.md) | Урок | ~15 мин |
| 06 | [Базовые горячие клавиши](06-hotkeys/README.md) | Урок | ~10 мин |
| 07 | [Тест: установка, запуск, ячейки](07-test-jupyter-basics/README.md) | Тест | ~15 мин |
| 08 | [Лабораторная: установка, запуск, ячейки](08-lab-jupyter-basics/README.md) | Лабораторная | ~30 мин |
| 09 | [Магические команды](09-magic-commands/README.md) | Урок | ~15 мин |
| 10 | [Экспорт ноутбука](10-export-notebook/README.md) | Урок | ~15 мин |

---

## Итоги модуля

### Что вы изучили

- Jupyter Notebook — интерактивная среда для кода и документации: сервер + браузерный интерфейс.
- Jupyter устанавливается в venv через pip; сервер запускается командой `jupyter notebook`.
- Ноутбук (.ipynb) состоит из ячеек: Code (Python), Markdown (документация), Raw (как есть).
- Режим команд и режим редактирования; горячие клавиши для выполнения, вставки, удаления ячеек.
- Магические команды (`%` и `!`) — доступ к оболочке IPython и shell.
- nbconvert и File → Download as — экспорт в HTML, PDF, .py.

### Чеклист навыков

Отметьте то, что вы уверенно можете сделать:

- [ ] Объяснить, чем Jupyter Notebook отличается от обычного .py-скрипта.
- [ ] Установить Jupyter в venv и запустить notebook-сервер.
- [ ] Остановить сервер (Ctrl+C в терминале).
- [ ] Создать, переименовать и удалить ноутбук через интерфейс.
- [ ] Переключать типы ячеек (Code / Markdown / Raw).
- [ ] Использовать Shift+Enter, Ctrl+Enter, Esc/Enter для работы с ячейками.
- [ ] Вызвать `%timeit`, `!ls`, `%env` и аналогичные магические команды.
- [ ] Экспортировать ноутбук в HTML и .py.

### Ключевые команды

```bash
pip install jupyter notebook     # установить Jupyter в venv
jupyter --version                # проверить версию
jupyter notebook                  # запустить сервер
jupyter nbconvert --to html nb.ipynb   # экспорт в HTML
jupyter nbconvert --to script nb.ipynb # экспорт в .py
```

---
← [Предыдущий модуль](../05-venv-advanced/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../07-jupyter-kernels/README.md)
