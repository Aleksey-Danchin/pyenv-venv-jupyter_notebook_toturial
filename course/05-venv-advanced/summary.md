# Конспект: Модуль 5 — venv: продвинутое использование

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| Базовый Python venv | Интерпретатор, от которого создано окружение — «зашит» в pyvenv.cfg. |
| `requirements.txt` | Список зависимостей проекта; создаётся через `pip freeze`, используется для воспроизведения окружения. |
| Воспроизведение окружения | Создание нового venv и установка пакетов через `pip install -r requirements.txt`. |
| `--system-site-packages` | Флаг venv: окружение видит системные пакеты; по умолчанию не используется. |
| Dev/prod окружения | Раздельные venv для разработки и продакшена (разные версии пакетов). |

## Важно запомнить

- Сначала `pyenv local`, затем `python -m venv` — venv «запоминает» версию Python.
- `pip freeze > requirements.txt` только в активированном venv; иначе попадёт мусор.
- Для воспроизведения окружения нужны и `requirements.txt`, и `.python-version` (или явный выбор версии Python).
- venv — это директория; удаление = `rm -rf venv/` после деактивации.
- Несколько venv в одном проекте — для dev/prod или тестирования разных версий Python.

## Команды модуля

```bash
pyenv local 3.11.7                    # привязать версию к проекту
python -m venv venv                    # создать venv от текущего python
~/.pyenv/versions/3.11.7/bin/python -m venv venv   # явно указать интерпретатор
python -m venv --system-site-packages venv   # venv с доступом к системным пакетам
pip freeze > requirements.txt         # сохранить зависимости (в активированном venv!)
pip install -r requirements.txt       # воспроизвести зависимости
deactivate && rm -rf venv               # удалить окружение
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| venv создан от «не той» версии Python | Не задали pyenv local до создания venv | pyenv local; rm -rf venv; python -m venv venv |
| В requirements.txt попали лишние пакеты | freeze без активации venv | Активировать venv, затем pip freeze |
| Коллега не может воспроизвести окружение | Нет .python-version | Добавить .python-version и requirements.txt |
| pip ставит пакеты в систему | venv/bin/pip подменён или venv создан с --system-site-packages неправильно | Проверить which pip; пересоздать venv |
| venv не запускается | Удалена версия Python из pyenv | pyenv install <версия> снова; venv заработает |

## Схема: pyenv + venv + requirements

```
Проект/
├── .python-version          # pyenv: какая версия Python
├── requirements.txt        # pip: какие пакеты
├── venv/                   # изолированное окружение
│   ├── bin/python, pip
│   └── lib/.../site-packages/
└── venv-alt/               # второе окружение (dev/prod, тесты)
```
