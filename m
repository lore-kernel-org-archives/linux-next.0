From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Wed, 7 Sep 2016 12:44:22 -0400
Message-ID: <20160907124422.70216727@gandalf.local.home>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
        <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 7 Sep 2016 09:37:00 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 09/07/16 00:52, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20160906:
> >   
> 
> on i386:
> 
> ../kernel/trace/trace_hwlat.c: In function 'get_sample':
> ../kernel/trace/trace_hwlat.c:258:18: error: 'struct trace_array' has no member named 'max_latency'
>    if (sample > tr->max_latency)
>                   ^
> ../kernel/trace/trace_hwlat.c:259:6: error: 'struct trace_array' has no member named 'max_latency'
>     tr->max_latency = sample;
>       ^
> ../kernel/trace/trace_hwlat.c: In function 'hwlat_tracer_init':
> ../kernel/trace/trace_hwlat.c:583:4: error: 'struct trace_array' has no member named 'max_latency'
>   tr->max_latency = 0;
>     ^
> 
> when CONFIG_TRACER_MAX_TRACE is not enabled.
> 

Thanks!

Below is the fix. I'll have to add it.

-- Steve


diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 72c07c2ffd79..d9000a81960e 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -224,6 +224,7 @@ config SCHED_TRACER
 config HWLAT_TRACER
 	bool "Tracer to detect hardware latencies (like SMIs)"
 	select GENERIC_TRACER
+	select TRACER_MAX_TRACE
 	help
 	 This tracer, when enabled will create one or more kernel threads,
 	 depening on what the cpumask file is set to, which each thread
