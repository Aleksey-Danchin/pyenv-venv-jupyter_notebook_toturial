# Конспект: Модуль 11 — Интеграция: сквозные сценарии

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| **Сквозной сценарий** | Полная цепочка от pyenv до Jupyter: pyenv local → venv → pip → ipykernel → jupyter, выполняемая по порядку. |
| **Миграция версии Python** | Переход проекта на другую версию: pyenv install → pyenv local → пересоздание venv → pip install -r requirements.txt → перерегистрация ядра. |
| **Воспроизведение окружения коллеги** | Создание идентичного окружения по `.python-version` и `requirements.txt`: pyenv install, venv, pip install -r. |
| **Конфликт pyenv local vs venv** | Ситуация, когда `.python-version` указывает на версию X, а venv построен на версии Y — приводит к путанице и неожиданному поведению. |

## Важно запомнить

- Порядок создания проекта: pyenv local → python -m venv → pip install (jupyter, ipykernel) → ipykernel install → jupyter.
- Jupyter и JupyterLab используют одни и те же ядра — venv достаточно зарегистрировать один раз.
- При миграции версии Python venv нужно пересоздать: старый venv привязан к старому интерпретатору.
- Корректное удаление проекта: deactivate → jupyter kernelspec remove → rm -rf venv → pyenv local --unset.
- При воспроизведении проекта коллеги сначала проверьте `.python-version` и `requirements.txt`.

## Команды модуля

```bash
# Полная цепочка создания проекта
pyenv local 3.12.0
python -m venv venv
source venv/bin/activate
pip install jupyter ipykernel
python -m ipykernel install --user --name <имя> --display-name "Python (<имя>)"
jupyter notebook   # или jupyter lab

# Миграция на другую версию
pyenv install 3.13.0
pyenv local 3.13.0
rm -rf venv && python -m venv venv
pip install -r requirements.txt
python -m ipykernel install --user --name <имя> --display-name "Python (<имя>)" --force

# Удаление проекта
deactivate
jupyter kernelspec remove <имя-ядра>
rm -rf venv
cd .. && pyenv local --unset
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| venv создан с «чужой» версией Python | Был активирован другой venv или pyenv local указывал на другую версию | deactivate, pyenv local <нужная>, пересоздать venv |
| Jupyter не видит пакеты venv | Ноутбук использует системное ядро, не venv | Зарегистрировать venv: ipykernel install |
| Миграция «не применилась» | Не пересоздали venv после смены pyenv local | rm -rf venv, python -m venv venv, pip install -r |
| Ядро осталось после удаления venv | Не удалили kernelspec | jupyter kernelspec remove <имя> |
| Не воспроизводится проект коллеги | Нет .python-version или устаревший requirements | Запросить оба файла, pyenv install по .python-version |

## Схема

```
Создание проекта:
  pyenv local 3.x  →  python -m venv venv  →  source venv/bin/activate
       →  pip install jupyter ipykernel  →  ipykernel install  →  jupyter

Удаление проекта:
  deactivate  →  kernelspec remove  →  rm -rf venv  →  pyenv local --unset

Воспроизведение:
  .python-version + requirements.txt  →  pyenv install  →  venv  →  pip install -r  →  ipykernel
```
