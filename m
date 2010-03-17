From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 17 Mar 2010 08:02:39 +0100
Message-ID: <20100317070239.GA16374@elte.hu>
References: <20100317145702.e314f75b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100317145702.e314f75b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/sched.c: In function 'SYSC_sched_getaffinity':
> kernel/sched.c:4915: warning: comparison of distinct pointer types lacks a cast

I already reported this yesterday, see:

  http://patchwork.kernel.org/patch/86244/

Thanks,

	Ingo
