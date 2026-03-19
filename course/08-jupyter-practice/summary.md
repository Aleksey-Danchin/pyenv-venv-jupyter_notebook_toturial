# Конспект: Модуль 8 — Jupyter: практикум

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|--------|----------------------|
| pre-made ноутбук | Готовый .ipynb с контекстом и заданиями — отправная точка для практики. |
| воспроизведение проекта | Создание окружения на другой машине по requirements.txt + .ipynb + .python-version. |

## Важно запомнить

- matplotlib в Jupyter: данные из списков/словарей, `plt.plot()`, `plt.show()`.
- Markdown в ячейках: заголовки, списки, **жирный** — делают ноутбук читаемым.
- Магические команды: `%timeit`, `!pip`, `%env` — расширяют возможности ячейки.
- nbconvert экспортирует .ipynb в HTML, PDF, .py; для воспроизведения передавайте .ipynb.
- Для передачи проекта коллеге нужны: .ipynb, requirements.txt, .python-version.

## Команды модуля

```bash
jupyter nbconvert --to html notebook.ipynb    # экспорт в HTML
jupyter nbconvert --to script notebook.ipynb # экспорт в Python-скрипт
pip freeze > requirements.txt                 # зафиксировать зависимости
pip install -r requirements.txt              # воспроизвести окружение
jupyter notebook                             # запуск для работы с ноутбуком
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| Пустой график в matplotlib | Забыли `plt.show()` или выполнили ячейку не полностью | Добавить `plt.show()`, выполнить Cell → Run All |
| Экспорт PDF не работает | Не установлен LaTeX | `sudo apt install texlive-xetex` или экспорт в HTML → печать |
| Коллега не воспроизводит проект | Нет requirements.txt или .python-version | Добавить `pip freeze > requirements.txt`, `.python-version` |
| Забыли matplotlib в venv | requirements.txt не содержит matplotlib | Включить matplotlib в зависимости при freeze |

## Схема: передача проекта коллеге

```
Разработчик                          Коллега
─────────────                        ───────
.notebook/
  ├── project.ipynb     ──────────►   Скопировать файлы
  ├── requirements.txt
  └── .python-version

                                    pyenv local <version>
                                    python -m venv venv
                                    source venv/bin/activate
                                    pip install -r requirements.txt
                                    jupyter notebook
```
