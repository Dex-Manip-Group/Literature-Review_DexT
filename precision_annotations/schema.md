# 双手触觉文献精标 schema（v1.0）

本表以“一篇论文一条记录”为主表粒度。所有关键判断必须同时记录作者主张、论文中可观察的证据位置和综述者推断；缺失信息写 `NR`（not reported），不以“否”代替。

## 1. 身份与状态

- `priority / slug / level / batch`：精标队列标识。
- `title / year / publication_status / source_url / pdf_path`：已核验的书目信息和全文位置。
- `coding_confidence`：`high`（全文证据清楚）、`medium`（存在术语或实现歧义）、`low`（仅摘要/二手信息）。

## 2. 任务与协调

- `task_family`：handover、shared-object、tool--workpiece、in-hand、representation pretraining、benchmark/taxonomy 等。
- `task_topology`：以接触参与者写成链，如 `hand--object--hand`、`hand--tool--workpiece--hand`。
- `sim_real`：`sim`、`real`、`sim+real`、`dataset-only`。
- `simultaneous_load_path`：是否有双方同时接触并存在物理载荷传递。
- `topology_changes`：接触边是否随任务阶段出现/消失。
- `coordination_necessity_evidence`：是否做过单手、去稳定手、扰动或阶段性消融；未做则为 `NR`。

## 3. 传感与部署可实现性

- `tactile_central / tactile_signal / sensor_family / sensor_sites`：触觉是否为核心输入、信号类型、硬件和布置。
- `train_inputs / deploy_inputs`：训练与部署输入分别记录。
- `privileged_training / privileged_inference`：仿真真值、完整对象状态、接触图、未来参考等是否在训练或推理使用。
- `future_reference / simulator_contacts / independent_force_gt`：单独标记三种最易混淆的信息源。
- `deployment_observability`：`deployable`、`deployable_with_calibration`、`privileged`、`not_applicable`。

## 4. 表征、结构与目标

- `representation_family / representation_unit`：局部触觉编码、跨模态 latent、空间锚、接触场、图、动力学模型或策略状态。
- `structural_prior / structure_source / dynamic_structure / coordinate_frame`：结构如何定义、由观测还是真值获得、是否动态、所在坐标系。
- `temporal_model / multimodal_fusion`：时间建模和融合机制。
- `pretraining_objective / downstream_objective / physical_targets / uncertainty`：自监督、控制、力学目标和不确定性。

## 5. 证据强度

- `dataset_scale / split_unit`：规模与拆分单位；只有 frame split 时必须提示泄漏风险。
- `baselines / matched_budget / seeds_stats`：基线、预算是否匹配、seed/置信区间/显著性。
- `representation_probe / closed_loop / real_robot / sim_to_real`：表征探针和系统证据。
- `object_ood / sensor_ood / embodiment_ood / topology_ood`：四类泛化分开编码。
- `causal_intervention / uncertainty_calibration`：是否做因果式干预或校准。

## 6. Artifact 与研究判断

- `code_status / data_status / model_status`：只记录截至核验日真正可获得的资源；“论文说会公开”不等于已公开。
- `reproduction_readiness`：`high`、`medium`、`low`。
- `author_claim / observed_evidence / evidence_supports_claim`：作者主张、观测证据、支持程度（`strong/partial/weak/not_tested`）。
- `main_limitation / reviewer_inference`：明确区分作者披露与综述者推断。
- `bicg_impact / research_decision / decision_rationale`：对 BiCG-Rep 的威胁或支撑、采用/复现/对照/仅引用决策。
- `evidence_locations`：格式为 `p.X, Sec. Y, Table Z`，多条用分号分隔。
- `unresolved_items`：无法从全文确认的问题。

## 质量控制规则

1. 不把仿真合力、关节力矩估计或重建 wrench 写成独立真值。
2. 不把“图结构存在”直接编码为部署可观测；必须检查边的来源。
3. 不把跨对象/传感器/形态/拓扑泛化混为一个 `generalization` 字段。
4. 不把 frame-level 随机拆分视为严格 OOD。
5. 不以作者的 `first`、`SOTA` 或百分比主张替代 matched-budget 和统计证据。
6. 精标结论使用三级证据链：原文主张 → 可定位结果 → 综述者判断。
