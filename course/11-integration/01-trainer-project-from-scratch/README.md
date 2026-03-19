← [Назад](../README.md) | [Оглавление](../../README.md) | [Далее →](../02-trainer-project-jupyterlab/README.md)

# Тренажёр: Создание проекта с нуля — pyenv → venv → pip → jupyter → kernel

> **Модуль 11 · Тренажёр 1** | Время: ~25 мин

## Цель

Пройти полную цепочку настройки Python-проекта пошагово: от выбора версии Python до работающего Jupyter с зарегистрированным ядром. Это базовый сценарий, который вы будете использовать в реальной работе.

## Подготовка

- pyenv установлен и настроен (модуль 1)
- Установлена хотя бы одна версия Python через `pyenv install` (например, 3.11.7 или 3.12.0)
- Вы умеете создавать venv, активировать его и устанавливать пакеты (модули 4–5)
- Вы знакомы с регистрацией venv как ядра Jupyter (модуль 7)

## Шаг 1 — Создать директорию проекта и задать версию Python

```bash
mkdir -p ~/m11-project-from-scratch && cd ~/m11-project-from-scratch
pyenv local 3.12.0
```

> **Примечание:** подставьте вместо `3.12.0` версию, установленную у вас (`pyenv versions`). Если её нет — выполните `pyenv install 3.12.0` (или другую).

**Ожидаемый результат:**

Файл `.python-version` появится в директории. Команда `pyenv version` покажет выбранную версию.

> **Что произошло:** pyenv привязал версию Python к этой директории. Любой вызов `python` здесь будет использовать указанную версию.

---

## Шаг 2 — Создать и активировать venv

```bash
python -m venv .venv
source .venv/bin/activate
```

**Ожидаемый результат:** в приглашении терминала появится префикс `(.venv)`.

> **Что произошло:** venv создан на базе версии Python из pyenv (шаг 1). Все последующие установки пакетов будут изолированы в этом окружении.

---

## Шаг 3 — Установить Jupyter и ipykernel

```bash
pip install jupyter notebook ipykernel
```

**Ожидаемый результат:**

```
Successfully installed jupyter-... notebook-... ipykernel-...
```

> **Что произошло:** Jupyter Notebook и ipykernel установлены в venv. ipykernel нужен для регистрации окружения как ядра Jupyter.

---

## Шаг 4 — Зарегистрировать venv как ядро Jupyter

```bash
python -m ipykernel install --user --name=m11-from-scratch --display-name="Python (m11-from-scratch)"
```

**Ожидаемый результат:**

```
Installed kernelspec m11-from-scratch in /home/USERNAME/.local/share/jupyter/kernels/m11-from-scratch
```

> **Что произошло:** Jupyter узнал о новом ядре. При выборе Kernel → Change kernel в ноутбуке появится пункт «Python (m11-from-scratch)», связанный с этим venv.

---

## Шаг 5 — Запустить Jupyter Notebook

```bash
jupyter notebook
```

**Ожидаемый результат:** в браузере откроется интерфейс Jupyter. Создайте новый ноутбук — в списке ядер должен быть «Python (m11-from-scratch)».

> **Что произошло:** Jupyter Notebook запущен из активированного venv. Ноутбуки по умолчанию могут использовать системное ядро — выберите Kernel → Change kernel → «Python (m11-from-scratch)».

---

## Шаг 6 — Сохранить зависимости (опционально, для практики)

В **другом** терминале (или после остановки Jupyter):

```bash
cd ~/m11-project-from-scratch
source .venv/bin/activate
pip freeze > requirements.txt
```

**Ожидаемый результат:** файл `requirements.txt` создан в корне проекта.

> **Что произошло:** зависимости зафиксированы для воспроизведения окружения (см. модуль 5, 10).

---

## Итог

Вы прошли полную цепочку:

1. **pyenv local** — привязали версию Python к проекту
2. **venv** — создали изолированное окружение
3. **pip install** — установили Jupyter и ipykernel
4. **ipykernel install** — зарегистрировали окружение как ядро
5. **jupyter notebook** — запустили сервер

Порядок важен: сначала pyenv (какой Python), затем venv (на базе этого Python), затем пакеты и ядро.

## Проверка

```bash
bash check.sh
```

**Ожидаемый результат:** все пункты проверки помечены как PASS.

---
← [Назад](../README.md) | [Оглавление](../../README.md) | [Далее →](../02-trainer-project-jupyterlab/README.md)
