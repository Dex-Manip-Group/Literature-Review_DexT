# Semantic Contact Fields for Contact-Rich Tool Manipulation

- 编号：16 | 精标等级：A | 批次：3 | 状态：complete | 置信度：high
- 出版状态：RSS 2026 accepted | 年份：2026
- 来源：https://arxiv.org/abs/2602.13833
- 本地全文：`referenced/00_core_bicg/2026_Semantic-Contact-Fields.pdf`

## 任务、拓扑与协调

- 任务：contact-rich tool manipulation with force-aware semantic contact fields
- 拓扑：hand/gripper--tool--workpiece/environment；载荷路径：single arm/tool；拓扑变化：contact field changes continuously
- 角色：not bimanual；协调必要性证据：force/no-force and sim-only/real-only field ablations

## 传感与部署可实现性

- 触觉：tactile/force observations aligned to tool contact（tool/hand tactile plus force sensing；tool contact interface）
- 训练输入：sim and real contact samples, geometry, force and tactile observations
- 部署输入：estimated semantic contact field, geometry and sensed force/touch
- 特权信息：训练=sim contact labels used and aligned with real data；推理=no；未来参考=task goal/trajectory；仿真接触=training supervision in sim
- 部署判断：deployable_with_calibration

## 表征与实验

- 表征：continuous semantic contact field；单元：3D query points with contact probability/force semantics
- 结构先验：object/tool geometry and continuous field；来源：sim labels + real alignment；动态性：continuous field, not discrete graph
- 目标：预训练=contact probability and force field prediction/alignment；下游=scraping, drawing and peeling policies；物理目标=continuous force/contact predictions
- 规模与拆分：three real tool tasks; sim/real contact field data；seen/unseen tools/crayons and task trials
- 基线/统计：sim-only, real-only, no-force and other policy baselines；matched budget=good component ablations; field/data budgets differ；seeds=success/efficiency/contact metrics; trial/seed details task-specific
- 泛化：对象=unseen tools/material instances；传感器=no；形态=no；拓扑=no bimanual transfer

## 三级证据链

1. 作者主张：semantic contact fields aligned across simulation and reality generalize force-aware tool policies to unseen tools
2. 可观察证据：field metrics plus scraping/drawing/peeling results; sim-only, real-only and no-force ablations; seen/unseen instance tables
3. 精标判断：支持程度=partial-to-strong。Closest continuous alternative for tool-side nodes/edges; BiCG tool phase should compare graph edges against field conditioning.

证据位置：pp.5--8 Sec. III--IV, Tables I--II; pp.9--12 Tables III--V; conclusion

## 对 BiCG-Rep 的决策

- 影响：strong tool-use representation baseline
- 决策：use as contact-field baseline after handover gate; borrow tool/object coordinate frame
- 理由：Tests whether discrete cross-interface graph adds value beyond a continuous object-centric contact representation.
- 主要局限：single tool interface, contact/force supervision and alignment pipeline; no inter-hand topology or role dynamics
- 未决问题：public release; independent seeds; force sensor as input versus target per task
