-- DuckPGQ 動作確認
-- 使い方: duckdb < examples/getting-started.sql

-----------------------------------------------
-- 1. 拡張のインストールとロード
-----------------------------------------------
INSTALL duckpgq FROM community;
LOAD duckpgq;

-----------------------------------------------
-- 2. サンプルデータの作成
-----------------------------------------------
CREATE TABLE Person (id INTEGER PRIMARY KEY, name VARCHAR);
INSERT INTO Person VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie'),
  (4, 'Diana');

CREATE TABLE Knows (src INTEGER, dst INTEGER);
INSERT INTO Knows VALUES
  (1, 2),  -- Alice -> Bob
  (2, 3),  -- Bob -> Charlie
  (3, 4),  -- Charlie -> Diana
  (1, 3),  -- Alice -> Charlie
  (2, 4);  -- Bob -> Diana

-----------------------------------------------
-- 3. プロパティグラフの定義
-----------------------------------------------
CREATE PROPERTY GRAPH social_network
VERTEX TABLES (Person)
EDGE TABLES (
  Knows
    SOURCE KEY (src) REFERENCES Person (id)
    DESTINATION KEY (dst) REFERENCES Person (id)
    LABEL knows
);

-----------------------------------------------
-- 4. パターンマッチクエリ: 友達の友達
-----------------------------------------------
.print '--- 友達の友達 ---'
SELECT * FROM GRAPH_TABLE(social_network
  MATCH (a:Person)-[k1:knows]->(b:Person)-[k2:knows]->(c:Person)
  WHERE a.name = 'Alice'
  COLUMNS (a.name AS person, b.name AS friend, c.name AS friend_of_friend)
);

-----------------------------------------------
-- 5. 最短経路クエリ: Alice から Diana への最短経路
-----------------------------------------------
.print '--- Alice → Diana 最短経路 ---'
SELECT * FROM GRAPH_TABLE(social_network
  MATCH p = ANY SHORTEST
    (a:Person WHERE a.name = 'Alice')-[k:knows]->+(b:Person WHERE b.name = 'Diana')
  COLUMNS (path_length(p) AS hops, vertices(p) AS path_vertices)
);

-----------------------------------------------
-- 6. 全ペア間の接続確認
-----------------------------------------------
.print '--- 直接の知り合い一覧 ---'
SELECT * FROM GRAPH_TABLE(social_network
  MATCH (a:Person)-[k:knows]->(b:Person)
  COLUMNS (a.name AS from_person, b.name AS to_person)
)
ORDER BY from_person, to_person;
