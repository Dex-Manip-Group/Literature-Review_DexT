# Heterogeneous Tactile Transformer

- 编号：25 | 精标等级：B | 批次：4 | 状态：complete | 置信度：high
- 出版状态：preprint/under review | 年份：2026
- 来源：https://arxiv.org/abs/2606.29948
- 本地全文：`referenced/02_tactile_representation/2026_HTT.pdf`

## 任务、拓扑与协调

- 任务：heterogeneous tactile Transformer pretraining
- 拓扑：single tactile interface; downstream contact-rich manipulation；载荷路径：no bimanual path；拓扑变化：contact content dynamic, token structure fixed
- 角色：not applicable；协调必要性证据：qpos/wrench/tactile embedding comparisons

## 传感与部署可实现性

- 触觉：optical images and array-based tactile force fields（heterogeneous optical + array sensors；paired co-located contact interfaces; downstream fingertips）
- 训练输入：time/contact-synchronized heterogeneous tactile observations
- 部署输入：sensor-specific encoder embedding + proprioception
- 特权信息：训练=no；推理=no；未来参考=no；仿真接触=no
- 部署判断：deployable_with_sensor_encoder

## 表征与实验

- 表征：shared heterogeneous tactile latent；单元：sensor-specific patches/taxels pooled into shared token
- 结构先验：paired temporal/contact synchronization across sensor families；来源：paired HPT dataset；动态性：no explicit graph
- 目标：预训练=masked reconstruction and cross-sensor alignment；下游=object/force/slip probes and manipulation policy；物理目标=force/slip in downstream probes
- 规模与拆分：HPT paired dataset over four sensors; real manipulation tasks including toy screw/tofu and sim benchmark；seen and unseen tactile sensors/tasks
- 基线/统计：MAE same architecture, raw wrench, qpos-only and other tactile representations；matched budget=strong same-architecture MAE ablation; policy baselines share rollout protocol；seeds=Table 3: 3 seeds × 50 rollouts; toy tasks 20 rollouts
- 泛化：对象=task-dependent；传感器=yes, zero-shot 9DTact/new sensors；形态=limited；拓扑=no

## 三级证据链

1. 作者主张：paired heterogeneous pretraining yields sensor-agnostic tactile features and improves unseen-sensor manipulation
2. 可观察证据：four-sensor probes, same-architecture MAE comparison, real unseen-sensor tasks, three-seed/50-rollout policy table
3. 精标判断：支持程度=strong for included sensor families。Best heterogeneous local-token baseline; its own limitation directly motivates geometry/site-aware nodes.

证据位置：pp.3--6 method; pp.7--10 Sec. 5, Tables 1--3; pp.10--11 limitations; appendix Tables 4--5

## 对 BiCG-Rep 的决策

- 影响：strong local encoder/sensor-OOD competitor
- 决策：use HTT/FTP-style morphology masks at node level; freeze encoder in BiCG comparisons
- 理由：Ensures graph gains are not caused by poorer cross-sensor tokenization.
- 主要局限：only optical/array families; pairs are not geometrically registered; no bimanual/system relational structure
- 未决问题：public links/license; exact paired dataset scale and sensor geometry metadata
