# Эталонное решение: Итоговая лабораторная по Jupyter

## Шаги решения

1. Создать директорию, установить pyenv local.
2. Создать venv, установить Jupyter, ipykernel, matplotlib.
3. Зарегистрировать venv как ядро.
4. Создать ноутбук final.ipynb: Markdown + Code (данные, matplotlib, магическая команда) + Markdown.
5. Экспортировать в HTML, сформировать requirements.txt.
6. Пересоздать venv, перерегистрировать ядро.

## Команды (терминал)

```bash
mkdir -p ~/lab-jupyter-final
cd ~/lab-jupyter-final

pyenv local 3.11.7   # или другая установленная версия

python -m venv venv
source venv/bin/activate

pip install jupyter notebook ipykernel matplotlib

python -m ipykernel install --user --name lab-jupyter-final --display-name "Python (lab-jupyter-final)"

jupyter notebook
```

В браузере:

1. New → Python (lab-jupyter-final)
2. Ячейка 1 (Markdown): `# Итоговый проект\n\nКраткое описание: данные и визуализация.`
3. Ячейка 2 (Code):
```python
data = [10, 25, 30, 45, 50]
labels = ['A', 'B', 'C', 'D', 'E']
import matplotlib.pyplot as plt
plt.bar(labels, data)
plt.title("Пример данных")
plt.savefig("chart.png")
plt.show()
```
4. Ячейка 3 (Code): `%timeit sum(range(1000))` или `%env`
5. Ячейка 4 (Markdown): `## Итог\n\nГрафик построен, время выполнения замерено.`
6. File → Save as → `final.ipynb`
7. Ctrl+C — остановить Jupyter

В терминале:

```bash
cd ~/lab-jupyter-final
source venv/bin/activate

jupyter nbconvert --to html final.ipynb
pip freeze > requirements.txt

# Симуляция передачи
deactivate
rm -rf venv

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python -m ipykernel install --user --name lab-jupyter-final --display-name "Python (lab-jupyter-final)"

jupyter kernelspec list
ls final.ipynb final.html requirements.txt
```

## Ожидаемый результат

- `~/lab-jupyter-final/venv` с Jupyter, matplotlib
- Ядро `Python (lab-jupyter-final)` в `jupyter kernelspec list`
- `final.ipynb`, `final.html`, `requirements.txt`
- Ноутбук содержит Markdown, Code с matplotlib и магической командой
