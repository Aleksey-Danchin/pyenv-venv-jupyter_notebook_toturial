← [Назад](../05-test-version-switching/README.md) | [Оглавление](../../README.md) | [Далее →](../07-uninstall-python/README.md)

# Лабораторная: переключение версий Python

> **Модуль 2 · Лабораторная** | Время: ~30 мин

## Задание

Настройте три уровня переключения версий Python с помощью pyenv и продемонстрируйте работу приоритетов.

## Требования

1. Убедитесь, что через pyenv установлены **минимум две** версии Python (помимо system). Если нет — установите недостающие.
2. Установите **глобальную** версию Python (отличную от системной).
3. Создайте директорию `~/lab-versions` и установите в ней **локальную** версию Python (отличную от глобальной).
4. Находясь в `~/lab-versions`, установите **сессионную** версию (отличную от локальной и глобальной).
5. Убедитесь, что `pyenv version` показывает сессионную версию (наивысший приоритет).
6. Сбросьте сессионную версию и убедитесь, что теперь действует локальная.
7. Удалите файл `.python-version` из `~/lab-versions` и убедитесь, что действует глобальная версия.

## Подсказка 1

<details><summary>Показать подсказку</summary>

Для установки версий используйте `pyenv install`. Для проверки установленных версий — `pyenv versions`. Для переключения — `pyenv global`, `pyenv local`, `pyenv shell`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Примерная последовательность:

```bash
pyenv versions                    # посмотреть, какие версии есть
pyenv global <версия_1>           # установить глобальную
mkdir -p ~/lab-versions && cd ~/lab-versions
pyenv local <версия_2>            # установить локальную
pyenv shell <версия_3>            # установить сессионную
```

Для сброса: `pyenv shell --unset`, затем `pyenv local --unset` или `rm .python-version`.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Полный пример (допустим, установлены 3.11.7, 3.12.0, 3.13.0):

```bash
pyenv global 3.12.0
mkdir -p ~/lab-versions && cd ~/lab-versions
pyenv local 3.11.7
pyenv shell 3.13.0
pyenv version                     # → 3.13.0 (set by PYENV_VERSION)
pyenv shell --unset
pyenv version                     # → 3.11.7 (set by .python-version)
rm .python-version
pyenv version                     # → 3.12.0 (set by ~/.pyenv/version)
```

</details>

## Самопроверка

Выполните автоматическую проверку:

```bash
bash check.sh
```

Или проверьте вручную: после выполнения всех шагов убедитесь, что в `~/lab-versions` действует глобальная версия (файл `.python-version` удалён, `PYENV_VERSION` не задана):

```bash
cd ~/lab-versions
pyenv version
```

**Ожидаемый результат:**

```
<ваша_глобальная_версия> (set by /home/<user>/.pyenv/version)
```

---
← [Назад](../05-test-version-switching/README.md) | [Оглавление](../../README.md) | [Далее →](../07-uninstall-python/README.md)
