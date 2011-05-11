From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the namespace tree
Date: Tue, 10 May 2011 21:21:12 -0700
Message-ID: <m1hb91eukn.fsf@fess.ebiederm.org>
References: <20110511140900.bbafb560.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110511140900.bbafb560.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Wed, 11 May 2011 14:09:00 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> After merging the namespace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from arch/powerpc/platforms/cell/spu_callbacks.c:49:
> arch/powerpc/include/asm/systbl.h:356: error: 'sys_setns' undeclared here (not in a function)
>
> Caused by commit e975ee91dcc1 ("ns: Wire up the setns system call").
> sys_setns should be declared in include/linux/syscalls.h.
>
> I have dropped the namespace tree for today.

Ouch.  I guess I must have missed something I will take a look.
My apologies for the trouble.

Eric
