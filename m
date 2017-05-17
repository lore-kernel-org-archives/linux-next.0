From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commits in the rcu tree
Date: Thu, 18 May 2017 08:14:17 +1000
Message-ID: <20170518081417.2f724fbb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754145AbdEQWOU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 May 2017 18:14:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

I noticed a couple of commits in the rcu tree today that have no
Signed-off-by lines:

0eeaaea315cd fixup! rcu: Remove nohz_full full-system-idle state machine
cbe476cef633 fixup! rcu: Remove debugfs tracing

Please fix them up.

-- 
Cheers,
Stephen Rothwell
