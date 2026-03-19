← [Назад](../03-jupyterlab-interface/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Лабораторная: работа в JupyterLab (миграция с Notebook)

> **Модуль 9 · Лабораторная 4** | Время: ~30 мин

## Задание

Перенесите рабочий процесс с Jupyter Notebook на JupyterLab. Откройте существующий ноутбук (из модулей 6–8 или свой), выполните типичные действия в JupyterLab: создание ячеек, запуск кода, использование встроенного терминала и файлового менеджера. Убедитесь, что ядро venv работает корректно.

## Требования

1. JupyterLab установлен в venv (см. тренажёр 02).
2. Открыт хотя бы один ноутбук (.ipynb) в JupyterLab.
3. В ноутбуке выполнена проверка: `import sys; print(sys.executable)` — путь указывает на Python внутри вашего venv (ядро venv активно).
4. Использованы элементы интерфейса: файловый менеджер (боковая панель), вкладки.
5. (Опционально) Открыт встроенный терминал в JupyterLab и выполнена команда (например, `pwd` или `which python`).

## Подсказка 1

<details><summary>Показать подсказку</summary>

В качестве ноутбука используйте любой .ipynb из модуля 8 (например, `course/08-jupyter-practice/01-lab-data-visualization/practice-data-visualization.ipynb`) или создайте простой ноутбук с одной ячейкой. Запустите `jupyter lab` из активированного venv и откройте файл через File → Open или через файловый менеджер.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Если ядро по умолчанию — системный Python, переключите через Kernel → Change kernel на зарегистрированное ядро вашего venv (модуль 7). Проверка: в ячейке выполните `import sys; print(sys.executable)` — путь должен содержать `venv` или вашу директорию окружения.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Встроенный терминал: File → New → Terminal (или кнопка + в Launcher, вкладка Terminal). Терминал наследует окружение, в котором запущен JupyterLab — если JupyterLab запущен из активированного venv, то `which python` покажет путь к Python из venv.

</details>

## Самопроверка

```bash
# Из активированного venv с установленным JupyterLab:
jupyter lab --version
```

**Ожидаемый результат:** вывод версии JupyterLab (например, `4.x.x`).

Проверка ядра — в открытом ноутбуке выполните в ячейке:

```python
import sys
print(sys.executable)
```

**Ожидаемый результат:** путь к Python внутри вашего venv (например, `/home/.../jupyterlab-demo/.venv/bin/python`).

Либо выполните скрипт проверки (путь к venv передаётся первым аргументом, по умолчанию `~/jupyterlab-demo`):

```bash
bash /путь/к/09-jupyterlab/04-lab-jupyterlab-migration/check.sh
```

или, если используете другой venv:

```bash
bash check.sh /путь/к/вашему/venv
```

---
← [Назад](../03-jupyterlab-interface/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)
