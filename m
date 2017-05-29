From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Mon, 29 May 2017 16:02:09 +1000
Message-ID: <20170529160209.5230c05b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750825AbdE2GCM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 May 2017 02:02:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Mike Frysinger <vapier@gentoo.org>, Steven Miao <realmz6@gmail.com>

Hi Paul,

After merging the rcu tree, today's linux-next build (bfin
BF526-EZBRD_defconfig and several other bfin configs) failed like this:

In file included from include/linux/srcu.h:60:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:777,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from include/linux/moduleloader.h:5,
                 from arch/blackfin/kernel/module.c:9:
include/linux/srcutiny.h: In function 'srcu_torture_stats_print':
include/linux/srcutiny.h:96:2: error: 'mod' undeclared (first use in this function)

Caused by commit

  54ffb22bd841 ("rcutorture: Move SRCU status printing to SRCU implementations")

arch/blackfin/kernel/module.c includes this:

#define pr_fmt(fmt) "module %s: " fmt, mod->name

added by commit

  b75a9e6bfba5 ("Blackfin: use more standard pr_fmt in the module loader")

before v2.6.39-rc2 ...

-- 
Cheers,
Stephen Rothwell
