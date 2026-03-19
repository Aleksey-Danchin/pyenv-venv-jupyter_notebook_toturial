← [Назад](../01-venv-from-pyenv-version/README.md) | [Оглавление](../../README.md) | [Далее →](../03-multiple-envs-per-project/README.md)

# requirements.txt в контексте venv — создание и воспроизведение

> **Модуль 5 · Урок 2** | Время: ~15 мин

## Workflow: от установки к воспроизведению

В модуле 3 вы познакомились с `pip freeze` и `requirements.txt`[^глоссарий]. В venv этот workflow приобретает конкретный смысл: вы фиксируете зависимости *именно этого* окружения проекта.

[^глоссарий]: [Глоссарий](../../references/glossary.md)

Типичная последовательность:

1. Создать venv и активировать его.
2. Установить нужные пакеты: `pip install requests rich`.
3. Зафиксировать список: `pip freeze > requirements.txt`.
4. Закоммитить `requirements.txt` и `.python-version` в репозиторий.
5. Коллега или вы на другой машине: `pyenv install` (если нужно), `pyenv local`, `python -m venv venv`, `source venv/bin/activate`, `pip install -r requirements.txt`.

## Создание requirements.txt

Убедитесь, что venv активирован (в prompt должен быть префикс окружения):

```bash
source venv/bin/activate
pip install requests rich
pip freeze > requirements.txt
cat requirements.txt
```

**Ожидаемый результат (пример):**

```
certifi==2024.2.2
charset-normalizer==3.3.2
idna==3.7
requests==2.31.0
rich==13.7.0
urllib3==2.2.0
```

Файл содержит все установленные пакеты, включая транзитивные зависимости. Это гарантирует воспроизводимость — те же версии на любой машине.

## Воспроизведение окружения

На «чистой» машине или в новом клоне проекта:

```bash
cd project/
cat .python-version   # например: 3.11.7
pyenv install 3.11.7  # если версия ещё не установлена
pyenv local 3.11.7
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

После этого окружение коллеги воспроизведено.

## Зачем .python-version

`requirements.txt` фиксирует только пакеты, но не версию Python. Разные версии Python могут по-разному обрабатывать одни и те же пакеты. Файл `.python-version` (создаётся `pyenv local`) явно указывает версию интерпретатора. Вместе `requirements.txt` + `.python-version` дают полную картину окружения.

## Удаление venv из requirements.txt (опционально)

По умолчанию `pip freeze` выводит *все* пакеты, включая те, что установились как зависимости. Иногда проект хотят описать только прямыми зависимостями — тогда `requirements.txt` редактируют вручную, оставляя только нужные строки. Для строгой воспроизводимости полный `pip freeze` надёжнее.

---
← [Назад](../01-venv-from-pyenv-version/README.md) | [Оглавление](../../README.md) | [Далее →](../03-multiple-envs-per-project/README.md)
