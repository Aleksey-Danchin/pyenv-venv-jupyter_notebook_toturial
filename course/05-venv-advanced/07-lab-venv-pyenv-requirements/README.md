← [Назад](../06-test-venv-advanced/README.md) | [Оглавление](../../README.md) | [Далее →](../08-lab-debug-pip-system/README.md)

# Лабораторная: venv + pyenv, requirements и множественные окружения

> **Модуль 5 · Лабораторная** | Время: ~30 мин

## Задание

В директории `~/lab-venv-advanced` (создайте её) выполните полный цикл работы с venv и pyenv:

1. Установите локальную версию Python 3.11 через pyenv для этой директории.
2. Создайте виртуальное окружение `venv`.
3. Установите пакеты `requests` и `rich`.
4. Сохраните зависимости в `requirements.txt`.
5. Создайте второе окружение `venv-alt` от той же версии Python.
6. Активируйте `venv-alt` и воспроизведите зависимости из `requirements.txt`.

В конце проверьте: в обоих окружениях должны быть установлены `requests` и `rich`.

## Требования

- Директория: `~/lab-venv-advanced`
- Файл `.python-version` с версией Python
- Два окружения: `venv` и `venv-alt`
- Файл `requirements.txt` с зависимостями
- Пакеты `requests` и `rich` установлены в обоих окружениях

## Подсказка 1

<details><summary>Показать подсказку</summary>

Начните с создания директории и перехода в неё. Используйте `pyenv local 3.11.7` (или другую установленную версию 3.11), чтобы привязать версию Python к проекту. Затем создайте venv командой `python -m venv venv`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

После активации venv (`source venv/bin/activate`) установите пакеты: `pip install requests rich`. Сохраните список: `pip freeze > requirements.txt`. Деактивируйте (`deactivate`) и создайте второе окружение: `python -m venv venv-alt`.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Активируйте `venv-alt`, затем `pip install -r requirements.txt`. Проверьте: `pip list | grep -E "requests|rich"` — оба пакета должны быть в списке. Запустите `check.sh` для автоматической проверки.

</details>

## Самопроверка

```bash
cd ~/lab-venv-advanced
source venv/bin/activate
pip list | grep -E "requests|rich"
deactivate
source venv-alt/bin/activate
pip list | grep -E "requests|rich"
deactivate
```

**Ожидаемый результат:** в обоих случаях `requests` и `rich` должны быть в выводе `pip list`.

---
← [Назад](../06-test-venv-advanced/README.md) | [Оглавление](../../README.md) | [Далее →](../08-lab-debug-pip-system/README.md)
