from flask import Flask, render_template, request

app = Flask(__name__)

# DBからデータを持ってきたと仮定
from user import User
users = [
    User(1,'宵待ちのアリア', '橘 奏', 250),
    User(2,'サイレント・コード', 'Chronos Ship', 1800),
    User(3,'砂漠の残光', 'エル・ファリド', 1500),
    User(4,'都市迷路', '零式サウンドシステム', 300),
    User(5,'霧と埠頭のワルツ', '藍沢 雫', 2800),
    User(6,'無限回廊の夢', 'Astral Compass', 2000),
    User(7,'七月のシークレット・ベース', '風見 悠', 250),
    User(8,'ノスタルジア銀河', '星野 天音', 500)
]

@app.route('/')
def home():
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
    return render_template(
        'music_list.html'
    )

@app.route('/product_detail')
def product_detail():
    product_id = request.args.get('product_id', type=int)

    product = None
    for user in users:
        if user.id == product_id:
            product = user
            break
    
    return render_template(
        'product_detail.html',
        product=product
    )

if __name__ == '__main__':
    app.run('0.0.0.0', 80, True)