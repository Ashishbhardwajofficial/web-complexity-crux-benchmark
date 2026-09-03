# web-complexity-crux-benchmark
Empirical telemetry datasets (HTTP Archive &amp; CrUX), BigQuery SQL extraction scripts, and headless CDP benchmark testbeds for web complexity and Core Web Vitals research.


# web-complexity-crux-benchmark
Empirical telemetry datasets (HTTP Archive &amp; CrUX), BigQuery SQL extraction scripts, and headless CDP benchmark testbeds for web complexity and Core Web Vitals research.

The Computational Bottleneck: Web Application Complexity vs. High-Throughput Access NetworksThis repository hosts the open-source research artifacts, empirical datasets, BigQuery extraction queries, and automated CDP benchmark harnesses accompanying the paper:"The Computational Bottleneck: Quantifying the Impact of Web Application Complexity on Perceived Latency Despite High-Throughput Access Networks"👥 Authors and AffiliationAshish Kumar Ray – Department of Computer Applications, Thakur College of Engineering and Technology, Mumbai, India (ashish.ray@tcetmumbai.in)Yash Aryan – Department of Computer Applications, Thakur College of Engineering and Technology, Mumbai, India (yash.aryan@tcetmumbai.in)Shruti Zaware – Department of Computer Applications, Thakur College of Engineering and Technology, Mumbai, India (shruti.zaware@tcetmumbai.in)Amitanand Anurag Mishra – Faculty Guide, Department of Computer Applications, Thakur College of Engineering and Technology, Mumbai, India (amitanand.mishra@tcetmumbai.in)📌 Executive SummaryWhile commercial 5G New Radio (NR) and gigabit residential broadband deployments have drastically reduced packet delivery times over access networks, user-perceived web latency remains constrained. This project investigates the structural divergence between network throughput and client execution delays.Using planetary field telemetry mined from the HTTP Archive and the Chrome User Experience Report (CrUX) across millions of origins, alongside controlled Chromium-based micro-benchmarking, this study validates:Network vs. Compute Decoupling: Time to First Byte (TTFB) remains stable across payload tiers (+11.1%), whereas Largest Contentful Paint (LCP) degrades by +54.6% and Interaction to Next Paint (INP) escalates by +36.5%, proving that modern web bottlenecks are CPU-bound rather than transport-bound.Diminishing Returns of Bandwidth: An Ordinary Least Squares (OLS) regression demonstrates a statistically significant negative interaction between script volume and bandwidth throughput ($\beta = -0.12, p = .002$).Architectural Remediation: Component-isolated architectures (React Server Components and Astro Islands) reduce main-thread Total Blocking Time (TBT) by up to 92% on mobile-class CPUs compared to monolithic Single Page Applications.📂 Repository File Structuretelemetry_data.csv: Macro-level field metrics mined from HTTP Archive and CrUX BigQuery datasets across six asset payload buckets (<= 1 MB to >= 5 MB) for mobile and desktop clients.query.sql: Partitioned BigQuery SQL extraction query used to retrieve percentile distributions ($p50$, $p75$, $p90$) from httparchive.all.pages.benchmark_runner.js: Automated headless Chromium profiler utilizing the Chrome DevTools Protocol (CDP) to benchmark web architectures under 4x CPU slowdown and 4G/5G profiles.README.md: Project documentation and reproduction instructions.📊 Empirical Telemetry Dataset (telemetry_data.csv)The empirical field dataset segments mobile and desktop user experiences across six payload weight tiers:Metric (Mobile Inner Pages)<= 1 MB1-2 MB2-3 MB3-4 MB4-5 MB>= 5 MBOverall VarianceLargest Contentful Paint (LCP, s)1.962.402.612.742.823.03+54.6%Interaction to Next Paint (INP, ms)186.0227.0207.0213.0222.0254.0+36.5%Cumulative Layout Shift (CLS)0.010.040.090.110.120.16+1500.0%First Contentful Paint (FCP, ms)1695.01844.02051.02103.02124.02204.0+30.0%Time to First Byte (TTFB, ms)1045.01102.01175.01178.01163.01161.0+11.1%🛠️ Reproduction and Benchmarking Setup1. BigQuery Telemetry ExtractionTo re-run the macro-level telemetric query:Navigate to the Google Cloud BigQuery Console.Open query.sql from this repository.Paste the query into the BigQuery editor and run against the public httparchive.all.pages dataset.2. Micro-Benchmark ExecutionThe benchmark runner measures local rendering performance under throttled hardware and network constraints.Prerequisites:Node.js (version 18.0 or higher)Chromium runtimeInstallation & Execution:bashClone the repositorygit clone https://github.com/ashishray-tcet/web-complexity-crux-benchmark.gitcd web-complexity-crux-benchmarkInstall Puppeteer for CDP automationnpm install puppeteerRun the performance profiler against your target local fixturenode benchmark_runner.js
---

## 🔬 Benchmark Results Summary

Controlled evaluations across an enterprise e-commerce fixture under 4x CPU slowdown (emulating ARM Cortex-A55 mobile hardware) on 4G LTE topologies yield the following comparative metrics:

| Architectural Paradigm | JS Transfer Size | Total Blocking Time (TBT) | Largest Contentful Paint (LCP) | Interaction to Next Paint (INP) |
| :--- | :--- | :--- | :--- | :--- |
| **React 18 SPA** | 640 KB | 620 ms | 3.2 s | 280 ms |
| **Isomorphic SSR** | 660 KB | 690 ms | 2.1 s | 310 ms |
| **React Server Components** | 210 KB | 140 ms | 1.4 s | 95 ms |
| **Astro Islands Architecture** | 45 KB | 18 ms | 1.1 s | 40 ms |

---

## 📖 Citation

If you utilize the datasets, SQL scripts, or benchmarking harnesses in your academic work, please cite the paper as follows:

```bibtex
@inproceedings{ray2026computational,
  author    = {Ashish Kumar Ray and Yash Aryan and Shruti Zaware and Amitanand Anurag Mishra},
  title     = {The Computational Bottleneck: Quantifying the Impact of Web Application Complexity on Perceived Latency Despite High-Throughput Access Networks},
  booktitle = {Proceedings of the IEEE Bombay Section Signature Conference (IBSSC)},
  year      = {2026},
  publisher = {IEEE}
}
📄 License
This research project and its accompanying artifacts are open-sourced under the MIT License.


---

### Is `README.md` Ko Lagane Ka Tarika:

1. Apne GitHub account par repository (`web-complexity-crux-benchmark`) kholein.
2. Agar pehle se `README.md` hai, to us par **Pencil icon (Edit this file)** par click karein. (Agar nahi hai, to **Add file $\rightarrow$ Create new file** karke naam `README.md` rakhein).
3. Upar diya gaya poora text wahan paste karein.
4. Niche green button **"Commit changes"** par click kar dein.

Is `README.md` ke lagte hi aapki repository ek professional open-source academic repository ban jayegi, jise reviewer dekhte hi accept karne ke liye confident ho jayega.
