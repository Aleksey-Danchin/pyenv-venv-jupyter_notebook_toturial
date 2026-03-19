← [Назад](../05-lab-kernels-register/README.md) | [Оглавление](../../README.md) | [Далее →](../07-lab-debug-multiple-servers/README.md)

# Лабораторная-диагностика: Jupyter использует системное ядро, а не venv

> **Модуль 7 · Диагностика 6** | Время: ~20 мин

## Сценарий

Коллега настроил Jupyter в виртуальном окружении проекта, установил туда нужные пакеты. Но при выполнении кода в ноутбуке `import` падает с ошибкой «ModuleNotFoundError», хотя в терминале `pip list` показывает, что пакет установлен.

## Воспроизведение проблемы

Запустите скрипт, создающий «сломанное» состояние:

```bash
bash break.sh
```

Скрипт создаст venv, установит Jupyter и пакет `requests`, но **не зарегистрирует** venv как ядро Jupyter. Ноутбук по умолчанию будет использовать системное ядро Python.

## Симптомы

- Jupyter запущен из активированного venv (в терминале `which jupyter` показывает путь внутри venv).
- В ячейке `import requests` вызывает `ModuleNotFoundError`.
- В терминале с активированным venv команда `python -c "import requests"` выполняется без ошибки.
- В ячейке `import sys; print(sys.executable)` показывает путь к системному Python, а не к venv.

## Задание

Найдите причину проблемы и исправьте её так, чтобы ноутбук выполнял код в окружении venv.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Проверьте, какой Python использует ядро: в ячейке выполните `import sys; print(sys.executable)`. Сравните с путём `which python` в активированном venv. Если они не совпадают — проблема в выборе ядра.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Jupyter показывает в меню Kernel → Change kernel список зарегистрированных ядер. Если venv не зарегистрирован как ядро — его там не будет. Нужно установить ipykernel в venv и зарегистрировать окружение командой `python -m ipykernel install --user --name=... --display-name=...`.

</details>

## Самопроверка

После исправления:

1. В ноутбуке выполните `import sys; print(sys.executable)` — путь должен указывать на Python внутри venv (содержать `kernels-debug-env`).
2. Команда `import requests` должна выполняться без ошибки.

```bash
# В директории проекта с venv: python из venv должен импортировать requests
source kernels-debug-env/bin/activate
python -c "import requests; print('OK')"
```

**Ожидаемый результат:**

```
OK
```

---
← [Назад](../05-lab-kernels-register/README.md) | [Оглавление](../../README.md) | [Далее →](../07-lab-debug-multiple-servers/README.md)
