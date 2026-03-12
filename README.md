# DuckPGQ テスト

[DuckPGQ](https://duckpgq.org/) は DuckDB の拡張機能で、SQL/PGQ（SQL:2023 標準のグラフクエリ構文）をサポートします。

## セットアップ

[Nix](https://nixos.org/) と [direnv](https://direnv.net/) が必要です。

```bash
direnv allow
```

これにより DuckDB が利用可能になります。

## 動作確認

### 一括実行

```bash
duckdb < examples/getting-started.sql
```

### 入力を確認しながら実行

`-echo` オプションを付けると、実行される SQL 文がそのまま出力に表示されます。
どのクエリがどの結果を返しているか追いやすくなります。

```bash
duckdb -echo < examples/getting-started.sql
```

### 対話モードで試す

```bash
duckdb
```

起動後、`examples/getting-started.sql` の中身を順に貼り付けて実行できます。
対話中に `.echo on` / `.echo off` でエコー表示を切り替えられます。

## サンプルの内容

`examples/getting-started.sql` では以下を実行します。

1. DuckPGQ 拡張のインストール・ロード
2. サンプルデータ作成（Person テーブル、Knows テーブル）
3. プロパティグラフ `social_network` の定義
4. パターンマッチクエリ — Alice の友達の友達を検索
5. 最短経路クエリ — Alice から Diana への最短経路
6. 直接の知り合い一覧

## 参考リンク

- [DuckPGQ 公式サイト](https://duckpgq.org/)
- [DuckPGQ GitHub](https://github.com/cwida/duckpgq-extension)
- [DuckDB Community Extensions - duckpgq](https://duckdb.org/community_extensions/extensions/duckpgq)
