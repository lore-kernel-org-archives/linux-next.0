From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 15 (um, rcu)
Date: Wed, 15 Jan 2014 08:21:37 -0800
Message-ID: <52D6B591.3070707@infradead.org>
References: <20140115185545.497c14923814b6ecaa540d9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:42082 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752458AbaAOQVl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2014 11:21:41 -0500
In-Reply-To: <20140115185545.497c14923814b6ecaa540d9f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On 01/14/2014 11:55 PM, Stephen Rothwell wrote:
> Hi all,
> 
> This tree fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140114:
> 

on i386 and/or x86_64 defconfigs:

  CC      arch/um/kernel/asm-offsets.s
In file included from include/linux/sched.h:43:0,
                 from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
                 from arch/um/kernel/asm-offsets.c:1:
include/linux/rculist.h: In function '__list_add_rcu':
include/linux/rculist.h:54:2: error: implicit declaration of function 'smp_store_release' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1


-- 
~Randy
