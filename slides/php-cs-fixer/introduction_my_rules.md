---
title: PHP CS Fixer を使って強固なコードにしよう 🔍
description: Web Components API を社内コンポーネントで利用したときの書き味や感想について簡単にまとめてみました。
image: https://nonz250.github.io/slides/php-cs-fixer/introduction_my_rules.jpg
---

### PHP CS Fixer を使って

# 強固なコードにしよう 🔍

---

## PHP CS Fixer

https://github.com/FriendsOfPHP/PHP-CS-Fixer

皆さんご存知、PHPコードを修正してくれるツールになります。

今日はこのルールから自分がいいなぁと思ったものを紹介します。

ちなみにバージョンは3.8系になります。

https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/tag/v3.8.0

---

### とりあえず全部貼る。

<div style="display: flex; justify-content: space-around; align-item: center;">

```php
$rules = [
    '@PSR2' => true,
    'align_multiline_comment' => true,
    'array_syntax' => ['syntax' => 'short'],
    'binary_operator_spaces' => true,
    'blank_line_before_statement' => ['statements' => ['declare', 'do', 'for', 'foreach', 'if', 'switch', 'try']],
    'cast_spaces' => ['space' => 'none'],
    'class_attributes_separation' => true,
    'clean_namespace' => true,
    'combine_nested_dirname' => true, // risky
    'comment_to_phpdoc' => true, // risky
    'compact_nullable_typehint' => true,
    'concat_space' => ['spacing' => 'one'],
    'constant_case' => ['case' => 'lower'],
    'date_time_immutable' => true, // risky
    'declare_equal_normalize' => ['space' => 'none'],
    'declare_strict_types' => true, // risky
    'dir_constant' => true, // risky
    'ereg_to_preg' => true, // risky
    'final_class' => true, // risky
    'function_declaration' => [
        'closure_function_spacing' => 'none',
    ],
    'function_to_constant' => true, // risky
    'function_typehint_space' => true,
    'get_class_to_class_keyword' => true,
    'general_phpdoc_tag_rename' => true,
    'linebreak_after_opening_tag' => true,
    'list_syntax' => ['syntax' => 'short'],
    'lowercase_cast' => true,
    'lowercase_keywords' => true,
    'lowercase_static_reference' => true,
    'magic_constant_casing' => true,
    'magic_method_casing' => true,
    'mb_str_functions' => true, // risky
    'method_chaining_indentation' => true,
    'modernize_types_casting' => true, // risky
    'multiline_whitespace_before_semicolons' => false,
    'native_function_casing' => true,
    'native_function_type_declaration_casing' => true,
    'new_with_braces' => true,
    'no_alias_functions' => true, // risky
    'no_alias_language_construct_call' => true,
    'no_alternative_syntax' => true,
    'no_binary_string' => true,
    'no_blank_lines_after_class_opening' => true,
    'no_blank_lines_after_phpdoc' => true,
    'no_closing_tag' => true,
    'no_empty_comment' => true,
    'no_empty_phpdoc' => true,
    'no_empty_statement' => true,
    'no_extra_blank_lines' => [
        'tokens' => [
            'break',
            'continue',
            'curly_brace_block',
            'extra',
            'parenthesis_brace_block',
            'return',
            'square_brace_block',
            'throw',
            'use',
            'use_trait',
        ],
    ],
    'no_leading_import_slash' => true,
    'no_leading_namespace_whitespace' => true,
    'no_multiline_whitespace_around_double_arrow' => true,
    'no_null_property_initialization' => true,
    'no_php4_constructor' => true, // risky
    'no_short_bool_cast' => true,
    'no_singleline_whitespace_before_semicolons' => true,
    'no_space_around_double_colon' => true,
    'no_spaces_after_function_name' => true,
    'no_spaces_around_offset' => true,
    'no_spaces_inside_parenthesis' => true,
    'no_trailing_comma_in_list_call' => true,
    'no_trailing_comma_in_singleline_array' => true,
    'no_trailing_comma_in_singleline_function_call' => true,
    'no_trailing_whitespace' => true,
    'no_trailing_whitespace_in_comment' => true,
    'no_unneeded_control_parentheses' => true,
    'no_unneeded_import_alias' => true,
    'no_unused_imports' => true,
    'no_useless_else' => true,
    'no_useless_return' => true,
    'no_useless_sprintf' => true, // risky
    'no_whitespace_before_comma_in_array' => true,
    'no_whitespace_in_blank_line' => true,
    'non_printable_character' => true, // risky
    'normalize_index_brace' => true,
    'object_operator_without_whitespace' => true,
    'operator_linebreak' => [
        'position' => 'beginning'
    ],
    'ordered_class_elements' => true,
    'ordered_imports' => true,
    'php_unit_construct' => true, // risky
    'php_unit_dedicate_assert' => true, // risky
    'php_unit_dedicate_assert_internal_type' => true, // risky
    'php_unit_mock' => true, // risky
    'php_unit_namespaced' => true, // risky
    'php_unit_no_expectation_annotation' => true, // risky
    'php_unit_set_up_tear_down_visibility' => true, // risky
    'php_unit_strict' => true, // risky
    'php_unit_test_annotation' => true, // risky
    'php_unit_test_case_static_method_calls' => [ // risky
        'call_type' => 'this',
    ],
    'phpdoc_add_missing_param_annotation' => ['only_untyped' => false],
    'phpdoc_align' => [
        'align' => 'left',
    ],
    'phpdoc_indent' => true,
    'phpdoc_inline_tag_normalizer' => true,
    'phpdoc_no_access' => true,
    'phpdoc_no_alias_tag' => [
        'replacements' => [
            'type' => 'var',
            'link' => 'see',
        ],
    ],
    'phpdoc_no_package' => true,
    'phpdoc_order' => true,
    'phpdoc_order_by_value' => true,
    'phpdoc_return_self_reference' => true,
    'phpdoc_scalar' => true,
    'phpdoc_separation' => true,
    'phpdoc_single_line_var_spacing' => true,
    'phpdoc_summary' => true,
    'phpdoc_tag_type' => true,
    'phpdoc_to_comment' => true,
    'phpdoc_to_return_type' => true, // risky
    'phpdoc_trim' => true,
    'phpdoc_trim_consecutive_blank_line_separation' => true,
    'phpdoc_types' => true,
    'phpdoc_types_order' => [
        'sort_algorithm' => 'alpha',
        'null_adjustment' => 'always_last',
    ],
    'phpdoc_var_without_name' => true,
    'protected_to_private' => true,
    'psr_autoloading' => true, // risky
    'return_assignment' => true,
    'random_api_migration' => true, // risky
    'return_type_declaration' => ['space_before' => 'none'],
    'self_accessor' => true, // risky
    'self_static_accessor' => true,
    'semicolon_after_instruction' => true,
    'set_type_to_cast' => true, // risky
    'short_scalar_cast' => true,
    'simplified_if_return' => true,
    'single_blank_line_before_namespace' => true,
    'single_class_element_per_statement' => true,
    'single_import_per_statement' => true,
    'single_line_after_imports' => true,
    'single_line_comment_spacing' => true,
    'single_line_comment_style' => true,
    'single_quote' => true,
    'single_space_after_construct' => true,
    'space_after_semicolon' => true,
    'standardize_not_equals' => true,
    'static_lambda' => true, // risky
    'strict_comparison' => true, // risky
    'strict_param' => true, // risky
    'string_length_to_empty' => true, // risky
    'string_line_ending' => true, // risky
    'switch_case_semicolon_to_colon' => true,
    'switch_case_space' => true,
    'switch_continue_to_break' => true,
    'ternary_operator_spaces' => true,
    'ternary_to_null_coalescing' => true,
    'trailing_comma_in_multiline' => true,
    'trim_array_spaces' => true,
    'types_spaces' => true,
    'unary_operator_spaces' => true,
    'visibility_required' => true,
    'void_return' => true, // risky
    'whitespace_after_comma_in_array' => true,
    'yoda_style' => false,
];

$excludes = [
    'directories' => [
        'bootstrap/cache',
        'public',
        'resources',
        'storage',
        'vendor',
    ],
    'path' => [
        'artisan',
        'server.php',
        '.php-cs-fixer.dist.php',
        '.phpstorm.meta.php',
        '_ide_helper.php',
    ],
];

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->exclude($excludes['directories']);
foreach ($excludes['path'] as $path) {
    $finder->notPath($path);
}

return (new PhpCsFixer\Config)
    ->setRules($rules)
    ->setRiskyAllowed(true)
    ->setCacheFile(__DIR__ . '/.php_cs.cache')
    ->setFinder($finder);
```

<div style="width: 50%; margin-top: 10%; padding: 0 10rem;">
見えない😇

https://github.com/nonz250/php-cs-fixer-my-rules/blob/main/.php-cs-fixer.dist.php

こちらからどうぞ。
</div>

</div>

---

## 🦾 早速紹介

全ルールがまとまっているサイトはこちら

https://mlocati.github.io/php-cs-fixer-configurator/#version:3.8

わかりやすかったので。

---

## 🕒 date_time_immutable

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
new DateTime();
```
</div>

<div>
output

```php
<?php
new DateTimeImmutable();
```
</div>

</div>

これでより強固なコードに。

ガッツリコードをいじりますが、多分軽微な変更で十分。

---

## 🔹 declare_strict_types

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
```
</div>

<div>
output

```php
<?php declare(strict_types=1);
```
</div>

</div>

型厳密なコードになります。

フレームワークを採用している場合や、途中から導入する場合は動作確認が必須なので注意してください。

---

## 🤞 final_class

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
class MyApp {}
```
</div>

<div>
output

```php
<?php
final class MyApp {}
```
</div>

</div>

クラスが全て継承不可能になります。

多重継承を防ぐことに繋がるので私は好きです。

フレームワークによっては `Controller` クラスが対象になってしまいますが、 `abstract` にしちゃって対応とかしてます。

---

## 🔤 mb_str_functions

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
$a = strlen($a);
$a = strpos($a, $b);
$a = strrpos($a, $b);
$a = substr($a, $b);
$a = strtolower($a);
$a = strtoupper($a);
$a = stripos($a, $b);
$a = strripos($a, $b);
$a = strstr($a, $b);
$a = stristr($a, $b);
$a = strrchr($a, $b);
$a = substr_count($a, $b);
```
</div>

<div>
output

```php
<?php
$a = mb_strlen($a);
$a = mb_strpos($a, $b);
$a = mb_strrpos($a, $b);
$a = mb_substr($a, $b);
$a = mb_strtolower($a);
$a = mb_strtoupper($a);
$a = mb_stripos($a, $b);
$a = mb_strripos($a, $b);
$a = mb_strstr($a, $b);
$a = mb_stristr($a, $b);
$a = mb_strrchr($a, $b);
$a = mb_substr_count($a, $b);
```
</div>

</div>

全てをマルチバイト文字で計算するようにします。

ただこれはユースケースによってはデメリットになる可能性がありますので注意。

ただ、ビジネスロジックを実装する上では別に大丈夫だと考えています。

---

## ✍ no_empty_comment, no_empty_phpdoc

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
//
#
/* */
```
</div>

<div>
output

```php
<?php



```
</div>

</div>

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php /**  */
```
</div>

<div>
output

```php
<?php
```
</div>

</div>

余計なものは排除ですね。

---

## 🔧 php_unit_*

- php_unit_construct
- php_unit_dedicate_assert
- php_unit_dedicate_assert_internal_type
- php_unit_mock
- php_unit_namespaced
- php_unit_no_expectation_annotation
- php_unit_set_up_tear_down_visibility
- php_unit_strict
- php_unit_test_annotation
- php_unit_test_case_static_method_calls

これもRiskyなルールですが、ユニットテスト用のルールなので特に問題ないでしょう。

---

## ✍ phpdoc_*

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>

- phpdoc_add_missing_param_annotation
- phpdoc_align
- phpdoc_indent
- phpdoc_inline_tag_normalizer
- phpdoc_no_access
- phpdoc_no_alias_tag
- phpdoc_no_package
- phpdoc_order
- phpdoc_order_by_value
- phpdoc_return_self_reference
- phpdoc_scalar

</div>

<div>

- phpdoc_separation
- phpdoc_single_line_var_spacing
- phpdoc_summary
- phpdoc_tag_type
- phpdoc_to_comment
- phpdoc_to_return_type
- phpdoc_trim
- phpdoc_trim_consecutive_blank_line_separation
- phpdoc_types
- phpdoc_types_order
- phpdoc_var_without_name

</div>

</div>

PHPDocはしっかり書かない文化のほうが多いので、これがあるとそれなりに矯正できる。

---

## ＂single_quote

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php

$a = "sample";
$b = "sample with 'single-quotes'";
```
</div>

<div>
output

```php
<?php

$a = 'sample';
$b = "sample with 'single-quotes'";
```
</div>

</div>

PHPの `""` と `''` は動作が違うので `''` を採用します。

---

## 💥 static_lambda

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
$a = function () use ($b)
{   echo $b;
};
```
</div>

<div>
output

```php
<?php
$a = static function () use ($b)
{   echo $b;
};
```
</div>

</div>

`$this` が使えなくなる。スコープは守ろう。

---
## 🧐 strict_comparison, strict_param

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
$a = 1== $b;
```
</div>

<div>
output

```php
<?php
$a = 1=== $b;
```
</div>

</div>

<div style="display: flex; justify-content: space-around; align-item: center;">

<div>
input

```php
<?php
$a = array_keys($b);
$a = array_search($b, $c);
$a = base64_decode($b);
$a = in_array($b, $c);
$a = mb_detect_encoding($b, $c);
```
</div>

<div>
output

```php
<?php
$a = array_keys($b);
$a = array_search($b, $c, true);
$a = base64_decode($b, true);
$a = in_array($b, $c, true);
$a = mb_detect_encoding($b, $c, true);
```
</div>

</div>

比較するときは型までしっかり比較しよう。

---

## 他にも色々紹介したいことがあるけどここまで。

強固なコード、コメント、テストにするためのルールなのでRiskyなルールがたくさん出てきました。

採用する場合はいきなり採用するのではなく、しっかりテストをしてから反映しましょう。

これができるとコードが均一になりやすくなります。

また、コードの矯正ルールだけではなく、コードの整形（スペースやカンマの取り扱いなどの）ルールも便利なのでよかったら見てください。

---

## おしまい。　　🏍 ＝＝3
