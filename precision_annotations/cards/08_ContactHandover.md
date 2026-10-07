# ContactHandover: Contact-Guided Robot-to-Human Object Handover

- 编号：08 | 精标等级：A | 批次：2 | 状态：complete | 置信度：high
- 出版状态：IROS 2024 | 年份：2024
- 来源：https://doi.org/10.1109/IROS58592.2024.10801777
- 本地全文：`referenced/01_bimanual_handover/2024_ContactHandover.pdf`

## 任务、拓扑与协调

- 任务：robot-to-human object handover planning
- 拓扑：robot-hand--object--human-hand (receiver contact planned, not sensed online)；载荷路径：handover endpoint only; load transfer is not measured；拓扑变化：two phases: robot grasp then expected receiver grasp
- 角色：robot giver / human receiver；协调必要性证据：contact-map/grasp/orientation ablations; no force-transfer experiment

## 传感与部署可实现性

- 触觉：offline human contact maps; no tactile array at deployment（RGB-D plus ContactDB annotations；not applicable）
- 训练输入：ContactDB object shape and human contact voxels
- 部署输入：RGB-D object reconstruction and fixed receiver geometry assumptions
- 特权信息：训练=ground-truth human contact maps from dataset；推理=no, but standing/static receiver assumption；未来参考=no；仿真接触=no
- 部署判断：deployable but nonreactive

## 表征与实验

- 表征：object-surface contact probability field；单元：64^3 object voxels/contact clusters
- 结构先验：object surface occupancy and predicted human-preferred contact；来源：ContactDB supervision and RGB-D geometry；动态性：no online dynamic contact inference
- 目标：预训练=supervised contact voxel classification；下游=grasp reranking and handover pose optimization；物理目标=visibility/reachability, not load share or wrench
- 规模与拆分：27 ContactDB objects; 50 contact maps/object；27 objects × 5 random seeds; qualitative unseen YCB objects
- 基线/统计：four component ablations；matched budget=same system and pose pipeline across ablations；seeds=5 random seeds; average metrics; no CI/significance
- 泛化：对象=qualitative YCB shapes/classes；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：object contact preferences improve grasp selection and delivery pose for natural handovers
2. 可观察证据：68.5% visibility+reachability success; five-seed ablations; qualitative unseen-object contact prediction
3. 精标判断：支持程度=partial。Useful for phase/contact-location labels but not a load-transfer controller or dynamic tactile representation baseline.

证据位置：pp.3--5 Sec. III; pp.5--7 Sec. IV--V, Table I; p.7 limitations; p.8 conclusion

## 对 BiCG-Rep 的决策

- 影响：supports object-centric contact anchors and handover phase design
- 决策：cite for contact phase and receiver-accessibility metrics; do not use as tactile/load baseline
- 理由：Its contact field can inspire interface-node priors, while BiCG must add sensed force flow and topology transition.
- 主要局限：no real-time human feedback, no tactile force/load transfer, static standing receiver, shape-only contact prediction
- 未决问题：code availability; quantitative unseen-object evaluation
