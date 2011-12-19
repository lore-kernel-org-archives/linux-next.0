From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the cputime tree
Date: Mon, 19 Dec 2011 17:30:09 +0100
Message-ID: <20111219163009.GC10017@elte.hu>
References: <20111219154010.c2044c038a6174dd8fb6f477@canb.auug.org.au>
 <20111219080813.GB30432@elte.hu>
 <20111219101134.3c2c0db5@de.ibm.com>
 <20111219103513.GA17928@elte.hu>
 <20111219112547.GA32375@elte.hu>
 <20111219152409.3a2c213e@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111219152409.3a2c213e@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Glauber Costa <glommer@parallels.com>
List-Id: linux-next.vger.kernel.org


* Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:

> > That way your commits are preserved and the conflicts are 
> > resolved.
> 
> Just did that and pushed out the result on
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git cputime-tip

Hm, this fails spectacularly on 32-bit x86:

/home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c: In function 'get_cpu_idle_time_jiffy':
/home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c:137: error: expected ';' before ')' token
/home/mingo/tip/drivers/cpufreq/cpufreq_ondemand.c:137: error: expected statement before ')' token

Thanks,

	Ingo
