From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the sched tree
Date: Sun, 21 Dec 2008 17:46:34 -0800
Message-ID: <20081222014634.GC7163@linux.vnet.ibm.com>
References: <20081222120543.92004d90.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:56814 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751578AbYLVBqb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 20:46:31 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBM1jWvi008242
	for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 20:45:32 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mBM1kUSn187138
	for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 20:46:30 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mBM2kdHE030174
	for <linux-next@vger.kernel.org>; Sun, 21 Dec 2008 21:46:40 -0500
Content-Disposition: inline
In-Reply-To: <20081222120543.92004d90.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

On Mon, Dec 22, 2008 at 12:05:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sched tree got a conflict in
> include/linux/hardirq.h between commit
> 17666f02b118099028522dfc3df00a235700e216 ("ftrace: nmi safe code
> modification") from the ftrace tree and commit
> 64db4cfff99c04cd5f550357edcc8780f96b54a2 (""Tree RCU": scalable classic
> RCU implementation") from the sched tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks like the right approach to me!

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc include/linux/hardirq.h
> index 89a56d7,9b70b92..0000000
> --- a/include/linux/hardirq.h
> +++ b/include/linux/hardirq.h
> @@@ -162,17 -163,7 +164,19 @@@ extern void irq_enter(void)
>    */
>   extern void irq_exit(void);
>   
>  -#define nmi_enter()		do { lockdep_off(); rcu_nmi_enter(); __irq_enter(); } while (0)
>  -#define nmi_exit()		do { __irq_exit(); rcu_nmi_exit(); lockdep_on(); } while (0)
>  +#define nmi_enter()				\
>  +	do {					\
>  +		ftrace_nmi_enter();		\
>  +		lockdep_off();			\
> ++		rcu_nmi_enter();		\
>  +		__irq_enter();			\
>  +	} while (0)
>  +#define nmi_exit()				\
>  +	do {					\
>  +		__irq_exit();			\
> ++		rcu_nmi_exit();			\
>  +		lockdep_on();			\
>  +		ftrace_nmi_exit();		\
>  +	} while (0)
>   
>   #endif /* LINUX_HARDIRQ_H */
