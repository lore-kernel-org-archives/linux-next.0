From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 30 May 2017 14:10:26 +1000
Message-ID: <874lw36l3h.fsf@concordia.ellerman.id.au>
References: <20170529160209.5230c05b@canb.auug.org.au> <20170529211505.GP3956@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40239 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750951AbdE3EK2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 May 2017 00:10:28 -0400
In-Reply-To: <20170529211505.GP3956@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> writes:

> On Mon, May 29, 2017 at 04:02:09PM +1000, Stephen Rothwell wrote:
>> Hi Paul,
>> 
>> After merging the rcu tree, today's linux-next build (bfin
>> BF526-EZBRD_defconfig and several other bfin configs) failed like this:
>> 
>> In file included from include/linux/srcu.h:60:0,
>>                  from include/linux/notifier.h:15,
>>                  from include/linux/memory_hotplug.h:6,
>>                  from include/linux/mmzone.h:777,
>>                  from include/linux/gfp.h:5,
>>                  from include/linux/kmod.h:22,
>>                  from include/linux/module.h:13,
>>                  from include/linux/moduleloader.h:5,
>>                  from arch/blackfin/kernel/module.c:9:
>> include/linux/srcutiny.h: In function 'srcu_torture_stats_print':
>> include/linux/srcutiny.h:96:2: error: 'mod' undeclared (first use in this function)
>> 
>> Caused by commit
>> 
>>   54ffb22bd841 ("rcutorture: Move SRCU status printing to SRCU implementations")
>
> And of course this is nothing but a printk().

Ah but it's not, it's a pr_alert():

+       pr_alert("%s%s Tiny SRCU per-CPU(idx=%d): (%hd,%hd)\n",
+                tt, tf, idx,
+                READ_ONCE(sp->srcu_lock_nesting[!idx]),
+                READ_ONCE(sp->srcu_lock_nesting[idx]));

Where pr_alert() is:

#define pr_alert(fmt, ...) \
	printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)


So that's where pr_fmt() is coming into it.

And if any code in module.c called srcu_torture_stats_print(), it would
actually claim to come from "module: ", which would be confusing.

I don't think you use pr_fmt() in the RCU code, so you could skip using
pr_alert() and just use printk(KERN_ALERT "...") and get the same
result, without any interactions with pr_fmt().

cheers
