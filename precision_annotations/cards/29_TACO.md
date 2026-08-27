# TACO: Benchmarking Generalizable Bimanual Tool-Action-Object Understanding

- 编号：29 | 精标等级：A | 批次：5 | 状态：complete | 置信度：high
- 出版状态：CVPR 2024 | 年份：2024
- 来源：https://taco2024.github.io/
- 本地全文：`referenced/05_datasets_benchmarks/2024_TACO.pdf`

## 任务、拓扑与协调

- 任务：bimanual tool-action-object understanding dataset/benchmark
- 拓扑：right hand--tool--target object--left hand；载荷路径：many sequences physically coupled; no tactile/force measurement；拓扑变化：temporal 3D hand-tool-object interactions
- 角色：right tool hand / left target-object hand in benchmark convention；协调必要性证据：dataset/task forecasting analysis, not intervention

## 传感与部署可实现性

- 触觉：none（RGB/mocap-style 3D reconstruction；not applicable）
- 训练输入：multi-view RGB and 3D annotations
- 部署输入：benchmark-dependent
- 特权信息：训练=3D meshes/poses for benchmarks；推理=not a robot deployment study；未来参考=forecasting targets；仿真接触=no
- 部署判断：not_applicable

## 表征与实验

- 表征：dataset/3D HOI sequence representation；单元：two hands, tool, target object meshes/poses
- 结构先验：tool-action-object composition；来源：manual/automatic 3D annotations；动态性：implicit interaction graph over time
- 目标：预训练=benchmark-specific；下游=compositional recognition, forecasting and cooperative grasp synthesis；物理目标=penetration/collision/contact ratios, no force/load
- 规模与拆分：2,515 sequences, 5.2M frames, 12 subjects, diverse tool-action-object compositions；S1--S4 compositional splits including unseen geometries/categories/combinations
- 基线/统计：recognition transformers, forecasting models, ContactGen/HALO-VAE grasp synthesis；matched budget=shared benchmark splits; baseline modalities differ；seeds=benchmark metrics; seed/CI NR
- 泛化：对象=strong compositional/tool geometry splits；传感器=not applicable；形态=human subjects only；拓扑=novel tool-action-object composition, but no tactile topology

## 三级证据链

1. 作者主张：TACO enables generalizable bimanual tool-action-object understanding across novel compositions
2. 可观察证据：large multi-view dataset and S1--S4 benchmarks; marked degradation on novel compositions/geometries across recognition, forecasting and grasp synthesis
3. 精标判断：支持程度=strong as perception benchmark。Best task-topology and compositional split source for tool-use phase; not evidence for load sensing.

证据位置：pp.3--6 dataset; pp.7--11 Sec. 5, Tables 2--5; p.12 limitations

## 对 BiCG-Rep 的决策

- 影响：tool topology/OOD taxonomy source
- 决策：use task categories and compositional split design, not raw data as primary tactile training set
- 理由：Provides rigorous topology/task variation without confusing human visual data with robot tactile observations.
- 主要局限：no tactile/force, no articulated objects, human capture not robot control; contact ratio is geometric
- 未决问题：current download access terms; mapping sequences to physically simultaneous load paths
