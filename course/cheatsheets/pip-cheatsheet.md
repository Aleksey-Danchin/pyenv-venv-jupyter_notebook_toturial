# Справочник: pip

> Краткий справочник команд pip. Подробные объяснения и контекст смотрите в соответствующих уроках курса.

## Проверка связки pip и Python

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip3 --version` | Показывает версию pip и путь к Python, на который он указывает. | `pip3 --version` |
| `python3 -m pip --version` | Запускает pip через конкретный интерпретатор Python. | `python3 -m pip --version` |

## Установка и удаление

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip install <package>` | Устанавливает пакет из PyPI. | `pip install requests` |
| `pip install <package>==<version>` | Устанавливает конкретную версию. | `pip install rich==13.7.0` |
| `pip install --upgrade <package>` | Обновляет пакет до последней версии. | `pip install --upgrade requests` |
| `pip uninstall <package>` | Удаляет установленный пакет. | `pip uninstall requests` |
| `pip install -r <file>` | Устанавливает пакеты из файла зависимостей. | `pip install -r requirements.txt` |

## Информация об установках

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip list` | Список установленных пакетов (удобочитаемый формат). | `pip list` |
| `pip freeze` | Список пакетов в формате для requirements.txt. | `pip freeze` |
| `pip show <package>` | Метаданные установленного пакета. | `pip show requests` |
| `python3 -m site` | Показывает пути `site-packages` и пользовательские директории Python. | `python3 -m site` |

## Индексы и кеш

| Команда | Описание | Пример |
|---------|----------|--------|
| `pip cache dir` | Путь к директории кеша pip. | `pip cache dir` |
| `pip cache purge` | Очистить кеш pip. | `pip cache purge` |
| `pip install --index-url <url>` | Указать альтернативный индекс пакетов. | `pip install --index-url https://...` |
| `pip install --no-cache-dir` | Установить без использования кеша. | `pip install --no-cache-dir requests` |

