From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the drm tree
Date: Fri, 17 Feb 2017 12:56:29 +1100
Message-ID: <20170217125629.28d43302@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754904AbdBQB4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Feb 2017 20:56:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/kref.h

between commit:

  56e3d1cd05cc ("kref: prefer atomic_inc_not_zero to atomic_add_unless")

from the drm tree and commit:

  10383aea2f44 ("kref: Implement 'struct kref' using refcount_t")

from the tip tree.

I fixed it up (I just used the tip tree version of kref_get_unless_zero())
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
