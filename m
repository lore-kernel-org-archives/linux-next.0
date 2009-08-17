From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] trace_skb: fix build when CONFIG_NET is not
	enabled
Date: Mon, 17 Aug 2009 23:58:08 +0200
Message-ID: <20090817215808.GB15016@elte.hu>
References: <4A89BF90.5070202@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758175AbZHQV60@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A89BF90.5070202@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Neil Horman <nhorman@tuxdriver.com>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix trace_skb_sources build when CONFIG_NET is not enabled:
> 
> kernel/built-in.o: In function `probe_skb_dequeue':
> trace_skb_sources.c:(.text+0xd9152): undefined reference to `init_net'
> trace_skb_sources.c:(.text+0xd9188): undefined reference to `dev_get_by_index'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Neil Horman <nhorman@tuxdriver.com>
> ---
>  kernel/trace/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20090817.orig/kernel/trace/Kconfig
> +++ linux-next-20090817/kernel/trace/Kconfig
> @@ -236,6 +236,7 @@ config BOOT_TRACER
>  
>  config SKB_SOURCES_TRACER
>  	bool "Trace skb source information"
> +	depends on NET
>  	select GENERIC_TRACER
>  	help
>  	   This tracer helps developers/sysadmins correlate skb allocation and

Hm, there's nothing like this in the tracing tree.

Could we please move kernel/trace/* commits to the tracing tree, so 
that it gets adequate testing and review, etc?

	Ingo
