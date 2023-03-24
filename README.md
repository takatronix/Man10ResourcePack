# Man10 Resource Pack
シーズン３用リソースパック

たろさんこれけしてみて

| どのアイテムに割りあてるか | カテゴリ名(modles/texturesの名前) | 用途                                     |
| -------------------------- | --------------------------------- | ---------------------------------------- |
| wooden_hoe                 | hat                               | 帽子、頭につけるもの                     |
| iron_hoe                   | weapon/gun                        | 銃                                       |
| iron_sword                 | weapon/sword                      | 近接武器、剣など                         |
| iron_shovel                | weapon/magic                      | 手にもつ魔法武器、杖など                 |
| stone_shovel               | toy                               | パーティーグッズ、おもちゃ                 |
| gunpowder                  | weapon/ammo                       | 弾薬                                     |
| potion                     | drink                             | 飲み物                                   |
| baked_potato               | food                              | 食べ物                                   |
| stone_hoe                  | equipment                         | 設備・家具類（地面のおくこと前提）          |
| golden_hoe                 | gadget                            | ガジェット類（地面（額縁）におけること）    |
| iron_nugget                | slot                              | スロット図柄                             |
| oak_sapling                | virtualblock                      | バーチャルブロック                       |
| gold_nugget                | number                            | 数字                                     |
| golden_shovel              | veheicle                          | 乗り物、自転車、車など                   |
| wooden_shovel              | icon                              | discrodアイコンなどUIに使うもの          |
| cod                        | fish                              | 魚（すべてローマ字、伸ばし棒はアンダーバー）|
| flint                      | shigen                            | 鉱石(粉末)                              |
| nether_wart                | drug                              | ポーションレシピ(上)                      |

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
      (続く,,texturesと同等)
- textures
  - block (マイクラ本来のテクスチャを置き換えるとき)
  - man10
    - currency (通貨アイテム・ガチャコインなど)
    - common (共通化できるテクスチャ)
    - fish　(魚)
    - food (食べ物)
    - drink(飲み物)
    - drug(薬)
    - tool（ペンチとか手にもつ道具)
    - toy(パーティーグッズ、おもちゃ)
    - hat(頭にかぶるもの)
    - glasses(眼鏡とか)
    - shigen(鉱石、鉱物粉末)
    - slot(カジノのスロットとか)
    - equipment(設備 ATMや機械など)
    - gadget(小物、mPhoneとかちょっとしたもの)
    - icon(ディスコードアイコンなどのアイコン)
    - number(数字)
    - letter(文字)
    - virtualblock(オークの苗木)
    - drug(薬) 
    - other　(あてはまらないもの)
    - weapon
      - magic (魔法)
      - gun　(銃)
      - sword（剣)
      - other （その他)

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


#### テクスチャ採用のマニュアル

- 1.Man10ResourcePackの "最新版" を必ずpullする
- 2.Man10ResourcePack環境に採用予定テクスチャを導入する
- 3.必ずマイクラ内で適用作業を行い、バグやミッシングがないことを確認すること
- 4 万が一、不備や抜けが確認された場合には本人に通達ののち回収を求めるか不採用にすること
- 5.２回以上確認したのち、GithubDesktop側でsummaryに追加テクスチャを記入  (例: AK47,M4A1実装 iron_hoe編集)
- 6.もう１度確認した後、Pushボタンを押してMasterに実装　その後テクスチャ配信または再起動で実装されます。
- 注意点として、テクスチャを大量に導入する際は必ず複数回に分けること　一気にやると修正の際にどれがおかしいのかわかりづらくなります。

- 確認点 UVがはがれている場所の有無　ミッシングテクスチャの有無　.mcmetaの確認　画像サイズの確認　設置時と持った時のサイズ確認　過剰なポリゴン数は弾くこと。

#### privateテクスチャの実装手順
- 1.上記の　テクスチャ採用のマニュアルより　一連の過程の終了後、text鯖で /mtex handを実行
- 2 テクスチャを確認後 mtexGUIより取り出す
- 3 取り出したテクスチャを手に持ち /mf add <提出者のMCID>でman10メイン鯖に追加
-


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

プライマリーカラーのほかにgray0(白) - gray15(黒）やrainbowなど共通して使えそうな色がいろいろはいっています。
色を追加するまえにまずこのフォルダの中から使える色があるか確認しましょう

## バーチャルブロックについて

バリアブロックに光る看板をつけて、そこにバーチャルブロックをいれると、ブロックとして使えます。
既存のブロックテクスチャに影響を与えず、ブロックを追加することができます




## master
マスターブランチです。正式公開されたバージョンをここにいれます。

プッシュされたものは自動でman10serverに反映されます

このブランチをチェックアウト後、自分のブランチを作成して作業してください。
ブランチ名は
MCID/ブランチ名

[例] takatronix/xxxx


# ダウンロード先

masterに上がったものは、サーバーリソースパックで反映されるほか、自動的に以下のアドレスにも保存されます。
頻繁に更新されるので、基本的にはサーバーリソースパックをご利用ください。

https://man10.red/Man10ResourcePack.zip
