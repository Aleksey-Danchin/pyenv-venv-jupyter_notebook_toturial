← [Назад](../01-what-is-jupyter-notebook/README.md) | [Оглавление](../../README.md) | [Далее →](../03-notebook-server-interface/README.md)

# Тренажёр: Установка Jupyter внутри venv

> **Модуль 6 · Тренажёр 2** | Время: ~15 мин

## Цель

К концу тренажёра Jupyter будет установлен в виртуальное окружение, и команда `jupyter --version` покажет версию.

## Подготовка

- pyenv установлен (модуль 1).
- Вы умеете создавать и активировать venv (модули 4–5).
- Создайте директорию для практики, например `~/jupyter-practice`, и перейдите в неё.

---

## Шаг 1 — Подготовка окружения

Задайте версию Python через pyenv и создайте venv. Если у вас уже есть venv — можно использовать его.

```bash
cd ~/jupyter-practice
pyenv local 3.12.0
python -m venv venv
source venv/bin/activate
```

**Ожидаемый результат:**

Приглашение shell изменится, появится префикс `(venv)`. Команда `python --version` покажет Python 3.12.x.

> **Что произошло:** вы создали venv от Python 3.12 и активировали его. Все последующие команды `pip` и `jupyter` будут относиться к этому окружению.

---

## Шаг 2 — Установка Jupyter

Установите пакеты `jupyter` и `notebook`. Пакет `jupyter` — это метапакет, объединяющий JupyterLab, Notebook и другие компоненты; `notebook` — классический интерфейс Notebook.

```bash
pip install jupyter notebook
```

Команда `pip install jupyter notebook` устанавливает Jupyter Notebook и его зависимости (IPython, ipykernel и др.) в активированное venv.

**Ожидаемый результат:**

```
Collecting jupyter
  ...
Collecting notebook
  ...
Successfully installed jupyter-... notebook-... ...
```

> **Что произошло:** pip скачал пакеты с PyPI и установил их в `venv/lib/.../site-packages/`. Исполняемый файл `jupyter` появится в `venv/bin/`.

---

## Шаг 3 — Проверка установки

Убедитесь, что `jupyter` доступен и указывает на venv:

```bash
jupyter --version
which jupyter
```

Команда `jupyter --version` выводит версии установленных компонентов Jupyter. Команда `which jupyter` показывает путь к исполняемому файлу — он должен быть внутри venv.

**Ожидаемый результат:**

```
jupyter core     : 5.x.x
jupyter-notebook : 7.x.x
...
/home/<user>/jupyter-practice/venv/bin/jupyter
```

Путь к `jupyter` должен содержать `venv/bin` — значит, используется Jupyter из вашего окружения.

> **Что произошло:** активированный venv добавляет `venv/bin` в `PATH`, поэтому `jupyter` резолвится в ваше окружение, а не в системный Python.

---

## Итог

Jupyter установлен в venv. Следующий шаг — запуск notebook-сервера и работа в браузерном интерфейсе (урок 03).

## Проверка

```bash
jupyter --version && which jupyter | grep -q venv && echo "✅ Jupyter из venv"
```

**Ожидаемый результат:**

Версии Jupyter и строка `✅ Jupyter из venv`.

---

← [Назад](../01-what-is-jupyter-notebook/README.md) | [Оглавление](../../README.md) | [Далее →](../03-notebook-server-interface/README.md)
