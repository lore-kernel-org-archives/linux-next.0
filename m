From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 29 May 2017 14:15:05 -0700
Message-ID: <20170529211505.GP3956@linux.vnet.ibm.com>
References: <20170529160209.5230c05b@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37257 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750873AbdE2VPH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 17:15:07 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4TLDVu2003109
        for <linux-next@vger.kernel.org>; Mon, 29 May 2017 17:15:06 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2arsf8kb8d-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 29 May 2017 17:15:06 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 29 May 2017 17:15:06 -0400
Content-Disposition: inline
In-Reply-To: <20170529160209.5230c05b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

On Mon, May 29, 2017 at 04:02:09PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (bfin
> BF526-EZBRD_defconfig and several other bfin configs) failed like this:
> 
> In file included from include/linux/srcu.h:60:0,
>                  from include/linux/notifier.h:15,
>                  from include/linux/memory_hotplug.h:6,
>                  from include/linux/mmzone.h:777,
>                  from include/linux/gfp.h:5,
>                  from include/linux/kmod.h:22,
>                  from include/linux/module.h:13,
>                  from include/linux/moduleloader.h:5,
>                  from arch/blackfin/kernel/module.c:9:
> include/linux/srcutiny.h: In function 'srcu_torture_stats_print':
> include/linux/srcutiny.h:96:2: error: 'mod' undeclared (first use in this function)
> 
> Caused by commit
> 
>   54ffb22bd841 ("rcutorture: Move SRCU status printing to SRCU implementations")

And of course this is nothing but a printk().

> arch/blackfin/kernel/module.c includes this:
> 
> #define pr_fmt(fmt) "module %s: " fmt, mod->name

Hmmm...  There are well over 1000 definitions of pr_fmt() in the kernel.
Very popular name there!

> added by commit
> 
>   b75a9e6bfba5 ("Blackfin: use more standard pr_fmt in the module loader")
> 
> before v2.6.39-rc2 ...

I guess I cannot claim to be blindsided by a recent change, at least not
unless you take my age into account.  ;-)

So maybe there is some header file that blackfin wants included?  There
are only about 100 definitions of "mod", so let's see...  Well, none of
them are in blackfin, but perhaps the two in module.h?  But these are just
fields in structs.  As is the one in moduleparam.h.

At this point, the only option I see is to convert srcu_torture_stats_print()
from a static inline function to a macro.

Anyone see any other options?

								Thanx, Paul
