import Foundation

// 参照型　値への参照を表す型
// インスタンスは値への参照を表す型
// Class
// 変数や定数への参照型の値の代入はインスタンスに対する参照の代入を意味するため、複数の変数や定数での1つの参照型のインスタンスを共有できます
// また、変数や、定数の代入時や関数の受け渡し時にはインスタンスのコピーが発生しないため、効率的なインスタンスの受け渡しができるとゆメリットがあります

//　値の変更の共有
// 値型では変数や定数は他の値の変更による影響を受けないこどが保証さてれいましたが、参照型では一つのインスタンスが複数の変数や定数が共有されるため、
// ある値に対する変更はインスタンスを共有している他の変数や定数にも伝播する

class IntBox {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}

var a = IntBox(value: 1)
var b = a

a.value // 1
b.value // 1

// ここで伝播している
a.value = 2
a.value // 2
b.value // 2

// 値型と参照型の使い分け
// 値型は変数や定数への代入や、引数の受け渡しのたびにコピーされ、変更は共有されない
// 一度代入された値は明示的に再代入しない限りは不変であることが保証される
//　参照型は　変数や、定数への代入や引数への受け渡しの際にコピーされずに参照が渡されるため、変更が共有される
//　一度代入された値が変更されないことの保証は難しい

// 安全にデータを取り扱うためには積極的に値型を使用
//　参照型は状態管理などの変更の共有は必要となる範囲のみにどどめるとよい


