From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: tip tree build warnings
Date: Mon, 7 Sep 2009 10:59:28 +0200
Message-ID: <20090907105928.2646cb11@skybase>
References: <20090903182510.8fd4d4d1.sfr@canb.auug.org.au>
	<20090903083844.GA9912@elte.hu>
	<20090903121326.GA4724@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.de.ibm.com ([195.212.17.162]:49901 "EHLO
	mtagate2.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470AbZIGI7e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 04:59:34 -0400
In-Reply-To: <20090903121326.GA4724@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>

On Thu, 3 Sep 2009 14:13:26 +0200
Heiko Carstens <heiko.carstens@de.ibm.com> wrote:

> On Thu, Sep 03, 2009 at 10:38:44AM +0200, Ingo Molnar wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > cputime_t is variously "u64", "unsigned long long" and "unsigned 
> > > long" on different architectures.
> > 
> > Should be unsigned long i think. Most architectures use it as 
> > unsigned long via include/asm-generic/cputime.h, except these three:
> > 
> >  arch/ia64/include/asm/cputime.h:typedef u64 cputime_t;
> >  arch/powerpc/include/asm/cputime.h:typedef u64 cputime_t;
> >  arch/s390/include/asm/cputime.h:typedef unsigned long long cputime_t;
> > 
> > Or we could eliminate the type altogether as well and standardize on 
> > u64. Thomas?
> 
> s390 uses 64 bit cputime_t because we want the high resolution also in
> 32 bit kernels. So standardizing on u64 would be the preferred solution
> for us.

The cputime_t type serves/served two purposes: 1) make it clear that
this is NOT a jiffie value, it is an architecture defined type with
architecture dependent semantic, 2) by redefining cputime_t to a
structure with a single embedded unsigned long I have been able to
identify all places in the kernel that do not use the proper cputime
functions. I'm not sure if we need 2) anymore.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
