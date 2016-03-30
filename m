From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Wed, 30 Mar 2016 11:32:14 +1100
Message-ID: <20160330113214.4110cd63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53911 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751712AbcC3AcR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Mar 2016 20:32:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  abedf8e2419f ("rcu: Use simple wait queues where possible in rcutree")

from Linus' tree and commit:

  08cace5914ea ("DIAGS: Crude exploratory hack")

from the rcu tree.

I fixed it up (I used the rcu tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

I really don't think that that rcu tree patch should be in linux-next,
right?

-- 
Cheers,
Stephen Rothwell
