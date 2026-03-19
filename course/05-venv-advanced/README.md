← [Предыдущий модуль](../04-venv-basics/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../06-jupyter-notebook/README.md)

# Модуль 5. venv: продвинутое использование

> **Время:** ~3 дня (при темпе 1–2 часа в день)

## Чему вы научитесь

- Создавать venv на базе конкретной версии Python из pyenv.
- Использовать requirements.txt в контексте venv: создавать и воспроизводить окружения.
- Организовывать несколько окружений для одного проекта (dev/prod, разные версии Python).
- Понимать флаг `--system-site-packages` и когда он оправдан.
- Корректно удалять виртуальные окружения.
- Диагностировать типичные поломки: pip в venv указывает на системный, сломанный venv после удаления Python из pyenv.

## Что будет рассмотрено

| Тема | Описание |
|------|----------|
| venv + pyenv | Создание venv от выбранной версии Python, связка pyenv local → venv. |
| requirements.txt в venv | pip freeze, воспроизведение окружения на другой машине или в новом venv. |
| Множественные окружения | Несколько venv в одном проекте: когда нужно, как именовать. |
| --system-site-packages | Доступ к системным пакетам в venv, когда использовать, риски. |
| Удаление venv | Деактивация и удаление директории, почему спецкоманды не нужны. |
| Диагностика pip→системный | Ситуация, когда pip в venv ставит пакеты в системный Python. |
| Диагностика сломанного venv | venv указывает на удалённую версию Python. |

## Инструменты и команды

| Команда / инструмент | Назначение |
|---------------------|-----------|
| `pyenv local <version>` | Зафиксировать версию Python для проекта (перед созданием venv). |
| `python -m venv <dir>` | Создать venv от текущего python (после pyenv local). |
| `pip freeze > requirements.txt` | Зафиксировать зависимости активированного окружения. |
| `pip install -r requirements.txt` | Воспроизвести окружение по файлу зависимостей. |
| `python -m venv --system-site-packages <dir>` | Создать venv с доступом к системным site-packages. |
| `rm -rf venv/` | Удалить виртуальное окружение (после deactivate). |

## Содержание модуля

| # | Юнит | Тип | Время |
|---|------|-----|-------|
| 01 | [Создание venv на базе версии Python из pyenv](01-venv-from-pyenv-version/README.md) | Урок | ~15 мин |
| 02 | [requirements.txt в контексте venv](02-requirements-in-venv/README.md) | Урок | ~15 мин |
| 03 | [Несколько окружений для одного проекта](03-multiple-envs-per-project/README.md) | Урок | ~15 мин |
| 04 | [--system-site-packages](04-system-site-packages/README.md) | Урок | ~15 мин |
| 05 | [Удаление окружения](05-removing-venv/README.md) | Урок | ~10 мин |
| 06 | [Тест: venv + pyenv, requirements](06-test-venv-advanced/README.md) | Тест | ~15 мин |
| 07 | [Лабораторная: venv + pyenv, requirements](07-lab-venv-pyenv-requirements/README.md) | Лабораторная | ~30 мин |
| 08 | [Диагностика: pip в venv указывает на системный](08-lab-debug-pip-system/README.md) | Диагностика | ~15 мин |
| 09 | [Диагностика: сломанный venv](09-lab-debug-broken-venv/README.md) | Диагностика | ~15 мин |

---

## Итоги модуля

### Что вы изучили

- venv создаётся от интерпретатора, выбранного pyenv (глобально, локально или для сессии).
- requirements.txt фиксирует зависимости; воспроизведение: pyenv local + venv + pip install -r.
- Несколько venv в одном проекте — для dev/prod, тестирования разных версий Python.
- `--system-site-packages` даёт доступ к системным пакетам; использовать только при необходимости.
- venv — это директория; удаление = deactivate + rm -rf.
- Типичные поломки: venv с флагом system-site-packages, venv от удалённой версии Python.

### Чеклист навыков

Отметьте то, что вы уверенно можете сделать:

- [ ] Создать venv от нужной версии Python через pyenv local.
- [ ] Сформировать requirements.txt и воспроизвести окружение в новом venv.
- [ ] Объяснить, когда нужны несколько venv в одном проекте.
- [ ] Объяснить, что делает `--system-site-packages` и почему не использовать по умолчанию.
- [ ] Удалить venv корректно (деактивация, rm -rf).
- [ ] Диагностировать ситуацию, когда pip в venv ставит в системный Python.
- [ ] Исправить сломанный venv после удаления версии Python из pyenv.

### Ключевые команды

```bash
pyenv local 3.12.0                    # зафиксировать версию Python для проекта
python -m venv venv                  # создать venv (после pyenv local)
pip freeze > requirements.txt        # зафиксировать зависимости
pip install -r requirements.txt      # воспроизвести окружение
python -m venv --system-site-packages venv   # venv с доступом к системным пакетам
deactivate && rm -rf venv             # удалить venv
```

---
← [Предыдущий модуль](../04-venv-basics/README.md) | [Оглавление](../README.md) | [Следующий модуль →](../06-jupyter-notebook/README.md)
