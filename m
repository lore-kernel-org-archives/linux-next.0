From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commit in the rcu tree
Date: Mon, 27 Mar 2017 00:33:27 +1100
Message-ID: <20170327003327.3d5bf230@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751338AbdCZNdb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 09:33:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org

Hi Paul,

Commit 08b35b89141a ("fixup! srcu: Create a tiny SRCU") has not
Signed-off-by tag at all :-(

Please do not put commits in your linux-next included branch that are
not signed.

-- 
Cheers,
Stephen Rothwell
