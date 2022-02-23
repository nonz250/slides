### このままいけるか？

# Web Components API 🚀 

---

## Web Components

https://developer.mozilla.org/ja/docs/Web/Web_Components

VueやReactとは別物っぽい。。？

---

### Reactの[公式HP](https://ja.reactjs.org/docs/web-components.html)では、

> React と Web Components は異なる課題を解決する為に構築されました。Web Components はコンポーネントをパッケージ化して、高い再利用性を与えます。一方で React は DOM とデータを同期させる為の宣言型のライブラリを提供しています。

### Vueの[公式HP](https://v3.ja.vuejs.org/guide/web-components.html#vue-%E3%81%A6%E3%82%99%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%A0%E8%A6%81%E7%B4%A0%E3%82%92%E4%BD%BF%E3%81%86)では、

> 私たちは Vue と Web コンポーネントを主に補完的な技術とみなすことができます。


<div style="width:100; text-align: right">
らしい。
</div>

---

よくわからんものは使ってみる派。

## 🦾 Smaregi Header に利用してみた。

---

## 🕒 経緯

<div style="display: flex; justify-content: space-around; align-item: center;">

![w:400](/slides/web-components-api/images/result_1.png)

![w:400](/slides/web-components-api/images/result_2.png)

</div>

Vueが多数。たまにReact。

Vue3対応やReactやりたいチームが多そうでしたので、生のjsで書けるものを選択したという経緯。

---

## ✍ 実装（テンプレート）

```html
<div id="SmaregiHeader" class="cf">
    <div class="btn-box">
        <div id="GlobalNavMenu" class="nav-menu">
            <!-- 略 -->
        </div>
        <div id="GlobalNavInfo">
            <!-- 略 -->
        </div>
        <div id="GlobalNavApp">
            <!-- 略 -->
        </div>
    </div>

    <div class="app-market-link">
        <!-- 略 -->
    </div>

    <div class="additional">
        <!-- slot使える -->
        <slot></slot>
    </div>
</div>
```

普通にHTMLを書くイメージ。ここにハードルはない。

---

## ✍ 実装（処理）

```js
import style from './style.scss';
import html from './template.html';

// styleを<template></template>の中に埋め込む。
const template = document.createElement('template');
template.innerHTML = `<style>${style}</style>${html}`;

export class SmaregiHeader extends HTMLElement {
    /**
     * custom propertyの定義。
     */
    static get observedAttributes() {
        return [
            'is-support',
        ]
    }

    constructor() {
        super();
        this.attachShadow({mode: 'open'});
        // templateを挿入。
        this.shadowRoot.appendChild(template.content.cloneNode(true));

        // DOM取得も普通のjsの書き味。
        this._navMenu = this.shadowRoot.querySelector('#GlobalNavMenu');

        // 初期処理とか書けばいいと思う。
        this._isSupport = false;
    }

    /**
     * 初期処理。Vueでいうmountedだと勝手に思っている。
     */
    connectedCallback() {
        // eventの登録とか。
        document.addEventListener('click', (event) => {
        });
    }

    /**
     * attributeの値が追加/削除/変更されたときのコールバック関数
     * @param name attributeの名前
     * @param oldValue 変更前の値
     * @param newValue 変更後の値
     */
    async attributeChangedCallback(name, oldValue, newValue) {
        // 重要かも。後で解説。
        newValue = this.isJson(newValue) ? JSON.parse(newValue) : newValue;
    }

    /**
     * JSONに変換可能かを取得します。
     * @param value
     * @returns {boolean}
     */
    isJson(value) {
        // もちろんAPI以外の関数も定義できる。
    }
}
```

[リファレンスはこれ](https://developer.mozilla.org/ja/docs/Web/Web_Components#%E3%83%AA%E3%83%95%E3%82%A1%E3%83%AC%E3%83%B3%E3%82%B9)を見たほうがいい。APIなどは少ないため障壁は低めだと思う。

---

## 🤞 使うときは。。

**(Attributeの値をJSONでパースしたときのみ)**

```html
<smaregi-header is-support="true" />
<smaregi-header is-support="false" />
<smaregi-header is-support />
<smaregi-header />
```

---

## 🔧 カスタム要素の定義

```js
/**
 * custom propertyの定義。
 */
static get observedAttributes() {
    return [
        'account-name',
        'is-support',
    ]
}
```

追加したpropertyが利用できる

```html
<smaregi-header account-name="Nozomi Hosaka" is-support />
```

---

## 🔧 DOM接続時

```js
/**
 * 初期処理。Vueでいうmountedだと勝手に思っている。
 */
connectedCallback() {
    // eventの登録とか。
    document.addEventListener('click', (event) => {
    });

    // クラス変数にDOMを入れとくと便利かも？
    this._domAppListBtn.addEventListener('click', (event) => {
        // 処理
    });
}
```

DOMが無いとできないことを書くといいかも。自分は`mounted`の感覚で書いてます。

---

## 🔍 カスタムプロパティの監視

```js
/**
 * attributeの値が追加/削除/変更されたときのコールバック関数
 * @param name attributeの名前
 * @param oldValue 変更前の値
 * @param newValue 変更後の値
 */
async attributeChangedCallback(name, oldValue, newValue) {
    // 重要かも。後で解説。
    newValue = this.isJson(newValue) ? JSON.parse(newValue) : newValue;
}
```

```html
<smaregi-header is-support="false" />
```

propertyの値は`String`。普通に処理すると`"false"`は`true`になってしまったり、`{ hoge: "fuga" }`が`"{Object}"`になってしまう。

そこでJsonにパースして型付ける。

---

## ✍ 書き味

- View Modelのように考えると面倒臭いことが多い。
  - 変数のバインドが無いので自作する必要がある。
  - cssの変更が特に面倒。
- `attributeChangedCallback`は第一引数を見て条件分岐する必要がある。つまり`if`文だらけになる。
- `attribute`が`String`なので、イベントの伝播は一工夫いるかも。`function`を渡すためには...？

生のjsでゴリゴリ書く感じなので、**コンポーネントの粒度に要注意**。

少しでも大きくなるとコード量が大変なことになる。。

正直、振る舞いやデザイン（アニメーション）を封じ込めるためにはスマレジヘッダーくらいの大きさが限界かも。

---

## 🤔 どんなときに使うといい？

- フレームワーク依存したくないとき
  - Vue2 → Vue3に対応しやすい
  - Vue, Reactを両立しているプロジェクトに導入しやすい
- フレームワークを入れるまでもない小さなモノに対応したいとき

まだまだ過渡期。今後の発展に期待。

現状は商品のコンポーネントに利用するほどでは無い。

React並にtsと相性良いかも。生のjsだから当然か。tsx書ける分Reactの方が優勢。

---
## 🧐 色々な知見は溜まっているっぽい

### “Web Componentsだけ” で新サービスを実装して見えたこと

https://qiita.com/aggre/items/9d77085a32764ffe994d

### Web Componentsが変えるWeb開発の未来

https://html5experts.jp/1000ch/8906/

---
## 🏃 これからのWeb Components

これまでは、Web ComponentsといえばPolymer（フレームワーク）がWeb Componentsを利用したものとして一般的だったが、それすら使わずにスマレジヘッダーレベルのものならしっかりと実装できた。

スマレジヘッダーと同じ感じでスマレジフッターみたいなものができたときや、（POSテーマ / Waiterテーマ / Timecardテーマみたいにスタイルを分けた上で）サイドメニューの共通化にはピッタリ。

ロゴのアイコン(CSS)化を合わせて、`smaregi-component-pack`みたいなライブラリを一式配布できるようになると、各プロジェクトだけでなく、**一般公開した上でプラットフォームアプリにも利用していただくことは可能かもしれない**。

---

## おしまい。　　🏍 ＝＝3

<small style="font-size: 0.5rem;">時間があればコードと動作を見ます。</small>