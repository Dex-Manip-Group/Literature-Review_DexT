# Dexterity from Touch: Self-Supervised Pre-Training of Tactile Representations with Robotic Play

- 编号：23 | 精标等级：B | 批次：4 | 状态：complete | 置信度：high
- 出版状态：CoRL 2023 | 年份：2023
- 来源：https://arxiv.org/abs/2303.12076
- 本地全文：`referenced/02_tactile_representation/2023_T-Dex.pdf`

## 任务、拓扑与协调

- 任务：self-supervised tactile pretraining from robotic play
- 拓扑：single dexterous hand--object；载荷路径：no bimanual path；拓扑变化：contact-rich play, implicit
- 角色：some downstream setups use external fixture/second manipulator, not learned bimanual roles；协调必要性证据：tactile/vision/representation baselines

## 传感与部署可实现性

- 触觉：720-D tri-axial force array (15 × 4×4 ×3)（XELA uSkin；four sensors per finger, three on thumb）
- 训练输入：unlabeled/paired tactile play and robot state/actions
- 部署输入：tactile, vision and proprioception depending baseline
- 特权信息：训练=no；推理=no；未来参考=nearest-neighbor/action retrieval from demos rather than future trajectory；仿真接触=no
- 部署判断：deployable_with_XELA

## 表征与实验

- 表征：local tactile SSL embedding；单元：full-hand tactile array embedding
- 结构先验：sensor layout flattened/local encoder; no explicit graph；来源：fixed XELA ordering；动态性：no
- 目标：预训练=BYOL-style self-supervised tactile representation on play data；下游=demonstration-efficient manipulation policy/retrieval；物理目标=none
- 规模与拆分：~2.5 h tactile-rich play; task demos and multiple real tasks；task/object trials; details task-specific
- 基线/统计：BC, visual-only, tactile-only, vision+tactile, representation/backbone variants；matched budget=same demonstrations; modality/capacity differences partly controlled；seeds=real success trials; training seeds NR
- 泛化：对象=limited；传感器=no；形态=no；拓扑=no

## 三级证据链

1. 作者主张：cheap tactile-rich robotic play supports SSL features that reduce downstream demonstrations for dexterous manipulation
2. 可观察证据：real task success where BC fails and tactile/visual representations are compared; backbone/representation ablations
3. 精标判断：支持程度=partial-to-strong。Practical small-scale encoder baseline when Sparsh is modality-mismatched; full-hand array signal is closer to non-optical touch.

证据位置：pp.4--7 hardware/method; pp.8--11 Tables I--II; appendix hyperparameters/setup

## 对 BiCG-Rep 的决策

- 影响：candidate local encoder/pretraining recipe
- 决策：use only if raw arrays resemble target hardware; otherwise cite as robotic-play precedent
- 理由：Its data scale is feasible for a master's replication, unlike 3,000-hour foundation policies.
- 主要局限：single embodiment/sensor, modest data, no calibrated force or cross-sensor/topology transfer
- 未决问题：current dataset download; exact play trajectory count and object-level split
