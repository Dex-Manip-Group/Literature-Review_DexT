# AnyTouch: Learning Unified Static-Dynamic Representation across Multiple Visuo-Tactile Sensors

- 编号：24 | 精标等级：B | 批次：4 | 状态：complete | 置信度：high
- 出版状态：ICLR 2025 | 年份：2025
- 来源：https://proceedings.iclr.cc/paper_files/paper/2025/hash/4d893f766ab60e5337659b9e71883af4-Abstract-Conference.html
- 本地全文：`referenced/02_tactile_representation/2025_AnyTouch.pdf`

## 任务、拓扑与协调

- 任务：unified static-dynamic tactile representation across sensors
- 拓扑：single tactile interface/pretraining；载荷路径：no bimanual path；拓扑变化：temporal contact content only
- 角色：not applicable；协调必要性证据：not applicable

## 传感与部署可实现性

- 触觉：static tactile images and dynamic tactile videos（multiple vision-based tactile sensors including GelSight/TACTO/Taxim families；single/fingertip sensors）
- 训练输入：heterogeneous tactile image/video plus paired vision/text
- 部署输入：tactile image/video encoder
- 特权信息：训练=no；推理=no；未来参考=no；仿真接触=synthetic datasets included
- 部署判断：deployable_with_supported tactile sensors

## 表征与实验

- 表征：cross-sensor static-dynamic multimodal latent；单元：image/video tactile tokens
- 结构先验：shared semantic alignment across tactile, vision and text；来源：paired multimodal datasets；动态性：no explicit graph
- 目标：预训练=contrastive/alignment objectives across modalities and sensors；下游=classification/retrieval/generation and pouring estimation；物理目标=dynamic mass change in pouring probe
- 规模与拆分：multi-dataset corpus; statistics in Appendix Table 5；seen sensor, unseen dataset and unseen simulated sensor datasets
- 基线/统计：UniTouch/T3 and component/modality ablations；matched budget=reasonable benchmark comparison; training data differs for some baselines and is flagged；seeds=task-specific; pouring mean error, seeds NR
- 泛化：对象=dataset-level；传感器=yes (TACTO/Taxim settings)；形态=no；拓扑=no

## 三级证据链

1. 作者主张：paired multimodal bridges learn unified static/dynamic tactile features that generalize across sensors
2. 可观察证据：seen/unseen sensor benchmarks, static/dynamic tasks, real pouring and modality/module ablations
3. 精标判断：支持程度=partial-to-strong。Good local cross-sensor alternative, but FTP-1/HTT are more direct for heterogeneous physical modalities.

证据位置：pp.5--9 method; pp.10--13 Tables 1--4; appendix Tables 5--7

## 对 BiCG-Rep 的决策

- 影响：local encoder and sensor-OOD baseline
- 决策：use as optional optical-tactile encoder; do not mix with graph comparisons unless frozen/matched
- 理由：Provides a sensor-OOD control without altering system-level graph design.
- 主要局限：largely vision-based/sim tactile families and semantic/static probes; no dexterous bimanual load topology or physical edge targets
- 未决问题：exact licenses across source datasets; strict no-overlap sensor splits
