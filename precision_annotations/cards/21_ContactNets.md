# ContactNets: Learning Discontinuous Contact Dynamics with Smooth Implicit Representations

- 编号：21 | 精标等级：B | 批次：3 | 状态：complete | 置信度：high
- 出版状态：CoRL 2020 | 年份：2020
- 来源：https://proceedings.mlr.press/v155/pfrommer21a.html
- 本地全文：`referenced/03_graph_physics_contact/2020_ContactNets.pdf`

## 任务、拓扑与协调

- 任务：physics-structured contact dynamics learning
- 拓扑：rigid object--ground；载荷路径：not bimanual；拓扑变化：discrete contact activation
- 角色：not applicable；协调必要性证据：structured vs end-to-end dynamics comparison

## 传感与部署可实现性

- 触觉：no tactile array; net contact impulse inferred from state transitions and known contact-free dynamics（motion/state measurement；candidate object vertices/geometry）
- 训练输入：state, action, next state; candidate geometry
- 部署输入：state/action for rollout
- 特权信息：训练=accurate object pose and analytical dynamics；推理=same model assumptions；未来参考=no；仿真接触=no direct contact labels
- 部署判断：not directly applicable to tactile policy

## 表征与实验

- 表征：implicit smooth contact geometry with structured physics loss；单元：candidate contact points and impulses
- 结构先验：complementarity, non-penetration, friction cone, maximum dissipation；来源：analytical mechanics and learned signed distance；动态性：contact activation solved per transition
- 目标：预训练=physics-consistency contact impulse loss；下游=long-horizon dynamics prediction；物理目标=derived net impulse, penetration and frictional feasibility
- 规模与拆分：570 unique real cube tosses；separate train/validation/test tosses and varied dataset sizes
- 基线/统计：end-to-end DNN; polytope and deep ContactNets；matched budget=structured/deep variants compared across data sizes; capacities not identical；seeds=aggregate rollout errors; confidence/seeds limited
- 泛化：对象=no (single cube)；传感器=no；形态=no；拓扑=no multi-body test

## 三级证据链

1. 作者主张：contact-structured losses learn data-efficient, physically realistic discontinuous dynamics
2. 可观察证据：superior rotational rollout/penetration metrics to end-to-end models across data sizes on 570 real tosses
3. 精标判断：支持程度=strong for cube-ground scope。Best source for BiCG physics-consistency loss terms, but should be softened for noisy compliant tactile systems.

证据位置：pp.5--8 Sec. 4; pp.8--12 Sec. 5--7, Fig. 5; p.12 limitations; code footnote

## 对 BiCG-Rep 的决策

- 影响：mechanics objective precedent
- 决策：adapt non-penetration/force-balance/complementarity-inspired regularizers as optional losses
- 理由：Provides falsifiable physical constraints without requiring graph labels, while acknowledging model mismatch.
- 主要局限：restrictive exact dynamics/rigid/inelastic priors, pose privilege, single object-ground topology, derived rather than measured impulse
- 未决问题：suitability under compliant soft contacts and noisy estimated wrench
