# 精标交付说明

本目录包含 30 篇核心论文的人工精标结果。

- `precision_annotations.csv`：机器可筛选的主表，一篇一行。
- `cards/`：30 张逐篇证据卡，保留任务、输入、表征、实验、三级证据链和 BiCG 决策。
- `schema.md`：字段定义、缺失值和质量控制规则。
- `精标综合结论.md`：把精标结果转化为 BiCG-Rep 的竞争定位、复现顺序和 Go/Pivot/Stop 决策。
- `precision_annotations.xlsx`：格式化工作簿（生成后放置）。

## 使用方式

1. 用 `coding_status=complete` 和 `coding_confidence` 筛选可进入论文论证的记录。
2. 用 `privileged_inference`、`future_reference`、`simulator_contacts` 检查部署可实现性。
3. 分别筛选 `object_ood / sensor_ood / embodiment_ood / topology_ood`，不要合并为模糊的 generalization。
4. 引用结论前打开对应 `cards/` 文件，按 `evidence_locations` 回到原文复核。

## 重要限制

精标是对论文和截至核验日可见 artifact 的证据编码，不等同于独立复现实验。代码审计结论只适用于被检查的公开快照，不能反推作者内部实验实现。
