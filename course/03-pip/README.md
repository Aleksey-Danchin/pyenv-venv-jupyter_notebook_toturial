← [Предыдущий модуль](../02-pyenv-advanced/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../04-venv-basics/README.md)

# Модуль 3. pip и управление пакетами

> **Время:** ~2 дня (при темпе 1–2 часа в день)

## Чему вы научитесь

- Объяснять роль pip и PyPI в экосистеме Python.
- Устанавливать, удалять и обновлять пакеты через pip.
- Фиксировать набор пакетов в `requirements.txt` и воспроизводить окружение.
- Понимать, откуда pip загружает пакеты (PyPI, индексы, кеш).
- Разграничивать pip и системный пакетный менеджер (apt).

## Что будет рассмотрено

| Тема | Описание |
|------|----------|
| pip и PyPI | Менеджер пакетов Python и репозиторий пакетов. |
| Базовые операции | `pip install`, `pip uninstall`, `pip install --upgrade`, `pip show`. |
| requirements.txt | `pip freeze`, `pip list`, воспроизведение окружения. |
| Источники пакетов | PyPI, альтернативные индексы, кеш pip. |
| pip vs apt | Почему pip ≠ apt, риски смешивания. |

## Инструменты и команды

| Команда / инструмент | Назначение |
|---------------------|-----------|
| `pip install <package>` | Установить пакет. |
| `pip uninstall <package>` | Удалить пакет. |
| `pip install --upgrade <package>` | Обновить пакет. |
| `pip list` | Список установленных пакетов. |
| `pip freeze` | Список пакетов в формате requirements. |
| `pip install -r requirements.txt` | Установить пакеты из файла. |

## Содержание модуля

| # | Юнит | Тип | Время |
|---|------|-----|-------|
| 01 | [Что такое pip и PyPI](01-what-is-pip-pypi/README.md) | Урок | ~15 мин |
| 02 | [Установка, удаление, обновление пакетов](02-install-remove-update/README.md) | Урок | ~20 мин |
| 03 | [pip freeze, pip list и requirements.txt](03-freeze-list-requirements/README.md) | Урок | ~20 мин |
| 04 | [Откуда берутся пакеты: PyPI, индексы, кеш](04-pypi-indexes-cache/README.md) | Урок | ~15 мин |
| 05 | [Тест: pip-операции и requirements](05-test-pip-operations/README.md) | Тест | ~15 мин |
| 06 | [Лабораторная: pip-операции и requirements](06-lab-pip-operations/README.md) | Лабораторная | ~30 мин |
| 07 | [pip vs системный пакетный менеджер (apt)](07-pip-vs-apt/README.md) | Урок | ~15 мин |

---

## Итоги модуля

### Что вы изучили

- pip — менеджер пакетов Python, PyPI — репозиторий пакетов.
- Базовые операции: установка, удаление, обновление, просмотр информации о пакетах.
- Фиксация окружения через `pip freeze` и воспроизведение через `pip install -r requirements.txt`.
- Источники пакетов: PyPI, альтернативные индексы, кеш pip.
- Чёткое разграничение pip и apt — разные инструменты для разных задач.

### Чеклист навыков

Отметьте то, что вы уверенно можете сделать:

- [ ] Объяснить, чем pip отличается от apt.
- [ ] Установить пакет по имени и по версии.
- [ ] Удалить и обновить пакет через pip.
- [ ] Создать `requirements.txt` с помощью `pip freeze`.
- [ ] Воспроизвести окружение по `requirements.txt`.
- [ ] Объяснить разницу между `pip list` и `pip freeze`.

### Ключевые команды

```bash
pip install requests              # установить пакет
pip install requests==2.31.0      # установить конкретную версию
pip uninstall requests            # удалить пакет
pip install --upgrade requests    # обновить пакет
pip list                          # список установленных пакетов
pip freeze                        # список в формате requirements
pip freeze > requirements.txt     # сохранить в файл
pip install -r requirements.txt   # установить из файла
```

---
← [Предыдущий модуль](../02-pyenv-advanced/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../04-venv-basics/README.md)
