from flask import Flask, render_template, request

app = Flask(__name__)

# DBからデータを持ってきたと仮定
from user import User
users = [
    User('pnsb112v','宵待ちのアリア', '橘 奏', 250, 'ピアノとストリングスのシンプルな構成で、夕焼けがビルの谷間に沈んでいく、あの切なくて美しい瞬間を音にしました。 誰かを待つ時間の、期待と不安が入り混じった繊細な心情を込めています。忙しい日常の中で、立ち止まって空を見上げる、そんな時間のお供に。'),
    User('xncd077k','サイレント・コード', 'Chronos Ship', 1800, 'ノイズとシンセサイザーの冷たい音色が支配する、インダストリアル・エレクトロニカ作品。 誰もいなくなった都市に残された、機械の微かな鼓動を表現しています。ヘッドホンで聴くと、音像の広がりと奥行きをより感じられるはずです。これは、我々が立ち止まってはいけない未来への警告でもあります。'),
    User('adgz334f','砂漠の残光', 'エル・ファリド', 1500, '灼熱の太陽が沈んだ後の、砂漠の幻想的な風景をイメージして制作しました。民族楽器の深みのある音色と、現代的なビートを融合させています。 遠い過去に栄えた文明の"残光"、つまり、忘れ去られた歴史の美しさを感じてもらえたら嬉しいです。聴く人を、どこか異国の旅へと誘います。'),
    User('mtlr801a','都市迷路', '零式サウンドシステム', 300, '都会の雑踏、ネオンの光、そしてその裏側に潜む焦燥感と孤独を、ヘビーなギターリフと無機質なデジタルサウンドで表現しました。 「迷路」の中で、自分という確かなものを見つけ出そうともがく、すべての人に捧げます。ボリュームを上げて、このノイズに溺れてください。'),
    User('wfwr556j','霧と埠頭のワルツ', '藍沢 雫', 2800, '濃い霧に包まれた古い埠頭を舞台にした、大人のためのワルツです。 トランペットのメランコリックな響きと、変則的なリズムが、映画のワンシーンのように展開します。一杯のウイスキーと共に、このミステリアスなジャズに身を委ねてみてください。'),
    User('icdr200e','無限回廊の夢', 'Astral Compass', 2000, '精神世界をテーマにした、10分を超える組曲です。 幾重にも重なる楽器のレイヤーと予測不能な展開は、まるで終わりのない回廊を歩いているよう。聴く人それぞれの**「夢」や「探求」**のイメージを重ね合わせながら、自由に解釈して楽しんでほしい作品です。'),
    User('jhsb499g','七月のシークレット・ベース', '風見 悠', 250, '七月の暑い日差しと、秘密基地で交わしたくだらない約束を歌にしました。 シンプルなアコースティックギターと、どこか不器用な歌声で、あの頃のきらきらした時間を再現しています。大人になった今、少し立ち止まって、あの夏の匂いを思い出させてくれる一曲です。'),
    User('nfgr913h','ノスタルジア銀河', '星野 天音', 500, '80年代のシンセサイザーサウンドを現代的に解釈した、レトロフューチャーな作品です。 星空を見上げるときの高揚感と、どこか寂しいノスタルジーがテーマ。架空のSFアニメのオープニングをイメージして作りました。ヘッドライトの光を浴びながら、夜の高速道路を走る時にぜひ。')
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
    product_id = request.args.get('product_id', type=str)

    product = None
    for user in users:
        if user.id == product_id:
            product = user
            break
    
    return render_template(
        'product_detail.html',
        product=product
    )

@app.route('/buy_now')
def buy_now():
    return render_template(
        'buy_now.html'
    )

if __name__ == '__main__':
    app.run('0.0.0.0', 80, True)