From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Wed, 30 Mar 2016 11:23:21 +1100
Message-ID: <20160330112321.5d044d6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55566 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751135AbcC3AXY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Mar 2016 20:23:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/rcutorture.c

between commit:

  25528213fe9f ("tags: Fix DEFINE_PER_CPU expansions")

from Linus' tree and commit:

  0b36a04e0461 ("rcutorture: Remove redundant initialization to zero")

from the rcu tree.

I fixed it up (the latter also did what the former did) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
