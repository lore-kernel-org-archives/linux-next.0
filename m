From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree build warnings
Date: Thu, 3 Sep 2009 10:38:44 +0200
Message-ID: <20090903083844.GA9912@elte.hu>
References: <20090903182510.8fd4d4d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39560 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753586AbZICIi7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2009 04:38:59 -0400
Content-Disposition: inline
In-Reply-To: <20090903182510.8fd4d4d1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced these warning:
> 
> In file included from include/trace/ftrace.h:285,
>                  from include/trace/define_trace.h:61,
>                  from include/trace/events/timer.h:342,
>                  from kernel/timer.c:50:
> include/trace/events/timer.h: In function 'ftrace_raw_output_itimer_state':
> include/trace/events/timer.h:280: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'cputime_t'
> include/trace/events/timer.h: In function 'ftrace_raw_output_itimer_expire':
> include/trace/events/timer.h:317: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'cputime_t'

Should be harmless with no runtime effects - the fix would be to 
harmonize the cputime_t types across architectures.

> Introduced by commit 3f0a525ebf4b8ef041a332bbe4a73aee94bb064b ("timers: Add tracepoints for itimer") from the tip tree.
> 
> cputime_t is variously "u64", "unsigned long long" and "unsigned 
> long" on different architectures.

Should be unsigned long i think. Most architectures use it as 
unsigned long via include/asm-generic/cputime.h, except these three:

 arch/ia64/include/asm/cputime.h:typedef u64 cputime_t;
 arch/powerpc/include/asm/cputime.h:typedef u64 cputime_t;
 arch/s390/include/asm/cputime.h:typedef unsigned long long cputime_t;

Or we could eliminate the type altogether as well and standardize on 
u64. Thomas?

	Ingo
