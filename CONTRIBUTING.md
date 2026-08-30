# 协作与更新指南

本仓库采用“可审计清单 + 可再生本地全文 + 冻结正文 + 周度增量”的协作方式。
CSV/TSV、Markdown、TeX 和脚本进入 Git；论文 PDF 只保留在各成员本机。

## 建议工作流

1. 从最新 main 分支创建短期分支，例如 literature/2026-08-27。
2. 在 referenced/papers_manifest.tsv 增加或修正记录。每篇论文必须有唯一 slug、
   明确 publication status、权威 source_url 和标签。
3. 在 weekly_updates/ 增加带日期的筛查记录；明确区分“纳入活文献库”“观察名单”
   和“排除”。
4. 运行元数据更新与验证：

       pwsh ./scripts/update_review.ps1 -SkipDownload

5. 如需在本机补齐并核验全文：

       python ./referenced/download_papers.py
       pwsh ./scripts/validate_repo.ps1 -RequireLocalPdfs

6. 提交 Pull Request，由至少一名组员复核纳入理由、状态、来源和研究影响。

## 精标子集

30 篇 precision subset 是人工全文精标，不随普通周更自动扩张。只有在组内明确决定将新论文
提升为核心论文时，才修改 precision_annotations/annotation_queue.csv、精标 CSV、证据卡
和 XLSX，并在 review_protocol.md 中记录新的精标日期。

precision_annotations/precision_annotations.csv 是机器可读的主要数据源；
precision_annotations.xlsx 是便于筛选和讨论的生成视图。工作簿生成器使用 Codex
workspace 自带的 artifact-tool；没有该环境的成员可只修改 CSV 和证据卡，由维护者重建 XLSX。

## 正文冻结

活文献库更新不自动改变 main.tex 中的统计和结论。只有完成新增论文的正文整合、引用、
必要精标和全文复核后，才能更新 manuscript evidence freeze。禁止把 surveillance date
直接替换成 corpus-freeze date。每次正式重冻结还必须在
`sections/11_update_log.tex` 追加日期、语料变化、证据层级和解释影响。

## PDF 与版权

不要把 referenced 下的论文 PDF 加入 Git。仓库只共享公开来源 URL、下载器和 SHA-256
校验信息。任何受限全文只保留权威落地页，不绕过访问控制。

## 提交建议

- literature: add HiTac-WAM and VT-MUSE
- evidence: refine deployment-observability coding
- docs: add weekly surveillance note
- build: improve repository validation

一个提交尽量只处理一种逻辑变化，避免把文献判断、格式化和无关清理混在一起。
