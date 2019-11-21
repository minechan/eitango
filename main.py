import csv
import random
from bottle import route, post, request, template, run, redirect

@route('/')
def rootpage():
    return template('index')

@route('/list')
def show_list():
    rows = []
    #
    # TODO:
    # CSVデータ'data/dictionary.csv'開き，
    # データをrowsにリストとして集める
    #
    with open("data/dictionary.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        rows = [row for row in reader]
    return template('list', rows=rows) # TODO: list.tplも適切に修正する

@route('/meaning/<word>')
def show_meaning(word):
    data = None
    #
    # TODO:
    # CSVデータ'data/dictionary.csv'開き，
    # 単語名がwordと一致するrowのrow[1]を変数dataに代入
    #
    with open("data/dictionary.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        for row in reader:
            if row[0] == word:
                data = row[1]
                break
    return template('meaning', word=word, data=data)

@route('/add_word')
def word_form():
    return template('add_word')

@post('/confirm')
def record_word():
    # word = ????（フォームに入力されたデータを適切に取得）
    # data = ????（フォームに入力されたデータを適切に取得）
    #
    # TODO:
    # CSV'data/dictionary.csv'を「追加書き込みモード」で開き，
    # [word, data]を新しいデータとして書き込み
    #
    word = request.forms.word
    data = request.forms.data
    with open("data/dictionary.csv", "a", encoding="utf-8", newline="") as file:
        writer = csv.writer(file)
        writer.writerow([word, data])
    redirect(f"/meaning/{word}") # 単語の意味表示ページへリダイレクト

@post('/random/delete')
@post('/meaning/delete')
def delete_word():
    rows = []
    word = request.forms.word
    with open("data/dictionary.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        rows = [row for row in reader if row[0] != word]
    with open("data/dictionary.csv", "w", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerows(rows)
    redirect("/list")
    
@route('/random')
def random_word():
    #
    # TODO:
    # CSVデータ'data/dictionary.csv'開き，
    # ランダムに単語を選び，
    # (1) その単語名を変数wordに代入，
    # (2) その単語の説明分を変数dataに代入する．
    #
    rows = []
    with open("data/dictionary.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        rows = [row for row in reader]
    n = random.randint(0, len(rows) - 1)
    word = rows[n][0]
    data = rows[n][1]
    return template('random', word=word, data=data)

@route('/test')
def test():
    rows = []
    ns = []
    with open("data/dictionary.csv", "r", encoding="utf-8") as file:
        reader = csv.reader(file)
        rows = [row for row in reader]
    while len(ns) < 3:
        n = random.randint(0, len(rows) - 1)
        if len(ns) == 0 or ns[len(ns) - 2] != n:
            ns.append(n)
    return template('test', word=rows[ns[random.randint(0, 2)]][0], datas=[rows[i] for i in ns])

run(host='localhost', port=8080)
