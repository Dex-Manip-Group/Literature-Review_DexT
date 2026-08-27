# A Bimanual Manipulation Taxonomy

- 编号：12 | 精标等级：B | 批次：2 | 状态：complete | 置信度：high
- 出版状态：IEEE RA-L 2022 | 年份：2022
- 来源：https://doi.org/10.1109/LRA.2022.3196158
- 本地全文：`referenced/01_bimanual_handover/2022_Bimanual-Manipulation-Taxonomy.pdf`

## 任务、拓扑与协调

- 任务：human bimanual manipulation taxonomy
- 拓扑：seven categories spanning uncoordinated, loosely coupled, tightly coupled symmetric/asymmetric and handover patterns；载荷路径：defines tight coupling as force transmission directly or through one/several objects；拓扑变化：frame-wise contact graph
- 角色：explicit hand-role and symmetry dimensions；协调必要性证据：taxonomy validated with rule-based classification; intent-only coordination remains hard to observe

## 传感与部署可实现性

- 触觉：contact inferred geometrically from inflated 3D models; force unavailable（Vicon motion capture + object models；hands and objects as nodes）
- 训练输入：6D hand/object poses and 3D models
- 部署输入：not a deployment policy
- 特权信息：训练=full mocap/object geometry；推理=not applicable to robot deployment；未来参考=no；仿真接触=no; geometric proximity contact
- 部署判断：not_applicable; representation is privileged for robot use

## 表征与实验

- 表征：contact graph + rule-based taxonomy；单元：hand/object nodes and contact edges
- 结构先验：coordination, physical interaction, role and symmetry hierarchy；来源：3D model overlap with 15 mm inflation and manual grouping；动态性：yes frame-wise
- 目标：预训练=not applicable；下游=rule-based bimanual category assignment；物理目标=contact only, no force
- 规模与拆分：KIT Bimanual Manipulation Dataset tasks annotated/classified；task/action examples, not ML train/test benchmark
- 基线/统计：taxonomy analysis rather than predictive baseline；matched budget=not applicable；seeds=not applicable
- 泛化：对象=object-agnostic claim based on graph topology; not strict held-out OOD；传感器=no；形态=human only；拓扑=taxonomy spans patterns but no learned transfer

## 三级证据链

1. 作者主张：coordination can be categorized using interaction, roles and symmetry; contact graphs plus rules operationalize the taxonomy
2. 可观察证据：frame-wise graph construction and rule-based classification on motion-capture tasks; error analysis identifies missing force and intent limitations
3. 精标判断：支持程度=partial。Provides the correct vocabulary for topology/roles but not an observation-grounded tactile encoder; BiCG should operationalize only measurable categories.

证据位置：pp.3--5 Sec. III--IV; pp.5--7 Sec. V, Figs. 2--4 and Tables I--II; p.7 force limitation; p.8 conclusion

## 对 BiCG-Rep 的决策

- 影响：foundational schema for topology coding and tool-mediated force paths
- 决策：use its axes in benchmark labels; add load path, observability and topology-transition fields
- 理由：Prevents conflating two hands moving at once with physically coupled coordination.
- 主要局限：contact inferred from geometry, no force, full mocap/object models, intent-based loose coordination cannot be recognized reliably
- 未决问题：code for exact rule implementation; quantitative inter-annotator validity of categories
