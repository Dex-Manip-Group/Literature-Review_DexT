# Contact-Anchored Policies for Contact-Rich Manipulation

- 编号：17 | 精标等级：A | 批次：3 | 状态：complete | 置信度：high
- 出版状态：RSS 2026 accepted | 年份：2026
- 来源：https://arxiv.org/abs/2602.09017
- 本地全文：`referenced/04_tool_workpiece_control/2026_Contact-Anchored-Policies.pdf`

## 任务、拓扑与协调

- 任务：contact-anchored policy learning across robots
- 拓扑：robot--environment/object contact anchor；载荷路径：not bimanual；拓扑变化：contact-conditioned phases
- 角色：not applicable；协调必要性证据：contact-anchor ablations

## 传感与部署可实现性

- 触觉：contact events/geometry rather than rich tactile arrays（robot/environment contact estimation；task-defined robot contacts）
- 训练输入：demonstrations/ego-simulation with contact annotations
- 部署输入：observed robot state/vision and predicted/known contact anchor
- 特权信息：训练=contact annotations/simulator contact in training；推理=depends on anchor estimator; paper simplifies robot-environment contacts；未来参考=no；仿真接触=training environment
- 部署判断：mixed; anchor observability is task-specific

## 表征与实验

- 表征：contact-anchored policy frame；单元：contact anchor plus robot/action tokens
- 结构先验：policy expressed relative to contact；来源：contact detection/annotation；动态性：phase/anchor changes, no general graph
- 目标：预训练=simulation/ego policy learning；下游=pick/open/close and long-horizon task success；物理目标=contact location/phase, not force flow
- 规模与拆分：three tasks, four robots; collaborator/external methodology evaluation；task/robot/stage
- 基线/统计：standard policy frames and CAP ablations；matched budget=mostly within same pipelines；seeds=stage success and real task outcomes; independent seeds NR
- 泛化：对象=limited；传感器=no；形态=cross-robot methodology, not a single zero-shot model；拓扑=no

## 三级证据链

1. 作者主张：expressing policies relative to contact anchors improves contact-rich transfer and long-horizon execution
2. 可观察证据：three tasks/four robot setups, stage-wise success and anchor ablation; simulation-real performance correlation
3. 精标判断：支持程度=partial。Contact-centric coordinates are a mandatory baseline; BiCG cannot claim novelty for anchoring alone.

证据位置：main text Tables 1--3 and Sec. 5--6; p.17 limitations; appendix Table 4

## 对 BiCG-Rep 的决策

- 影响：narrows contribution to dynamic multi-interface relational inference
- 决策：include contact-anchor coordinate baseline in tool phase
- 理由：Separates benefits of coordinate choice from inferred edge mechanics.
- 主要局限：contact definition simplified to robot-environment interactions; anchor acquisition may be privileged or task-specific; no tactile/load graph
- 未决问题：anchor estimator inputs at deployment; code/data release; exact seeds
