From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: Tree for Jan 15 (um, rcu)
Date: Wed, 15 Jan 2014 20:39:03 +0100
Message-ID: <2114717.uibXxy8kL0@sandpuppy>
References: <20140115185545.497c14923814b6ecaa540d9f@canb.auug.org.au> <52D6B591.3070707@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from b.ns.miles-group.at ([95.130.255.144]:1661 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750933AbaAOTjJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jan 2014 14:39:09 -0500
In-Reply-To: <52D6B591.3070707@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

Am Mittwoch, 15. Januar 2014, 08:21:37 schrieb Randy Dunlap:
> On 01/14/2014 11:55 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > This tree fails (more than usual) the powerpc allyesconfig build.
> 
> > Changes since 20140114:
> on i386 and/or x86_64 defconfigs:
> 
>   CC      arch/um/kernel/asm-offsets.s
> In file included from include/linux/sched.h:43:0,
>                  from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
>                  from arch/um/kernel/asm-offsets.c:1:
> include/linux/rculist.h: In function '__list_add_rcu':
> include/linux/rculist.h:54:2: error: implicit declaration of function
> 'smp_store_release' [-Werror=implicit-function-declaration] cc1: some
> warnings being treated as errors
> make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1

Thanks for reporting Randy!

Stephen, can you please add my UML tree to -next?
It contains already the fix.
git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git next

Please note there is a trivial merge conflict in arch/um/include/asm/Kbuild.

Thanks,
//richard
