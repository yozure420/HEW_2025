from flask import Flask,render_template
app = Flask(__name__)
@app.route("/")
def index():
    return render_template('index.html')
@app.route("/component")
def component():
    return render_template('component.html',key=123)
# @app.route("/")
# def index():
#     # HTMLファイルを読み込んで、返却。
#     return render_template('index.html')
# @app.route('/pass_data')
# def pass_data():
#     # 第２引数以降に、名前付き引数で渡す。
#     return render_template('pass_data.html',id=123,name='<h2>abc</h2>')

# @app.route('/if_for')
# def if_for():
#     age = 20
#     colors = ['r','g','b']
#     colors_dic = {
#         'r':'赤',
#         'g':'緑',
#         'b':'青'
#     }

#     from user import User
#     user = [
#         User(1,'a'),
#         User(2,'b'),
#         User(3,'c')
#     ]
#     return render_template('if_for.html',age=age,colors=colors,colors_dic=colors_dic,users=user)

# #img/js/css
# @app.route('/img_etc')
# def img_etc():
#     return render_template('img_etc.html')

# #コンポーネント
# @app.route('/component')
# def component():
#     return render_template('component.html',key1=123)

# # レイアウト継承
# @app.route('/extends')
# def extends():
#     return render_template('extends.html')


# @app.route('/filter')
# def if_for():
#     age = 20
#     colors = ['r','g','b']
#     return render_template('filter.html',age=age,colors=colors)

if __name__ == "__main__":
    app.run('0.0.0.0',80,debug=True)