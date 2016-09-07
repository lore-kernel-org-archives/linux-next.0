From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Wed, 7 Sep 2016 13:55:47 -0700
Message-ID: <4b599d6d-ae48-8833-cb17-a7aa1fe1c41f@infradead.org>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
 <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
 <20160907124422.70216727@gandalf.local.home>
 <2c4a12e1-7970-f272-8883-db7c6ae36825@infradead.org>
 <20160907144838.22484ad3@gandalf.local.home>
 <20160907153810.54f2a9ef@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55348 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757118AbcIGUzu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2016 16:55:50 -0400
In-Reply-To: <20160907153810.54f2a9ef@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/07/16 12:38, Steven Rostedt wrote:
> On Wed, 7 Sep 2016 14:48:38 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> Will send another one soon.
> 
> What about this?
> 
> -- Steve
> 
> commit 64cfdb9788bf3fb2bf6c30701fc3644f25e76df2
> Author: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
> Date:   Wed Sep 7 12:45:09 2016 -0400
> 
>     tracing: Have max_latency be defined for HWLAT_TRACER as well
>     
>     The hwlat tracer uses tr->max_latency, and if it's the only tracer enabled
>     that uses it, the build will fail. Add max_latency and its file when the
>     hwlat tracer is enabled.
>     
>     Link: http://lkml.kernel.org/r/20160907175258.1f17a8ba@canb.auug.org.au
>     
>     Reported-by: Randy Dunlap <rdunlap@infradead.org>
>     Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 474cc814e16d..e0d0cfc1aa20 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4945,7 +4945,7 @@ out:
>  	return ret;
>  }
>  
> -#ifdef CONFIG_TRACER_MAX_TRACE
> +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
>  
>  static ssize_t
>  tracing_max_lat_read(struct file *filp, char __user *ubuf,
> @@ -5867,7 +5867,7 @@ static const struct file_operations tracing_thresh_fops = {
>  	.llseek		= generic_file_llseek,
>  };
>  
> -#ifdef CONFIG_TRACER_MAX_TRACE
> +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
>  static const struct file_operations tracing_max_lat_fops = {
>  	.open		= tracing_open_generic,
>  	.read		= tracing_max_lat_read,
> @@ -7195,7 +7195,7 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
>  
>  	create_trace_options_dir(tr);
>  
> -#ifdef CONFIG_TRACER_MAX_TRACE
> +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
>  	trace_create_file("tracing_max_latency", 0644, d_tracer,
>  			&tr->max_latency, &tracing_max_lat_fops);
>  #endif
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index 1d866b0c1567..fd24b1f9ac43 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -214,6 +214,8 @@ struct trace_array {
>  	 */
>  	struct trace_buffer	max_buffer;
>  	bool			allocated_snapshot;
> +#endif
> +#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
>  	unsigned long		max_latency;
>  #endif
>  	struct trace_pid_list	__rcu *filtered_pids;
> --

Yes, that works. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>




-- 
~Randy
