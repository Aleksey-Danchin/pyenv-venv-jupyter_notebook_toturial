# Эталонное решение: экспорт и воспроизведение ноутбука

## Шаги решения

1. Создать директорию и venv.
2. Установить Jupyter, matplotlib.
3. Запустить Jupyter, создать ноутбук `report.ipynb` с кодом и Markdown.
4. Экспортировать в HTML и .py через nbconvert.
5. Сформировать requirements.txt.
6. Удалить venv, пересоздать, установить пакеты из requirements.txt.
7. Проверить, что Jupyter запускается и ноутбук открывается.

## Команды (терминал)

```bash
mkdir -p ~/lab-jupyter-export
cd ~/lab-jupyter-export

# pyenv local 3.11.7  # опционально
python -m venv venv
source venv/bin/activate

pip install jupyter notebook matplotlib

jupyter notebook
```

В браузере:
- New → Python 3 (или соответствующее ядро)
- Ячейка 1 (Code): `import matplotlib.pyplot as plt` и простой график, например `plt.plot([1,2,3],[4,5,6]); plt.title("Тест"); plt.savefig("plot.png"); plt.show()`
- Ячейка 2 (Markdown): `## Отчёт` или краткое описание
- File → Save as → `report.ipynb`
- Ctrl+C в терминале — остановить сервер

Затем в терминале:

```bash
cd ~/lab-jupyter-export
source venv/bin/activate

jupyter nbconvert --to html report.ipynb
jupyter nbconvert --to script report.ipynb
pip freeze > requirements.txt

# Симуляция передачи — удалить и пересоздать venv
deactivate
rm -rf venv

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Проверка
jupyter --version
ls report.ipynb report.html report.py requirements.txt
```

## Ожидаемый результат

- `~/lab-jupyter-export/report.ipynb` — ноутбук с Code и Markdown ячейками
- `~/lab-jupyter-export/report.html` — экспортированный HTML
- `~/lab-jupyter-export/report.py` — экспортированный Python-скрипт
- `~/lab-jupyter-export/requirements.txt` — зависимости
- venv пересоздана и Jupyter работает
