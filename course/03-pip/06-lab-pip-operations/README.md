← [Назад](../05-test-pip-operations/README.md) | [Оглавление](../../README.md) | [Далее →](../07-pip-vs-apt/README.md)

# Лабораторная: pip — операции и requirements

> **Модуль 3 · Лабораторная** | Время: ~20 мин

## Задание

Создайте рабочую директорию (например, `~/pip-lab/`), перейдите в неё и выполняйте все задачи там. Запускайте `check.sh` из этой же директории.

1. Убедитесь, что используется Python из pyenv (например, `pyenv global 3.12.0` или нужная версия). Проверьте связку pip↔Python.

1. Убедитесь, что используется Python из pyenv (например, `pyenv global 3.12.0` или нужная версия). Проверьте связку pip↔Python.
2. Установите пакет **requests** (без фиксации версии).
3. Установите пакет **rich** с фиксацией версии (например, `rich==13.7.0` — выберите стабильную версию из PyPI).
4. Сформируйте файл `requirements.txt` с зафиксированными версиями всех установленных пакетов (включая зависимости).
5. Удалите пакеты `requests` и `rich`.
6. Восстановите окружение из `requirements.txt` и проверьте, что оба пакета снова установлены.

## Требования

- Пакеты `requests` и `rich` установлены, удалены, затем восстановлены из `requirements.txt`.
- Файл `requirements.txt` содержит зафиксированные версии.
- Вы можете показать, к какому Python привязан pip.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Для проверки связки pip↔Python используйте `pip --version` или `python -m pip --version`. Для установки: `pip install requests`, `pip install rich==13.7.0`. Для фиксации версий: `pip freeze`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Команда `pip freeze` выводит список в формате `package==version`. Перенаправьте вывод в файл: `pip freeze > requirements.txt`. Для восстановления: `pip install -r requirements.txt`.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полная последовательность:
```bash
pip install requests
pip install rich==13.7.0
pip freeze > requirements.txt
pip uninstall -y requests rich
pip install -r requirements.txt
pip list | grep -E "requests|rich"
```

</details>

## Самопроверка

После выполнения проверьте:

```bash
pip list | grep -E "requests|rich"
```

**Ожидаемый результат:** оба пакета присутствуют в списке с версиями.

```bash
cat requirements.txt | grep -E "requests|rich"
```

**Ожидаемый результат:** строки в формате `requests==X.Y.Z` и `rich==X.Y.Z`.

Также запустите скрипт проверки:

```bash
bash check.sh
```

---
← [Назад](../05-test-pip-operations/README.md) | [Оглавление](../../README.md) | [Далее →](../07-pip-vs-apt/README.md)
