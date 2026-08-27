# TactAlign: Cross-Embodiment Tactile Representation Alignment

- 编号：26 | 精标等级：B | 批次：4 | 状态：complete | 置信度：high
- 出版状态：RSS 2026 accepted | 年份：2026
- 来源：https://arxiv.org/abs/2602.13579
- 本地全文：`referenced/02_tactile_representation/2026_TactAlign.pdf`

## 任务、拓扑与协调

- 任务：human-to-robot cross-embodiment tactile alignment
- 拓扑：single hand/object contact tasks across human and robot embodiments；载荷路径：no bimanual path；拓扑变化：contact onset and maintenance in pivot/insertion/lid tasks
- 角色：not applicable；协调必要性证据：without tactile and without alignment ablations

## 传感与部署可实现性

- 触觉：heterogeneous per-fingertip magnetic/array tactile signals plus fingertip poses（human tactile glove; robot XELA；multiple fingertips）
- 训练输入：human/robot play, tactile trajectories, object poses and actions
- 部署输入：aligned tactile features, fingertip poses and wrist/robot state
- 特权信息：训练=object pose/model for pseudo-pair matching; separate F/T labels only for evaluation；推理=no object pose required by tactile mapping/policy as described；未来参考=no；仿真接触=no
- 部署判断：deployable_with_cross-embodiment setup

## 表征与实验

- 表征：cross-embodiment aligned tactile latent；单元：per-fingertip variable-sized tactile feature pooled to fixed latent
- 结构先验：pseudo-pairs from hand-object state transitions and binary contact filtering；来源：offline kinematics/object pose + raw touch；动态性：no explicit graph
- 目标：预训练=self-supervised tactile reconstruction; rectified-flow alignment；下游=H2R co-training/action prediction；物理目标=force used only as independent probe, not training target
- 规模与拆分：~10 min play; 200 human alignment demos; 50 robot demos; task-specific human data; 1,472 robot/1,527 human force samples；seen-by-both, human-only, unseen-by-both objects; unseen lid-closing task
- 基线/统计：robot-only, without tactile, without alignment；matched budget=good co-training ablations; human-data advantage is part of method；seeds=10 rollouts/object; force error mean±std over five evaluations
- 泛化：对象=yes；传感器=cross-sensor human→robot；形态=yes；拓扑=unseen task class but similar single-hand contact topology

## 三级证据链

1. 作者主张：rectified-flow alignment transfers tactile semantics from human gloves to robot sensors and improves object/task generalization
2. 可观察证据：large ablation drops without alignment/touch, 10 rollouts/object, 100% human-only lightbulb result, independent F/T force probe with ~96.75% error reduction
3. 精标判断：支持程度=partial-to-strong。Important model for embodiment transfer and an unusually strong independent force probe; pseudo-pair construction could distill privileged topology into deployable edges.

证据位置：pp.4--7 Sec. III; pp.8--13 Sec. IV, Tables I--III and Fig. 10; p.14 limitations; Appendix dataset

## 对 BiCG-Rep 的决策

- 影响：cross-embodiment alignment and validation precedent
- 决策：borrow pseudo-pair/distillation strategy if real graph labels are unavailable; not an M1 dependency
- 理由：Supports privileged-to-observation edge distillation as the primary pivot path.
- 主要局限：only two modalities/one robot hand; pose/model privilege for alignment; visual information not jointly aligned; small rollout counts
- 未决问题：public code/data/model; alignment robustness to pose error and different numbers of fingertips
