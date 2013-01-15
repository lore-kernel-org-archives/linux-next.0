From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Jan 7 (rcutorture)
Date: Mon, 14 Jan 2013 22:08:41 -0500
Message-ID: <1358219321.4068.9.camel@gandalf.local.home>
References: <20130107142649.c843e0b711532dc3a631e4cf@canb.auug.org.au>
	 <50EB252C.4010005@infradead.org> <20130107221627.GZ2525@linux.vnet.ibm.com>
	 <20130108095959.98d83d91dbd0e9e1ac023373@canb.auug.org.au>
	 <1357600327.5190.13.camel@gandalf.local.home>
	 <1357605379.5190.15.camel@gandalf.local.home>
	 <20130108035348.GF2525@linux.vnet.ibm.com> <50F43612.8080600@infradead.org>
	 <20130114173208.GY3384@linux.vnet.ibm.com> <50F45321.50808@infradead.org>
	 <20130114194956.GB3384@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:12780 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752567Ab3AODIo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jan 2013 22:08:44 -0500
In-Reply-To: <20130114194956.GB3384@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-01-14 at 11:49 -0800, Paul E. McKenney wrote:

> diff --git a/kernel/rcu.h b/kernel/rcu.h
> index 7f8e759..b5d30c3 100644
> --- a/kernel/rcu.h
> +++ b/kernel/rcu.h
> @@ -24,6 +24,7 @@
>  #define __LINUX_RCU_H
>  
>  #ifdef CONFIG_RCU_TRACE
> +#include <linux/trace_clock.h>
>  #define RCU_TRACE(stmt) stmt
>  #else /* #ifdef CONFIG_RCU_TRACE */
>  #define RCU_TRACE(stmt)
> @@ -118,4 +119,13 @@ int rcu_jiffies_till_stall_check(void);
>  
>  #endif /* #ifdef CONFIG_RCU_STALL_COMMON */
>  
> +static inline u64 notrace rcu_trace_clock_local(void)

"inline" now implies notrace. That is, we define inline to include
notrace in the headers. The 'notrace' now is redundant.

-- Steve

> +{
> +#ifdef CONFIG_RCU_TRACE
> +	return trace_clock_local();
> +#else /* #ifdef CONFIG_RCU_TRACE */
> +	return 0;
> +#endif /* #else #ifdef CONFIG_RCU_TRACE */
> +}
> +
>  #endif /* __LINUX_RCU_H */
