← [Назад](../02-gitignore-python/README.md) | [Оглавление](../../README.md) | [Далее →](../04-basic-git/README.md)

# requirements.txt vs requirements-dev.txt

> **Модуль 10 · Урок 3** | Время: ~10 мин

## Зачем разделять зависимости

**Production-зависимости** — пакеты, без которых приложение не запустится: `requests`, `flask`, `pandas`. Они нужны и разработчику, и серверу, где развёрнуто приложение.

**Dev-зависимости** — инструменты разработки и тестирования: `pytest`, `black`, `jupyter`, `ipykernel`. На production-сервере они не нужны и могут даже создавать риски (лишние пакеты, больший образ при контейнеризации).

Разделение упрощает воспроизведение окружения: коллега или CI может установить только необходимое для запуска, а разработчик — дополнительно dev-инструменты.

## requirements.txt — production

Содержит только то, что нужно для работы приложения:

```
requests==2.31.0
rich==13.7.0
```

Формат: `package==version` (как в выводе `pip freeze`). Зафиксированные версии обеспечивают воспроизводимость.

Установка:

```bash
pip install -r requirements.txt
```

## requirements-dev.txt — разработка

Содержит dev-инструменты. Часто ссылается на `requirements.txt`, чтобы не дублировать production-зависимости:

```
-r requirements.txt
pytest>=7.0.0
black>=23.0.0
jupyter
ipykernel
```

Строка `-r requirements.txt` подключает все зависимости из основного файла. Остальные — дополнения для разработки.

Установка (сначала production, потом dev):

```bash
pip install -r requirements.txt
pip install -r requirements-dev.txt
```

Или одной командой:

```bash
pip install -r requirements-dev.txt
```

## Что куда класть

| Тип | Примеры | Файл |
|-----|---------|------|
| Приложение, библиотеки | requests, flask, pandas, numpy | requirements.txt |
| Тестирование | pytest, pytest-cov, coverage | requirements-dev.txt |
| Форматирование и линтинг | black, ruff, flake8 | requirements-dev.txt |
| Jupyter и ядра | jupyter, jupyterlab, ipykernel | requirements-dev.txt |
| Сборка и публикация | build, twine | requirements-dev.txt |

## Альтернативы

- **pip-tools** (`pip-compile`) — генерирует зафиксированные `requirements.txt` из `pyproject.toml` или `setup.py`.
- **Poetry**, **pipenv** — отдельные инструменты управления зависимостями, выходящие за рамки этого курса.

Для проектов на venv + pip достаточно пары `requirements.txt` и `requirements-dev.txt`.

## Частые ошибки

### Ошибка 1 — Всё в одном файле

Jupyter, pytest, black и production-библиотеки в одном `requirements.txt` — окружение раздувается, на сервере ставятся лишние пакеты. Разделяйте production и dev.

### Ошибка 2 — Не документировать dev-зависимости

Если вы используете `pytest` и `black`, но не указываете их в `requirements-dev.txt`, коллега не сможет запустить тесты и форматирование. Все dev-инструменты должны быть зафиксированы.

### Ошибка 3 — Забыть `-r requirements.txt` в requirements-dev.txt

Без этой строки при установке только `requirements-dev.txt` production-зависимости не подтянутся. Либо добавьте `-r requirements.txt` в начало `requirements-dev.txt`, либо устанавливайте оба файла по очереди.

---
← [Назад](../02-gitignore-python/README.md) | [Оглавление](../../README.md) | [Далее →](../04-basic-git/README.md)
