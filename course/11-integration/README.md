← [Предыдущий модуль](../10-project-practice/README.md) | [Оглавление](../README.md) | Курс завершён ✓

# Модуль 11. Интеграция: сквозные сценарии

> **Время:** ~3–4 дня (при темпе 1–2 часа в день)

## Чему вы научитесь

- Собирать полную цепочку pyenv → venv → pip → Jupyter → kernel с нуля
- Адаптировать сценарий с JupyterLab вместо Jupyter Notebook
- Мигрировать проект на другую версию Python
- Работать с несколькими проектами одновременно (разные Python, окружения, ядра)
- Корректно удалять проект: деактивировать, удалить venv, удалить ядро
- Воспроизводить окружение коллеги по `requirements.txt` и `.python-version`
- Диагностировать конфликт `pyenv local` vs venv от другой версии
- Проходить полный цикл «от нуля до воспроизведения» по всему курсу

## Что будет рассмотрено

| Тема | Описание |
|------|----------|
| Проект с нуля | Полная цепочка: pyenv, venv, pip, jupyter, ipykernel, регистрация ядра |
| JupyterLab | Тот же сценарий с JupyterLab вместо Notebook |
| Миграция версии | Переключение проекта на другую версию Python (pyenv local, новый venv, переустановка пакетов) |
| Два проекта | Параллельная работа: разные .python-version, venv, ядра |
| Удаление проекта | Деактивация, удаление venv, удаление ядра, pyenv local --unset |
| Онбординг коллеги | Воспроизведение по requirements.txt и .python-version |
| Диагностика | Конфликт pyenv local vs активированный venv от другой версии |
| Финальная лабораторная | Снежный ком по всем модулям курса |

## Инструменты и команды

| Команда / инструмент | Назначение |
|---------------------|-----------|
| `pyenv install` / `pyenv local` | Установка и привязка версии Python |
| `python -m venv` | Создание виртуального окружения |
| `pip install -r requirements.txt` | Воспроизведение зависимостей |
| `python -m ipykernel install --user` | Регистрация venv как ядра Jupyter |
| `jupyter kernelspec remove` | Удаление ядра |
| `deactivate` | Деактивация venv перед удалением |

## Содержание модуля

| # | Юнит | Тип | Время |
|---|------|-----|-------|
| 01 | [Создание проекта с нуля: pyenv → venv → pip → jupyter → kernel](01-trainer-project-from-scratch/README.md) | Тренажёр | ~25 мин |
| 02 | [Тот же проект с JupyterLab вместо Notebook](02-trainer-project-jupyterlab/README.md) | Тренажёр | ~20 мин |
| 03 | [Переключение проекта на другую версию Python (миграция)](03-lab-migrate-python-version/README.md) | Лабораторная | ~25 мин |
| 04 | [Два проекта одновременно](04-lab-two-projects/README.md) | Лабораторная | ~30 мин |
| 05 | [Удаление проекта: деактивация, venv, ядро, очистка](05-trainer-project-removal/README.md) | Урок + Тренажёр | ~20 мин |
| 06 | [«Коллега прислал проект» — воспроизведение по requirements и .python-version](06-lab-reproduce-colleague-project/README.md) | Лабораторная | ~25 мин |
| 07 | [Диагностика: конфликт pyenv local vs venv от другой версии](07-lab-debug-pyenv-venv-conflict/README.md) | Диагностика | ~20 мин |
| 08 | [Финальная лабораторная — полный цикл](08-lab-final-integration/README.md) | Лабораторная | ~45 мин |

---

## Итоги модуля

### Что вы изучили

- Полную цепочку создания Python-проекта с Jupyter: pyenv → venv → pip → jupyter/ipykernel.
- Миграцию проекта на другую версию Python и работу с несколькими проектами одновременно.
- Корректное удаление проекта: порядок шагов, почему он важен.
- Воспроизведение окружения по файлам коллеги (requirements.txt, .python-version).
- Диагностику конфликта pyenv local и venv от другой версии.
- Интеграцию всех инструментов курса в единый рабочий процесс.

### Чеклист навыков

Отметьте то, что вы уверенно можете сделать:

- [ ] Создать проект с нуля: pyenv → venv → pip → jupyter → kernel
- [ ] Запустить тот же проект в JupyterLab
- [ ] Мигрировать проект на другую версию Python
- [ ] Работать с двумя проектами (разные Python, venv, ядра)
- [ ] Корректно удалить проект (deactivate, rm venv, kernelspec remove, pyenv local --unset)
- [ ] Воспроизвести окружение по requirements.txt и .python-version
- [ ] Диагностировать конфликт pyenv local vs venv от другой версии

### Ключевые команды

```bash
# Полная цепочка создания проекта
pyenv install 3.12.0
pyenv local 3.12.0
python -m venv venv
source venv/bin/activate
pip install jupyter ipykernel
python -m ipykernel install --user --name myenv --display-name "Python (myenv)"

# Удаление проекта
deactivate
jupyter kernelspec remove myenv
rm -rf venv/
pyenv local --unset
```

---
← [Предыдущий модуль](../10-project-practice/README.md) | [Оглавление](../README.md) | Курс завершён ✓
