From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the openrisc tree
Date: Fri, 17 Feb 2017 12:43:21 +1100
Message-ID: <20170217124321.7b4b394d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755078AbdBQBnY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Feb 2017 20:43:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Stafford Horne <shorne@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/openrisc/include/asm/Kbuild

between commit:

  157e82f58007 ("openrisc: add cmpxchg and xchg implementations")

from the openrisc tree and commit:

  b672592f0221 ("sched/cputime: Remove generic asm headers")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/openrisc/include/asm/Kbuild
index a669c141436e,ef8d1ccc3e45..000000000000
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@@ -9,7 -10,8 +9,6 @@@ generic-y += bugs.
  generic-y += cacheflush.h
  generic-y += checksum.h
  generic-y += clkdev.h
- generic-y += cputime.h
 -generic-y += cmpxchg-local.h
 -generic-y += cmpxchg.h
  generic-y += current.h
  generic-y += device.h
  generic-y += div64.h
