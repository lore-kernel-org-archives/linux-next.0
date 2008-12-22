From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 22 Dec 2008 07:35:02 +0100
Message-ID: <20081222063501.GA29160@elte.hu>
References: <20081222120543.92004d90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53324 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751244AbYLVGfV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 01:35:21 -0500
Content-Disposition: inline
In-Reply-To: <20081222120543.92004d90.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

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

yes, that's the same resolution i did for this conflict three days ago in 
tip/master. Thanks,

	Ingo
