# Конспект: Модуль 6 — Jupyter Notebook

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| Jupyter Notebook | Интерактивная среда: смесь исполняемого кода и документации; сервер + браузерный интерфейс. |
| Ноутбук (notebook) | Документ .ipynb — последовательность ячеек (код, Markdown, Raw). |
| Ячейка | Блок содержимого: Code (исполняемый Python), Markdown (разметка), Raw (без обработки). |
| Магическая команда | Специальная директива IPython: `%` — line magic, `%%` — cell magic, `!` — shell. |
| nbconvert | Утилита Jupyter для экспорта ноутбуков в HTML, PDF, LaTeX, .py и др. |

## Важно запомнить

- Jupyter устанавливается в venv через pip; сервер запускается в терминале, интерфейс — в браузере.
- Остановить сервер — Ctrl+C в терминале, где он запущен.
- Режим команд (синяя рамка) vs режим редактирования (зелёная рамка); Esc и Enter переключают.
- Ячейки Code выполняются kernel'ом; `!команда` — в subshell, не в Python.
- Для PDF-экспорта нужны pandoc и LaTeX (texlive).

## Команды модуля

```bash
pip install jupyter notebook      # установить Jupyter в активированное venv
jupyter --version                 # проверить версию Jupyter
which jupyter                     # убедиться, что jupyter из venv
jupyter notebook                  # запустить сервер (порт 8888)
jupyter notebook --port 8889      # запустить на другом порту
jupyter nbconvert --to html nb.ipynb    # экспорт в HTML
jupyter nbconvert --to script nb.ipynb  # экспорт в .py
jupyter nbconvert --to pdf nb.ipynb     # экспорт в PDF (нужен texlive)
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| jupyter не найден после pip install | venv не активирован | source venv/bin/activate |
| Браузер не открывается | Запуск с --no-browser или SSH | Скопировать URL с token из терминала |
| PDF не генерируется | Нет texlive/pandoc | sudo apt install texlive-xetex pandoc |
| !pip ставит в «не то» окружение | ! запускает системный pip | Использовать %pip или python -m pip в ячейке |
| Ячейка «висит» | Kernel занят или завис | Kernel → Restart |

## Схема: Jupyter Notebook

```
Терминал (venv активирован)
    │
    ├─ jupyter notebook
    │
    ▼
Notebook Server (localhost:8888)
    │
    ├─ Список файлов (.ipynb)
    ├─ Открытие ноутбука
    │
    ▼
Браузер: ячейки Code/Markdown/Raw
    │
    └─ Kernel (Python) исполняет Code
```
