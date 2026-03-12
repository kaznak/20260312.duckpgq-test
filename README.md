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

### SQL/PGQ 標準

- [ISO/IEC 9075-16:2023 — SQL Part 16: Property Graph Queries (SQL/PGQ)](https://www.iso.org/standard/79473.html) — 公式 ISO 標準ページ
- [Graph Pattern Matching in GQL and SQL/PGQ](https://dl.acm.org/doi/10.1145/3514221.3526057) (SIGMOD 2022) — SQL/PGQ のグラフパターンマッチング言語 (GPML) を解説した論文
- [GQL and SQL/PGQ Resource Collection](https://github.com/szarnyasg/graph-data-management/blob/main/GQL-and-SQL-PGQ.md) — GQL/SQL/PGQ に関するリソース集（Gabor Szarnyas 管理）

### DuckPGQ

- [DuckPGQ 公式サイト](https://duckpgq.org/)
- [DuckPGQ GitHub](https://github.com/cwida/duckpgq-extension)
- [DuckDB Community Extensions - duckpgq](https://duckdb.org/community_extensions/extensions/duckpgq)
- [DuckPGQ: Efficient Property Graph Queries in an analytical RDBMS](https://www.cidrdb.org/cidr2023/papers/p66-wolde.pdf) (CIDR 2023)
- [DuckPGQ: Bringing SQL/PGQ to DuckDB](https://www.vldb.org/pvldb/vol16/p4034-wolde.pdf) (VLDB 2023 Demo)
