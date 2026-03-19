← [Назад](../09-lab-debug-python-not-found/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Итоговая лабораторная по pyenv

> **Модуль 2 · Лабораторная (снежный ком)** | Время: ~40 мин

Эта лабораторная охватывает **весь материал по pyenv** из Модулей 1 и 2: установку версий, переключение на всех уровнях, приоритеты и удаление.

## Задание

Выполните следующие действия **последовательно**:

1. **Установите** версию Python 3.11.7 через pyenv (если ещё не установлена).
2. **Установите** версию Python 3.12.0 через pyenv (если ещё не установлена).
3. Установите **глобальную** версию Python — `3.12.0`.
4. Создайте директорию `~/lab-pyenv-final` и установите в ней **локальную** версию — `3.11.7`.
5. Находясь в `~/lab-pyenv-final`, убедитесь, что `python --version` показывает `3.11.7`.
6. Создайте поддиректорию `~/lab-pyenv-final/subdir` и убедитесь, что локальная версия **наследуется** в неё.
7. Перейдите в домашнюю директорию и убедитесь, что действует **глобальная** версия `3.12.0`.
8. Вернитесь в `~/lab-pyenv-final` и установите **сессионную** версию, отличную от локальной и глобальной. Убедитесь, что она имеет наивысший приоритет.
9. **Сбросьте** сессионную версию и убедитесь, что снова действует локальная.
10. **Удалите** файл `.python-version` из `~/lab-pyenv-final`.
11. Убедитесь, что теперь в `~/lab-pyenv-final` действует глобальная версия.

## Требования

- После выполнения всех шагов:
  - Глобальная версия — `3.12.0`
  - Директория `~/lab-pyenv-final/subdir` существует
  - Файл `~/lab-pyenv-final/.python-version` **отсутствует**
  - Переменная `PYENV_VERSION` **не задана**

## Подсказка 1

<details><summary>Показать подсказку</summary>

Для установки версий: `pyenv install 3.11.7` и `pyenv install 3.12.0`. Если версия уже установлена, pyenv сообщит об этом — это нормально.

Для проверки приоритетов: используйте `pyenv version` — она показывает не только текущую версию, но и **источник** (set by ...).

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Ключевые команды по порядку:

```bash
pyenv install 3.11.7          # шаг 1 (пропустить если есть)
pyenv install 3.12.0          # шаг 2 (пропустить если есть)
pyenv global 3.12.0           # шаг 3
mkdir -p ~/lab-pyenv-final     # шаг 4
cd ~/lab-pyenv-final
pyenv local 3.11.7            # шаг 4
mkdir -p subdir               # шаг 6
cd subdir && python --version  # шаг 6
```

Для шага 8: `pyenv shell <третья_версия>`.
Для шага 9: `pyenv shell --unset`.
Для шага 10: `rm ~/lab-pyenv-final/.python-version` или `cd ~/lab-pyenv-final && pyenv local --unset`.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полный пример (с версией 3.13.0 как сессионной):

```bash
pyenv install 3.11.7 2>/dev/null || true
pyenv install 3.12.0 2>/dev/null || true
pyenv global 3.12.0
mkdir -p ~/lab-pyenv-final && cd ~/lab-pyenv-final
pyenv local 3.11.7
python --version                           # → 3.11.7
mkdir -p subdir && cd subdir
python --version                           # → 3.11.7 (наследование)
cd ~
python --version                           # → 3.12.0 (global)
cd ~/lab-pyenv-final
pyenv shell 3.13.0
pyenv version                              # → 3.13.0 (PYENV_VERSION)
pyenv shell --unset
pyenv version                              # → 3.11.7 (.python-version)
rm .python-version
pyenv version                              # → 3.12.0 (~/.pyenv/version)
```

</details>

## Самопроверка

Выполните автоматическую проверку:

```bash
bash check.sh
```

Или проверьте вручную:

```bash
cd ~/lab-pyenv-final
echo "Global: $(pyenv global)"
echo "PYENV_VERSION: ${PYENV_VERSION:-не задана}"
echo "Файл .python-version: $(test -f .python-version && echo 'существует' || echo 'отсутствует')"
echo "Subdir: $(test -d subdir && echo 'существует' || echo 'отсутствует')"
pyenv version
```

**Ожидаемый результат:**

```
Global: 3.12.0
PYENV_VERSION: не задана
Файл .python-version: отсутствует
Subdir: существует
3.12.0 (set by /home/<user>/.pyenv/version)
```

---
← [Назад](../09-lab-debug-python-not-found/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)
