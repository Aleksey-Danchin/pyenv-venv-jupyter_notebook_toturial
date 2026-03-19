← [Назад](../01-kernels-intro/README.md) | [Оглавление](../../README.md) | [Далее →](../03-manage-kernels/README.md)

# Тренажёр: Регистрация venv как ядра Jupyter (ipykernel)

> **Модуль 7 · Тренажёр 2** | Время: ~20 мин

## Цель

Установить пакет ipykernel в виртуальное окружение и зарегистрировать это окружение как ядро Jupyter, чтобы можно было выбирать его в Kernel → Change kernel.

## Подготовка

- Python установлен (через pyenv или системный)
- Вы умеете создавать и активировать venv (модуль 4)
- Jupyter установлен в каком-либо окружении и запускается (модуль 6)

## Шаг 1 — Создать и активировать venv

Создайте виртуальное окружение в отдельной директории (например, `~/jupyter-kernel-demo`):

```bash
mkdir -p ~/jupyter-kernel-demo && cd ~/jupyter-kernel-demo
python -m venv .venv
source .venv/bin/activate
```

**Ожидаемый результат:** в приглашении терминала появляется префикс `(.venv)`.

> **Что произошло:** venv создан и активирован. Все последующие команды `python` и `pip` будут работать внутри этого окружения.

---

## Шаг 2 — Установить ipykernel

Установите пакет ipykernel в активированном venv:

```bash
pip install ipykernel
```

**Ожидаемый результат:**

```
Successfully installed ipykernel-...
```

> **Что произошло:** ipykernel добавлен в окружение. Теперь можно зарегистрировать это окружение как ядро Jupyter.

---

## Шаг 3 — Зарегистрировать окружение как ядро

Выполните команду регистрации. Флаг `--user` сохраняет ядро в домашней директории пользователя. `--name` — внутреннее имя ядра (латиница, без пробелов). `--display-name` — отображаемое имя в списке Jupyter:

```bash
python -m ipykernel install --user --name=jupyter-kernel-demo --display-name="Python (jupyter-kernel-demo)"
```

**Ожидаемый результат:**

```
Installed kernelspec jupyter-kernel-demo in /home/USERNAME/.local/share/jupyter/kernels/jupyter-kernel-demo
```

> **Что произошло:** Jupyter зарегистрировал новое ядро. При выборе Kernel → Change kernel в ноутбуке появится пункт «Python (jupyter-kernel-demo)», который будет запускать Python из этого venv.

---

## Шаг 4 — Проверить список ядер

Убедитесь, что ядро появилось в списке:

```bash
jupyter kernelspec list
```

**Ожидаемый результат:**

```
Available kernels:
  jupyter-kernel-demo    /home/USERNAME/.local/share/jupyter/kernels/jupyter-kernel-demo
  python3               /home/USERNAME/.local/share/jupyter/kernels/python3
```

> **Что произошло:** Команда `jupyter kernelspec list` показывает все зарегистрированные ядра и пути к их описаниям (kernelspec).

---

## Итог

Вы создали venv, установили в него ipykernel, зарегистрировали окружение как ядро Jupyter. Теперь при запуске Jupyter (из любого окружения) в меню Kernel → Change kernel будет доступно новое ядро «Python (jupyter-kernel-demo)».

## Проверка

Выполните скрипт проверки (из директории юнита или указав полный путь):

```bash
bash check.sh
```

**Ожидаемый результат:** все пункты проверки помечены как PASS.

---
← [Назад](../01-kernels-intro/README.md) | [Оглавление](../../README.md) | [Далее →](../03-manage-kernels/README.md)
