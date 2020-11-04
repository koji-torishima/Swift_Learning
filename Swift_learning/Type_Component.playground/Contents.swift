import Foundation

/*
 swiftの型はクラス、構造体、列挙型、として定義してある、
 標準ライブラリの型の多くは構造体として定義しており、Cocoaのほとんどは型のクラスとして定義してある
 クラス、構造体、列挙型の３つには、メソッド、、プロパテなどの、共通要素が用意されている

 - 型に共通するもの
 代表的な型を構成する要素は、方が持つ値を保持するプロパテと型の振る舞いを表すメソッドの２つ
 プロパテは型に紐付いた変数や、定数と言い換えることができ、メソッドは型に紐付いた関数と言い換えることができる
 この二つにくあえ、型を構成する要素には、初期化を行うイニシャライザ、コレクションの要素を取得するサブスクリプト
 型内に型を定義する、ネスト型がある

 */


//　型の基本
// インスタンス　→ 型を実体化したものであり、型に定義されているプロパティやメソッドを持つ


//　構造体
/*
　struct 構造体名　{
    構造体の定義
}

// class
class 　クラス名　{
    クラスの定義
}

// enum

enum 列挙型名　{
    列挙型の定義
}

*/

//　例
struct SomeStruct {}

class SomeClass {}

enum SomeEnum {}

//　インスタンス化
// 型をインスタンス化するには、次のように（）をつけて、イニジャライザを呼ぶ
//　（）内には、必要に大じてイニシャライザの引数を渡します
//　型名()

//　前項で定義したSomeStructとSomeClassはそれぞれ、構造体とクラスであるため、デフォで引数なしのイニシャライザが用意されている

// インスタンス化
let someStruct = SomeStruct()
let someClass = SomeClass()

// 型の内部でのインスタンスへのアクセス
//　selfを使って、インスタンス自身にアクセスできる

struct SomeStructA {
    let value = 123

    func printValue() {
        print(self.value)
    }
}

// インスタンスではなくインスタンスのプロパテやメソッドにアクセスする場合、selfはいらない

struct SomeStructB {
    let value = 456

    func printValue() {
        // self　はいらない
        print(value)
    }
}

//　インスタンスのプロパティと、同名の変数や、定数がスコープ内に存在する場合は、それらを区別するためにselfを使う

struct SomeStructC {
    let value: Int

    init(value: Int) {
        // self.value はプロパティ をさし、　value　initの引数をさす
        self.value = value
    }
}

// 型内部での型自身のアクセス
// 型の内部のプロパテやメソッドなどの値の中では、大文字のSelfキーワードを通じて、型自身にアクセスできます。
//　Selfキーワードを使うと、型自身に紐ずくメンバーである、スタティックプロパティやスタティックメソッドへのアクセスが簡単になる

struct SomeStructD {
    static let sharedValue: Int = 73

    func printShardValue() {
        print(Self.sharedValue)
    }
}

// プロパティ　型に紐付いた値
/*
型に紐付いた値で、型が表すものの属性の表現などに使用される
 本という型はタイトルや著者名や概要などのプロパティを持っている
 この１つ１つの本ごとに異なりますから、プロパティのインスタンスに紐付いた変数や定数であることも言える

 */

//　定義方法
// var
// let
// で定義する

/*
struct 構造体 {
    var プロパティ: プロパティの型 = 式　// 再代入可能
    let プロパティ: プロパティの型 = 式　// 再代入不可
}
*/

/*
 プロパティにアクセスするには、型のインスタンスが再代入された変数や定数に、. とプロパテ名をつけて変数名. プロパティ名のようにできる
 次の例では、SomeStruct型に再代入可能なプロパティvariableと再代入不可能なプロパティconstantを定義し、
 それぞれのプロパティにアクセスしている
 */


struct SomeStructF {
    var valiable = 123
    let constant = 456
}

let someStructF = SomeStructF()
let a = someStructF.valiable // 123
let b = someStructF.constant // 456


// プロパテの型の整合性を保つため、インスタンス化の完了までに全てのプロパティが代入されていなければなりません。
//　したがって、全てのプロパティは、宣言時に初期化を持っているかイニシャライザ内で初期化されるかのいずれかの方法で値を持つ必要がある

// 紐ずく対象の分類
//　プロパテは型のインスタンスに紐ずくインスタンスプロパティと型そのものに紐ずくスタティックプロパティがある

//　インスタンスプロパティ 型に紐ずくプロパティ
// 異なる値を持たせることができる
//　var let はデフォでインスタンスプロパティ

struct Greeting {
    var to = "koji"
    var body = "Hello"
}

let greeting1 = Greeting()
var greeting2 = Greeting()

greeting2.to = "torishima"

let to1 = greeting1.to // koji
let to2 = greeting2.to // torishima

//　スタティックプロパティ
// 型自身に紐ずくプロパティ

//　型のインスタンスに紐付くのではなく、型自身に紐ずくプロパティ
//　インスタンス間で共通する値の保持などに使用する

//　スタティックプロパティを定義するには　static をつける
//　アクセス方法　型.スタティックプロパティ

//　例
//　スタティックプロパティsignatureは全てのGreeting型の値に共通した値となる
// greeting型は、インスタンスプロパテのtoとbody、スタティックプロパティのsignatureを組み合わせて、インスタンスごとに異なる宛先と文そして共通の署名を持つことになる

struct GreetingCom {
    static let signature = "Sent from iPhone" // 共通している

    var to = "koji torishima"
    var body = "Hello"
}

func printOnSelf(greeting: GreetingCom) {
    print("to: \(greeting.to)　変更可能")
    print("body: \(greeting.body)　変更可能")
    print("signature: \(GreetingCom.signature)　これは共通してます")
}

let greetingA = GreetingCom()
var greetingB = GreetingCom()

greetingB.to = "tanaka tatuya"
greetingB.body = "Hi"

printOnSelf(greeting: greetingA)
print("--")
printOnSelf(greeting: greetingB)

// インスタンスプロパティはインスタンス生成するまでに値を代入できれば良いので、プロパティの宣言意外にイニシャライザ内でも値を代入できるが、スタティックプロパティはイニシャライザに相当する初期化タイミングがないため、宣言時に必ず初期値を持たせる必要はある

//　以下はコンパイルerror

/*
struct AAA {
 値を持っていないためError
 'static var' declaration requires an initializer expression or getter/setter specifier
 static var' の宣言には、初期化式またはゲッター/セッター指定子が必要です。

 static var aaa: String
}
 */

// ストアドプロパティ 値を保持するプロパティ
// 変数や定数のように値を代入して、保持する

/*
 var インスタンスプロパティ名: プロパティの型 = 式
 let インスタンスプロパティ名: プロパティの型 = 式
 static var インスタンスプロパティ名: プロパティの型 = 式
 static let インスタンスプロパティ名: プロパティの型 = 式

 */

struct SomeStructG {
    var variable = 123              // 再代入可能
    let constant = 456              // 再代入不可能
    static var staticVariable = 789 // 再代入可能 型自身に紐ずく
    static let staticConstant = 890 // 再代入不可能　型自身に紐ずく

}

//　プロパティオブザーバー　ストアドプロパティの変更監視
// 変更前と変更後に文を実行するもの

/*

 var プロパティ名 = 初期値　{

     willSet {
     　　プロパティの変更前に実行する文
     　　変更後の値には定数newValueとしてアクセスできる
     }

     didSet {
     プロパティの変更後に実行する文
     }
 }
 */


struct GreetingG {
    var to = "koji" {
        willSet {
            print("willSet: (to:\(self.to), newValue: \(newValue))")
        }

        didSet {
            print("didSet: (to: \(self.to))")
        }
    }
}

var greetingG = GreetingG()
greetingG.to = "tanaka"

//　レジーストアドプロパティ　アクセス時までの初期化を遅延させるプロパティ

// lazy var インスタンスプロパティ: プロパティの型 = 式
// static lazy var スタティックプロパティの型　= 式
// let  では使えない

struct SomeStructH {
    var value: Int = {
        print("valueの値を生成します")
        return 1
    }()

    lazy var lazyValue: Int = {
        print("lazyValueの値を生成します")
        return 2
    }()
}

var someStructH = SomeStructH()
print("SomeStructHをインスタンス化しました")
print("valueの値\(someStructH.value)です")
print("lazyValueの値は\(someStructH.lazyValue)の値です")

//　通常のプロパティ（value）はインスタンス化時に初期化が行われ、Lazyの場合はアクセス時に初期化が行われる
//　初期化コストの高いプロパティの初期化をアクセス時まで伸ばし、アプリケーションのパフォーマンスを向上させることができる
//　通常は、ストアドプロパティの初期化時には、他のプロパティやメソッドを利用することはできません。
//　しかしレジーストアドプロパティの初期化はインスタンス生成よりも後に行われるため、初期化時に他のプロパティやインスタンスにアクセスできます


// rei レジーストアドプロパティであるlazyValueプロパティの初期化にvalueプロパティとdouble(of:)メソッドを使用しています。
struct SomeStructI {
    var value = 1
    lazy var lazyValue = double(of: value)

    func double(of value: Int) -> Int {
        return value * 2
    }
}

//　コンピューテッドプロパティ　値を保持せず算出するプロパティ

