From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 11:53:24 +0100
Message-ID: <20090116105324.GA13765@elte.hu>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:53275 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753012AbZAPKxk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 05:53:40 -0500
Content-Disposition: inline
In-Reply-To: <20090116163745.93f4e075.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi ,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> In file included from kernel/sched.c:1703:
> kernel/sched_fair.c: In function 'adaptive_gran':
> kernel/sched_fair.c:1324: error: 'struct sched_entity' has no member named 'avg_wakeup'
> 
> Caused by commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565
> ("sched: prefer wakers") from the sched tree.

that commit builds just fine on x86 and on powerpc as well.

Also, at commit e52fb7c097238d34f4d8e2a596f8a3f85b0c0565 there's no 
'sched_entity' use on line 1324 of kernel/sched_fair.c. Could you tell me 
the exact commit ID you got the build failure under?

	Ingo
