From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Wed, 29 Nov 2017 11:51:51 +1100
Message-ID: <20171129115151.40b72764@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751496AbdK2Avx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 19:51:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liang Lihao <lianglihao@huawei.com>

Hi Paul,

Commit

  d7e182c9c324 ("rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
