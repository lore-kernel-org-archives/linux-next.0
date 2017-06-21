From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rcu tree
Date: Wed, 21 Jun 2017 16:48:06 +1000
Message-ID: <20170621164806.2caba20a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59397 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751067AbdFUGsJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 02:48:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

kernel/cpu.c: In function 'boot_cpu_state_init':
kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
  int cpu;
      ^

Introduced by commit

  faeb334286b7 ("rcu: Migrate callbacks earlier in the CPU-offline timeline")

-- 
Cheers,
Stephen Rothwell
