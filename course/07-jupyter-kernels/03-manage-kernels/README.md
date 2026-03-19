← [Назад](../02-trainer-register-venv-kernel/README.md) | [Оглавление](../../README.md) | [Далее →](../04-test-kernels/README.md)

# Управление ядрами: список, удаление

> **Модуль 7 · Урок 3** | Время: ~10 мин

## Основной контент

После регистрации ядер через ipykernel ими нужно уметь управлять: смотреть, какие ядра зарегистрированы, и удалять те, что больше не нужны (например, после удаления venv или смены проекта).

### Список ядер

Команда `jupyter kernelspec list` выводит все зарегистрированные ядра и пути к их описаниям (kernelspec):

```bash
jupyter kernelspec list
```

Пример вывода:

```
Available kernels:
  jupyter-kernel-demo    /home/user/.local/share/jupyter/kernels/jupyter-kernel-demo
  python3               /home/user/.local/share/jupyter/kernels/python3
```

**kernelspec** — это директория с файлом `kernel.json`, в котором указан путь к интерпретатору Python и параметры запуска. Ядра пользователя хранятся в `~/.local/share/jupyter/kernels/`.

### Удаление ядра

Чтобы удалить ядро, используйте `jupyter kernelspec remove` с внутренним именем ядра (`--name`, не display-name):

```bash
jupyter kernelspec remove jupyter-kernel-demo
```

После удаления ядро исчезнет из списка Kernel → Change kernel. Открытые ноутбуки, которые использовали это ядро, перестанут выполнять код — потребуется выбрать другое ядро или перезапустить kernel.

### Где физически лежат ядра

- **Пользовательские** (с флагом `--user`): `~/.local/share/jupyter/kernels/<имя>/`
- **Системные**: обычно в `share/jupyter/kernels/` внутри установки Python или Jupyter

Содержимое `kernel.json`:

```json
{
  "argv": ["/path/to/python", "-m", "ipykernel_launcher", ...],
  "display_name": "Python (myenv)",
  "language": "python"
}
```

Ключ `argv` указывает, какой интерпретатор запускать при выборе этого ядра.

## Частые ошибки

### Ошибка 1 — Удалить ядро, которое используют открытые ноутбуки

Если ноутбук открыт с выбранным ядром, а вы удаляете это ядро через `jupyter kernelspec remove`, ядро перестанет работать. Ноутбук покажет ошибку при попытке выполнить ячейку. Решение: перед удалением закройте ноутбуки, использующие это ядро, или переключите их на другое ядро.

### Ошибка 2 — Путать имя ядра и display-name

Команда `jupyter kernelspec remove` принимает **имя** ядра (`--name` при установке), а не display-name. Если вы зарегистрировали ядро как `--name=myproject` и `--display-name="Python (Мой проект)"`, удалять нужно так: `jupyter kernelspec remove myproject`.

### Ошибка 3 — Удалять ядро вручную через rm

Можно удалить директорию `~/.local/share/jupyter/kernels/<имя>/` вручную, но предпочтительнее `jupyter kernelspec remove`: команда корректно обрабатывает структуру и проверки. Ручное удаление может оставить «мусор», если структура изменится в будущих версиях Jupyter.

---
← [Назад](../02-trainer-register-venv-kernel/README.md) | [Оглавление](../../README.md) | [Далее →](../04-test-kernels/README.md)
