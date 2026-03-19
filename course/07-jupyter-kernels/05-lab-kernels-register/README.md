← [Назад](../04-test-kernels/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-debug-system-kernel/README.md)

# Лабораторная: ядра, регистрация, переключение

> **Модуль 7 · Лабораторная 5** | Время: ~25 мин

## Задание

Создайте виртуальное окружение, установите в него Jupyter и ipykernel, зарегистрируйте это окружение как ядро Jupyter, запустите Jupyter, создайте ноутбук, переключите ядро на зарегистрированное и проверьте, что код выполняется в нужном окружении.

## Требования

1. venv создан в директории `~/kernels-lab/venv` (или аналогичной).
2. В venv установлены `jupyter`, `notebook`, `ipykernel`.
3. venv зарегистрирован как ядро с display-name вида «Python (kernels-lab)» или подобным.
4. В ноутбуке выполнено `import sys; print(sys.executable)` — путь указывает на Python внутри вашего venv.
5. `jupyter kernelspec list` показывает ваше ядро.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Создайте venv, активируйте его, установите пакеты. Помните: `ipykernel` нужно ставить в то окружение, которое станет ядром.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Команда регистрации: `python -m ipykernel install --user --name kernels-lab --display-name "Python (kernels-lab)"`. Имена можно изменить под вашу директорию.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

После регистрации запустите `jupyter notebook` из активированного venv. Создайте новый ноутбук. По умолчанию может быть системное ядро — переключите через Kernel → Change kernel на зарегистрированное. В ячейке выполните `import sys; print(sys.executable)` и убедитесь, что путь ведёт в `venv/bin/python`.

</details>

## Самопроверка

```bash
# Из директории с venv, после активации:
jupyter kernelspec list
```

**Ожидаемый результат:** в списке есть ядро с вашим display-name (например, «Python (kernels-lab)»).

Или выполните скрипт проверки (из любой директории, путь к venv по умолчанию `~/kernels-lab`):

```bash
bash /путь/к/07-jupyter-kernels/05-lab-kernels-register/check.sh ~/kernels-lab
```

Либо, если вы в `~/kernels-lab`: `bash check.sh` из директории лабораторной с передачей пути.

---
← [Назад](../04-test-kernels/README.md) | [Оглавление](../../README.md) | [Далее →](../06-lab-debug-system-kernel/README.md)
