# Конспект: Модуль 7 — Jupyter: ядра и интеграция

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| **Ядро (kernel)** | Среда выполнения кода в ноутбуке — интерпретатор Python и его пакеты; Jupyter запускает ядро отдельным процессом. |
| **ipykernel** | Пакет для регистрации Python-окружения (в т.ч. venv) как ядра Jupyter. |
| **kernelspec** | Описание ядра: путь к интерпретатору и метаданные; хранится в `~/.local/share/jupyter/kernels/`. |

## Важно запомнить

- Код в ячейках выполняется в окружении **выбранного ядра**, а не в окружении активированного venv в терминале.
- Ядро и «Python в терминале» — разные сущности; регистрация venv как ядра делает его доступным в Kernel → Change kernel.
- Перед `python -m ipykernel install` нужно активировать venv и установить в него ipykernel.
- `sys.executable` в ячейке показывает, какой Python использует ядро — полезно при диагностике ImportError.

## Команды модуля

```bash
pip install ipykernel
python -m ipykernel install --user --name myenv --display-name "Python (myenv)"
jupyter kernelspec list
jupyter kernelspec remove myenv
jupyter notebook --port 8889
jupyter notebook list
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| `import` падает, хотя pip показывает пакет | Ядро указывает на другое окружение | Проверить `sys.executable`, зарегистрировать venv как ядро, переключить ядро |
| Не знаю, какой Jupyter на каком порту | Запущено несколько серверов | `jupyter notebook list`, `lsof -i :8888`, `ps aux \| grep jupyter` |
| Удалил ядро, ноутбук не работает | Открытые ноутбуки ссылаются на удалённое ядро | Переключить ядро до удаления или перезапустить kernel |
| Установил ipykernel в system вместо venv | Забыл активировать venv | Активировать venv, `pip install ipykernel`, затем `ipykernel install` |

## Схема

```
┌─────────────────┐     ┌──────────────────────────┐
│ Jupyter Server  │────▶│ Kernel (Python process)   │
│ (из venv/term)  │     │ = sys.executable в ячейках│
└─────────────────┘     └──────────────────────────┘
         │
         │ kernelspec list → ~/.local/share/jupyter/kernels/
         │ ipykernel install → добавить venv в этот список
         ▼
┌─────────────────────────────────────────────────────┐
│ Kernel → Change kernel → выбор окружения для кода   │
└─────────────────────────────────────────────────────┘
```
