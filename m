From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Mon, 28 Aug 2017 14:25:48 +1000
Message-ID: <20170828142548.6c929298@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750735AbdH1EZv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 00:25:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Hi Paul,

After merging the rcu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/kernel/asm-offsets.c:14:0:
include/linux/sched.h: In function 'membarrier_sched_out':
include/linux/sched.h:1680:3: error: implicit declaration of function 'sync_core' [-Werror=implicit-function-declaration]
   sync_core();
   ^

Caused by commit

  0d6eb99818da ("membarrier: Provide register sync core cmd")

I have used the rcu tree from next-20170825 for today.

-- 
Cheers,
Stephen Rothwell
