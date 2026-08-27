# Neural Contact Fields: Tracking Extrinsic Contact with Tactile Sensing

- 编号：20 | 精标等级：B | 批次：3 | 状态：complete | 置信度：high
- 出版状态：ICRA 2023 | 年份：2023
- 来源：https://arxiv.org/abs/2210.09297
- 本地全文：`referenced/03_graph_physics_contact/2023_Neural-Contact-Fields.pdf`

## 任务、拓扑与协调

- 任务：extrinsic contact tracking from tactile sequences
- 拓扑：gripper--object--environment；载荷路径：not bimanual；拓扑变化：yes: contact/no-contact, multi-patch and changing locations
- 角色：not applicable；协调必要性证据：history/input ablations

## 传感与部署可实现性

- 触觉：two 320×240 RGB DIGIT image sequences（TACTO-simulated DIGIT；two gripper fingers）
- 训练输入：object point cloud, tactile sequences, EE poses, simulator contact query labels
- 部署输入：known object shape/pose and tactile/EE sequence
- 特权信息：训练=yes, simulator extrinsic-contact ground truth；推理=requires rigid known-class object and hand-object pose；未来参考=no；仿真接触=ground-truth supervision
- 部署判断：privileged/limited for real deployment

## 表征与实验

- 表征：continuous neural contact field；单元：3D object-surface query points
- 结构先验：object-shape neural descriptors and rigid-grasp kinematics；来源：object point cloud + tactile motion；动态性：dynamic field probabilities
- 目标：预训练=self-supervised tactile sequence reconstruction；下游=contact probability classification；物理目标=simulator contact probability
- 规模与拆分：4,500 contact events; three categories; six cabinet scenarios (four train/two test)；unseen shapes and scenarios within mug/bottle/bowl categories
- 基线/统计：history/current/no-tactile input ablations；matched budget=internal architecture variants；seeds=trajectory MSE; seeds/CI NR
- 泛化：对象=unseen shapes within three known classes；传感器=no；形态=no；拓扑=contact patch transitions, not system topology transfer

## 三级证据链

1. 作者主张：tactile sequences and object descriptors can track complex external contact on unseen shapes without assuming contact type
2. 可观察证据：simulator field MSE/qualitative multi-patch transitions and input-history ablations on held-out scenarios/shapes
3. 精标判断：支持程度=partial。Strong future-edge/contact-field auxiliary-task precedent but not evidence of deployable real contact inference.

证据位置：pp.3--5 Sec. III; pp.5--7 Sec. IV, Figs. 4--6; p.7 limitations

## 对 BiCG-Rep 的决策

- 影响：supports object-centric dynamic contact prediction head
- 决策：use as an auxiliary-head baseline in simulation; do not cite as real tactile proof
- 理由：Its limitations align with BiCG's goal of observation-grounded edges and uncertainty at transitions.
- 主要局限：simulation only, rigid known-class grasp and known relative pose; contact GT privileged; transition lag
- 未决问题：current downloadable artifact integrity; real fine-tuning results
