From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Wed, 7 Sep 2016 11:34:24 -0700
Message-ID: <2c4a12e1-7970-f272-8883-db7c6ae36825@infradead.org>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
 <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
 <20160907124422.70216727@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160907124422.70216727@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 09/07/16 09:44, Steven Rostedt wrote:

> Thanks!
> 
> Below is the fix. I'll have to add it.
> 
> -- Steve
> 
> 
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 72c07c2ffd79..d9000a81960e 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -224,6 +224,7 @@ config SCHED_TRACER
>  config HWLAT_TRACER
>  	bool "Tracer to detect hardware latencies (like SMIs)"
>  	select GENERIC_TRACER
> +	select TRACER_MAX_TRACE
>  	help
>  	 This tracer, when enabled will create one or more kernel threads,
>  	 depening on what the cpumask file is set to, which each thread
> 

Hm, now I get:

../kernel/trace/trace.c: In function 'tracing_set_tracer':
../kernel/trace/trace.c:4850:3: error: implicit declaration of function 'free_snapshot' [-Werror=implicit-function-declaration]
   free_snapshot(tr);
   ^
../kernel/trace/trace.c:4856:3: error: implicit declaration of function 'alloc_snapshot' [-Werror=implicit-function-declaration]
   ret = alloc_snapshot(tr);
   ^


-- 
~Randy
