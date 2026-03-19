← [Назад](../08-update-remove-pyenv/README.md) | [Оглавление](../../README.md) | [Далее →](../10-lab-pyenv-final/README.md)

# Лабораторная-диагностика: python не найден после установки pyenv

> **Модуль 2 · Диагностика** | Время: ~20 мин

## Сценарий

Коллега установил pyenv и Python 3.12.0 через `pyenv install`. Установил `pyenv global 3.12.0`. Но при вызове `python` или `python3` получает ошибку:

```
bash: python: command not found
```

При этом директория `~/.pyenv` существует, и `ls ~/.pyenv/versions/` показывает установленные версии. Что пошло не так?

## Воспроизведение проблемы

Запустите скрипт, создающий «сломанное» состояние:

```bash
bash break.sh
```

После этого **откройте новый терминал** (или выполните `exec "$SHELL"`) и попробуйте:

```bash
python --version
```

## Симптомы

- `python --version` выдаёт `command not found`.
- `pyenv` тоже не найден: `bash: pyenv: command not found`.
- Директория `~/.pyenv` существует и содержит установленные версии.
- Файл `~/.pyenv/version` содержит корректную версию.

## Задание

1. Определите, почему pyenv не работает, хотя `~/.pyenv` на месте.
2. Исправьте проблему.
3. Убедитесь, что `pyenv version` и `python --version` работают корректно.

## Подсказка 1

<details><summary>Показать подсказку</summary>

pyenv работает через shims — специальные прокси-файлы, которые перехватывают вызовы `python`. Чтобы shims попали в `PATH`, нужна инициализация pyenv при запуске shell. Проверьте, есть ли нужные строки в `~/.bashrc`.

</details>

## Подсказка 2

<details><summary>Показать подсказку</summary>

Откройте `~/.bashrc` и найдите строки, связанные с pyenv. Должны быть примерно такие:

```bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
```

Если их нет — в этом и причина. pyenv установлен, но shell не знает о нём.

</details>

## Подсказка 3

<details><summary>Показать подсказку</summary>

Добавьте строки инициализации в конец `~/.bashrc`:

```bash
echo '' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
```

Затем перезагрузите shell:

```bash
exec "$SHELL"
```

</details>

## Самопроверка

```bash
pyenv version
```

**Ожидаемый результат:**

```
3.12.0 (set by /home/<user>/.pyenv/version)
```

```bash
python --version
```

**Ожидаемый результат:**

```
Python 3.12.0
```

---
← [Назад](../08-update-remove-pyenv/README.md) | [Оглавление](../../README.md) | [Далее →](../10-lab-pyenv-final/README.md)
