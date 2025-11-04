from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    # DBからデータを持ってきたと仮定
    from user import User
    users = [
        User('宵待ちのアリア', '橘 奏', 250),
        User('サイレント・コード', 'Chronos Ship', 1800),
        User('砂漠の残光', 'エル・ファリド', 1500),
        User('都市迷路', '零式サウンドシステム', 300),
        User('霧と埠頭のワルツ', '藍沢 雫', 2800),
        User('無限回廊の夢', 'Astral Compass', 2000),
        User('七月のシークレット・ベース', '風見 悠', 250),
        User('ノスタルジア銀河', '星野 天音', 500)
    ]
    return render_template(
        'home.html',
        users=users
    )

@app.route('/short')
def short():
    return render_template(
        'short.html'
    )

@app.route('/music_make')
def music_make():
    return render_template(
        'music_make.html'
    )

@app.route('/good')
def good():
    return render_template(
        'good.html'
    )

@app.route('/cart')
def cart():
    return render_template(
        'cart.html'
    )

@app.route('/history')
def history():
    return render_template(
        'history.html'
    )

@app.route('/user')
def user():
    return render_template(
        'user.html'
    )

@app.route('/music_list')
def music_list():
    # from user import User
    # users = [
    #     User('宵待ちのアリア', '橘 奏', 250),
    #     User('サイレント・コード', 'Chronos Ship', 1800),
    #     User('砂漠の残光', 'エル・ファリド', 1500),
    #     User('都市迷路', '零式サウンドシステム', 300),
    #     User('霧と埠頭のワルツ', '藍沢 雫', 2800),
    #     User('無限回廊の夢', 'Astral Compass', 2000),
    #     User('七月のシークレットベース', '風見 悠', 250),
    #     User('ノスタルジア銀河', '星野 天音', 500)
    # ]

    return render_template(
        'music_list.html',
        # users = users
    )

if __name__ == '__main__':
    app.run('0.0.0.0', 80, True)