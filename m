From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Wed, 17 Mar 2010 13:00:00 +0900 (JST)
Message-ID: <20100317125844.4CA9.A69D9226@jp.fujitsu.com>
References: <20100317145702.e314f75b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:46512 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858Ab0CQEAF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2010 00:00:05 -0400
In-Reply-To: <20100317145702.e314f75b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kosaki.motohiro@jp.fujitsu.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> kernel/sched.c: In function 'SYSC_sched_getaffinity':
> kernel/sched.c:4915: warning: comparison of distinct pointer types lacks a cast
> 
> Introduced by commit cd3d8031eb4311e516329aee03c79a08333141f1 ("sched:
> sched_getaffinity(): Allow less than NR_CPUS length").  Just a usage of
> min() with different types.

yup. I've posted the fixing patch today.

thanks!
