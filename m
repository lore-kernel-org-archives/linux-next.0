From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 7 (kernel/trace/trace_hwlat.c)
Date: Wed, 7 Sep 2016 09:37:00 -0700
Message-ID: <d6c3b7eb-ba95-1ffa-0453-464e1e24262a@infradead.org>
References: <20160907175258.1f17a8ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160907175258.1f17a8ba@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On 09/07/16 00:52, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160906:
> 

on i386:

../kernel/trace/trace_hwlat.c: In function 'get_sample':
../kernel/trace/trace_hwlat.c:258:18: error: 'struct trace_array' has no member named 'max_latency'
   if (sample > tr->max_latency)
                  ^
../kernel/trace/trace_hwlat.c:259:6: error: 'struct trace_array' has no member named 'max_latency'
    tr->max_latency = sample;
      ^
../kernel/trace/trace_hwlat.c: In function 'hwlat_tracer_init':
../kernel/trace/trace_hwlat.c:583:4: error: 'struct trace_array' has no member named 'max_latency'
  tr->max_latency = 0;
    ^

when CONFIG_TRACER_MAX_TRACE is not enabled.




-- 
~Randy
