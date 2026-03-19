← [Назад](../07-lab-venv-pyenv-requirements/README.md) | [Оглавление](../../README.md) | [Далее →](../09-lab-debug-broken-venv/README.md)

# Лабораторная-диагностика: pip внутри venv указывает на системный

> **Модуль 5 · Диагностика** | Время: ~15 мин

## Сценарий

Коллега создал виртуальное окружение в проекте, активировал его и установил пакет через `pip install`. Через некоторое время выяснилось: пакет попал в системный Python, а не в venv. Окружение как будто «не работает» — pip ставит не туда.

Ваша задача — воспроизвести проблему, найти причину и исправить.

## Воспроизведение проблемы

Запустите скрипт, создающий «сломанное» состояние:

```bash
bash break.sh
```

Скрипт создаст директорию `~/course-debug-pip-system` с виртуальным окружением.

## Симптомы

После запуска `break.sh`:

1. Перейдите в директорию и активируйте окружение:
   ```bash
   cd ~/course-debug-pip-system
   source venv/bin/activate
   ```

2. Установите тестовый пакет:
   ```bash
   pip install requests
   ```

3. Проверьте, куда попал пакет:
   ```bash
   pip show requests
   which pip
   python -c "import sys; print(sys.executable)"
   ```

Вы увидите, что `pip` и `python` указывают на разные места: `pip` может вести к системному pip, а пакет установился в системный site-packages. Либо при `pip show requests` путь будет вне директории venv.

## Задание

1. Обнаружьте, что pip в «активном» venv устанавливает пакеты не в окружение.
2. Найдите причину (проверьте `venv/bin/pip`, симлинки, `which pip`).
3. Исправьте ситуацию так, чтобы pip в активированном venv устанавливал пакеты корректно в это окружение.

## Подсказка 1

<details><summary>Показать подсказку</summary>

После активации выполните `ls -la venv/bin/pip` и `which pip`. Сравните пути. Обратите внимание на то, является ли `venv/bin/pip` обычным файлом или симлинком.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Скрипт `break.sh` подменяет `venv/bin/pip` на симлинк, указывающий на системный pip. В результате при вызове `pip` выполняется системная команда, а не pip из окружения. Удалите неправильный симлинк и восстановите pip в venv: `python -m ensurepip --upgrade` или пересоздайте окружение.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Решение: удалите `venv/bin/pip` (симлинк) и выполните `python -m ensurepip --upgrade`. Либо удалите каталог venv и создайте его заново: `rm -rf venv && python -m venv venv`. После этого `pip install` в активированном venv будет работать корректно.

</details>

## Самопроверка

```bash
cd ~/course-debug-pip-system
source venv/bin/activate
pip install requests
pip show requests
```

**Ожидаемый результат:** в выводе `pip show requests` путь `Location` должен содержать `course-debug-pip-system/venv`.

---
← [Назад](../07-lab-venv-pyenv-requirements/README.md) | [Оглавление](../../README.md) | [Далее →](../09-lab-debug-broken-venv/README.md)
