# Man10 Resource Pack
シーズン３用リソースパック



| どのアイテムに割りあてるか                               |
| -------------------------------------------------------- |
| 被り物: wooden_hoe                                       |
| 銃火器: iron_hoe                                         |
| 近接武器: iron_sword                                     |
| 杖・魔法武器: iron_shovel                                |
| 飲み物: potion                                           |
| 食べ物: baked_potato                                     |
| 設備・家具類: stone_hoe                                  |
| ガジェット類: golden_hoe                                 |
| スロット図柄: iron_nugget                                |
| 文字類: gold_nugget                                      |
| イミテーションアイテム: diamond_hoe                      |
| mob装備: diamond_hoe                                     |
| 換金アイテム・通貨: 〇〇〇_ingot/diamond/emerald(編集済) |
|                                                          |

#### ディレクトリ構造について

- sounds(音)
- models
  - block(マイクラ従来ブロックを置き換えるとき)
  - item(マイクラ従来のアイテムを置き換えるとき)

- man10(カテゴリはtextureと同等にします)
  - common
  - food
  - fish
  - item
  - weapon
    - gun
    - other
    - sword
- （textureと同じなので省略)

- textures
  - block (マイクラ本来のテクスチャを置き換えるとき)
  - man10
    - currency (通貨アイテム・ガチャコインなど)
    - common (共通化できるテクスチャ)
    - fish　(魚)
    - food (食べ物)
    - drink(飲み物
    - drug(薬
    - tool（ペンチとか手にもつ道具)
    - hat(頭にかぶるもの)
    - glasses(眼鏡とか)
    - slot(カジノのスロットとか)
    - furniture(家具)
    - equipment(設備 ATMや機械など)
    - instrument(楽器)
    - gadget(小物、mPhoneとかちょっとしたもの)
    - icon(ディスコードアイコンなどのアイコン)
    - other　(あてはまらないもの)
    - weapon
      - magic (魔法)
      - gun　(銃)
      - other
      - sword　

#### ルール

- models/ 以下には、jsonファイル以外は置かない。
- textures/ 以下には、pngとmcmetaファイル以外は置かない。
- modelsとtextureのカテゴリ名は一致させること
- commons以外のtextureファイルには必ずmodelのフォルダを作り、どのモデルから参照されてるかわかるようにすること

#### 例

pistoldemo というテクスチャを作るときの例です。

運営以外は、テクスチャはモデルと同じ名前のフォルダを作って、その下にファイルをいれてください。

ファイル名は自由ですが、わかりやすい名前をいれること。当たり前ですが、漢字や全角はダメ。

[モデル]

- /models/man10/weapons/guns/pistoldemo.json

[テクスチャ]　モデル名と一致するフォルダを作る

　* /textures/man10/weapos/guns/pistoldemo/frame.png
  * /textures/man10/weapos/guns/pistoldemo/barrel.png

これらの組み合わせをセットとする







シーズン２最終データより必要なものを取り込むようにします



割り当て表

https://docs.google.com/spreadsheets/d/1Qjq2OjKzGZb6t3sb2Cl7Ph7B5xoYvHFCcLdMqbBAuiQ/edit#gid=1509554362



Wiki

https://man10.red/wiki/doku.php?id=helper:%E3%83%AA%E3%82%BD%E3%83%BC%E3%82%B9%E3%83%91%E3%83%83%E3%82%AF%E5%86%8D%E7%B7%A8



## プライマリカラーについて


テクスチャパックには共通で使える色のテクスチャがはいっています
単色で色を使いたい場合は個別にカラーテクスチャを追加するのではなく、下のカラーの表から色を選びましょう



/man10/common/red   ->  <span style="color: red; ">■</span>

/man10/common/springgreen   ->  <span style="color: springgreen; ">■</span>







![primarycolor](./primarycolor.png)



## master
マスターブランチです。正式公開されたバージョンをここにいれます。



## develop
開発中のブランチです。


基本はこのブランチを追いかけてください

このブランチをチェックアウト後、自分のブランチを作成して作業してください。
ブランチ名は
MCID/ブランチ名

[例] takatronix/xxxx
