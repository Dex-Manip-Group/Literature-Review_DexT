# RoboPack: Learning Tactile-Informed Dynamics Models for Dense Packing

- 编号：14 | 精标等级：A | 批次：3 | 状态：complete | 置信度：high
- 出版状态：RSS 2024 | 年份：2024
- 来源：https://www.roboticsproceedings.org/rss20/p130.html
- 本地全文：`referenced/00_core_bicg/2024_RoboPack.pdf`

## 任务、拓扑与协调

- 任务：tactile-informed multi-object dynamics and MPC
- 拓扑：gripper/tool--object(s)--environment；载荷路径：single manipulator; no inter-hand path；拓扑变化：particle proximity graph and contacts evolve
- 角色：not applicable；协调必要性证据：tactile/no-tactile and direct-observation baselines

## 传感与部署可实现性

- 触觉：local surface force vectors, global shear/torque and force magnitude（Soft-Bubble tactile sensors；two gripper bubbles）
- 训练输入：visual object particles, tactile histories, actions, tracked next states
- 部署输入：initial/sparse vision, tactile feedback, action history
- 特权信息：训练=visual tracking provides state targets; no hidden simulator graph；推理=no；未来参考=goal state only；仿真接触=no
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：recurrent particle GNN state estimator + dynamics model；单元：object/tactile particles and latent per-object physics
- 结构先验：radius/proximity particle edges and object membership；来源：tracked geometry and calibrated tactile particles；动态性：yes via proximity graph
- 目标：预训练=tactile autoencoder and supervised multi-step state prediction；下游=sampling MPC to goal；物理目标=object particle motion and latent physical properties; no explicit contact edge/load share
- 规模与拆分：~12,000 packing interactions plus box-pushing trajectories；training/test objects and unseen box/object configurations
- 基线/统计：no-tactile RoboPack, RoboCook+tactile, physics simulator, RL/other dynamics baselines；matched budget=strong internal comparisons using same datasets/planner；seeds=95% CIs for prediction; physical trials 5 or 15 depending task
- 泛化：对象=yes；传感器=no；形态=no；拓扑=unseen configurations, not inter-hand topology

## 三级证据链

1. 作者主张：tactile history improves state/physics estimation and long-horizon planning under occlusion
2. 可观察证据：prediction with 95% CIs, latent mass analysis, 16/20 box pushing and improved seen/unseen dense packing versus no-touch/direct-observation baselines
3. 精标判断：支持程度=strong for single-arm particle dynamics。Best relational-dynamics precedent; supports separating state estimation from future dynamics and avoiding direct prediction of high-dimensional tactile frames.

证据位置：pp.4--8 Sec. III; pp.9--12 Sec. IV--V, Tables I--III; appendix hyperparameters

## 对 BiCG-Rep 的决策

- 影响：strong methodological precursor for dynamic graph + physics latent
- 决策：adapt its state-estimator/dynamics separation as a baseline, not its full MPC stack
- 理由：Directly tests whether inferred relational state is superior to concatenating/predicting raw touch.
- 主要局限：custom hardware, object tracking supervision and single-interface graph; no bimanual roles or explicit load-flow edge objective
- 未决问题：exact downloadable dataset scope and model checkpoints
