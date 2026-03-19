← [Назад](../05-test-venv-basics/README.md) | [Оглавление](../../README.md) | [Далее →](../07-pip-inside-venv/README.md)

# Лабораторная: создание, активация и деактивация venv

> **Модуль 4 · Лабораторная** | Время: ~20 мин

## Задание

Выполните следующие задачи:

1. Выберите версию Python через pyenv (например, 3.12.x) и перейдите в любую рабочую директорию.
2. Создайте виртуальное окружение с именем `venv`.
3. Активируйте окружение и проверьте: `which python` и `which pip` должны указывать внутрь venv.
4. Убедитесь, что в prompt появился префикс `(venv)`.
5. Установите любой пакет (например, `pip install requests`) и проверьте через `pip list`, что он виден.
6. Деактивируйте окружение и проверьте, что `which python` снова указывает на системный или pyenv-версию.

## Требования

- venv создан в текущей директории.
- После активации `python` и `pip` указывают на бинарники внутри `venv/bin/`.
- Пакет установлен внутри окружения и виден в `pip list` до деактивации.
- После деактивации окружение неактивно.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Для создания venv используйте `python -m venv venv` (или `python3 -m venv venv`). Выбор интерпретатора определяется pyenv — убедитесь, что нужная версия активна (`pyenv version`).

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Активация в bash/zsh: `source venv/bin/activate`. Деактивация: команда `deactivate` (она появляется только после активации). Проверка пути: `which python` до и после активации.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полная последовательность:

```bash
pyenv local 3.12.0    # или pyenv shell 3.12.0
python -m venv venv
source venv/bin/activate
which python          # должно быть .../venv/bin/python
pip install requests
pip list
deactivate
which python          # снова системный/pyenv
```

</details>

## Самопроверка

После выполнения проверьте:

```bash
source venv/bin/activate
which python
```

**Ожидаемый результат:** путь вида `/home/<user>/.../venv/bin/python`.

```bash
pip list | grep -i requests
```

**Ожидаемый результат:** строка с `requests` и версией.

Запустите скрипт проверки:

```bash
bash check.sh
```

---

← [Назад](../05-test-venv-basics/README.md) | [Оглавление](../../README.md) | [Далее →](../07-pip-inside-venv/README.md)
