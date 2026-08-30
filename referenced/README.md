# Referenced Paper Archive

> 建立日期：2026-08-08  
> 对应研究：BiCG / bimanual tactile load-path representation  
> 论文清单来源：本仓库的综述筛查、精标子集与后续周度增量调查

## 目录结构

| 目录 | 本地 PDF | 内容 |
|---|---:|---|
| [`00_core_bicg/`](00_core_bicg/) | 14 | 与 BiCG 新颖性边界最直接的论文 |
| [`01_bimanual_handover/`](01_bimanual_handover/) | 23 | 双手操作、handover、角色分解与策略学习 |
| [`02_tactile_representation/`](02_tactile_representation/) | 19 | 触觉预训练、跨传感器表征和高频触觉策略 |
| [`03_graph_physics_contact/`](03_graph_physics_contact/) | 16 | tactile graph、contact graph、物理图网络与接触估计 |
| [`04_tool_workpiece_control/`](04_tool_workpiece_control/) | 8 | 工具—工件、持续接触、接触模式与力控制 |
| [`05_datasets_benchmarks/`](05_datasets_benchmarks/) | 6 | 双手/触觉/工具数据集和 benchmark |

## 文件

- [`papers_manifest.tsv`](papers_manifest.tsv)：主清单；包含分类、年份、题目、发表状态、PDF 来源、原始页面和标签。
- [`download_papers.py`](download_papers.py)：可重复下载器；校验 PDF 文件头、大小并计算 SHA-256。
- [`download_results.json`](download_results.json)：下载器运行后生成的逐篇结果。
- [`checksums.sha256`](checksums.sha256)：本地 PDF 的 SHA-256 哈希。
- [`failed_downloads.tsv`](failed_downloads.tsv)：只记录公开 PDF 下载失败项；`link_only` 项不算失败。

## 使用原则

1. 文件名统一为 `年份_短标题.pdf`，避免作者命名差异。
2. 同一论文只保存一份，按主要研究作用归类；其他类别通过 manifest 的 `tags` 检索。
3. `status` 明确区分同行评议、已接收和预印本。
4. 优先保存 arXiv、CVF、PMLR、NeurIPS、ICLR、RSS、PMC 或期刊官网的公开 PDF。
5. 无公开 PDF、需要登录或出版商受限的论文保留 `source_url`，标记为 `link_only`，不绕过访问控制。
6. 厂商产品页、代码仓库和项目主页不伪装成论文 PDF；相关入口保留在 manifest、周更或证据卡中。

## 与综述项目的关系

- [综述仓库入口](../README.md)
- [审查协议](../review_protocol.md)
- [91 条证据矩阵](../evidence_matrix.csv)
- [30 篇全文精标](../precision_annotations/)
- [2026-08-27—2026-08-30 文献周更](../weekly_updates/2026-08-27_to_2026-08-30.md)
- [2026-08-20—2026-08-26 文献周更](../weekly_updates/2026-08-20_to_2026-08-26.md)

## GitHub 使用

PDF 缓存由顶层 .gitignore 排除，不应提交。克隆仓库后可在项目根目录运行：

    python ./referenced/download_papers.py
    pwsh ./scripts/validate_repo.ps1 -RequireLocalPdfs

## 下载状态

截至 2026-08-30（完成部分周增量抓取与完整性复核后）：

- 清单共 **91** 条；已归档并校验 **86** 份 PDF，合计 **1,124,249,061 bytes**（约 1,072.2 MiB）。
- **86/86** 份本地 PDF 均通过文件头与最小大小检查，并写入 SHA-256 清单。
- **0** 个下载失败项；`failed_downloads.tsv` 目前只有表头。
- **5** 个 `link_only` 条目保留权威落地页，不绕过登录、出版商访问控制或站点限流。

| Link-only 条目 | 原因/处理 | 权威入口 |
|---|---|---|
| Human-Inspired Robot Handover Load Transfer Control | 未记录可直接下载的公开 PDF | [IEEE DOI](https://doi.org/10.1109/IROS.2015.7353417) |
| TactiGraph | 全文开放，但当前直链受出版站限流；保留 PMC 全文页 | [PubMed Central](https://pmc.ncbi.nlm.nih.gov/articles/PMC10383597/) |
| TacGraph | 项目页已记录，未发现可公开下载的论文 PDF | [项目页](https://tacgraph.github.io/) |
| NerveNet | OpenReview PDF 在当前环境要求额外访问权限 | [OpenReview](https://openreview.net/forum?id=S1sqHMZCb) |
| Open-X-Tactile | 当前为社区索引/项目入口，不伪装为论文 PDF | [项目页](https://open-x-tactile.github.io/) |

未来若预印本正式发表，优先用正式 proceedings 版本替换，并同步更新 manifest 与 checksum。
