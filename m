From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 17 Feb 2017 15:40:24 +1100
Message-ID: <20170217154024.0c768c9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755319AbdBQEk1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Feb 2017 23:40:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/cris/include/asm/Kbuild
  arch/m32r/include/asm/Kbuild
  arch/parisc/include/asm/Kbuild
  arch/score/include/asm/Kbuild

between commit:

  b672592f0221 ("sched/cputime: Remove generic asm headers")

from the tip tree and commits:

  ccbd143eeee3 ("cris: use generic current.h")
  103c58f13b54 ("m32r: use generic current.h")
  35a25dde31aa ("score: remove asm/current.h")
  c6b552bc22c7 ("parisc: use generic current.h")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/cris/include/asm/Kbuild
index 9f19e19bff9d,5e320f660c3c..000000000000
--- a/arch/cris/include/asm/Kbuild
+++ b/arch/cris/include/asm/Kbuild
@@@ -4,6 -4,8 +4,7 @@@ generic-y += barrier.
  generic-y += bitsperlong.h
  generic-y += clkdev.h
  generic-y += cmpxchg.h
 -generic-y += cputime.h
+ generic-y += current.h
  generic-y += device.h
  generic-y += div64.h
  generic-y += errno.h
diff --cc arch/m32r/include/asm/Kbuild
index 652100b64a71,30ee92ff0244..000000000000
--- a/arch/m32r/include/asm/Kbuild
+++ b/arch/m32r/include/asm/Kbuild
@@@ -1,5 -1,7 +1,6 @@@
  
  generic-y += clkdev.h
 -generic-y += cputime.h
+ generic-y += current.h
  generic-y += exec.h
  generic-y += irq_work.h
  generic-y += kvm_para.h
diff --cc arch/parisc/include/asm/Kbuild
index 4e179d770d69,7ac070267672..000000000000
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@@ -2,6 -2,8 +2,7 @@@
  generic-y += auxvec.h
  generic-y += barrier.h
  generic-y += clkdev.h
 -generic-y += cputime.h
+ generic-y += current.h
  generic-y += device.h
  generic-y += div64.h
  generic-y += emergency-restart.h
diff --cc arch/score/include/asm/Kbuild
index 51970bb6c4fe,620970f837bc..000000000000
--- a/arch/score/include/asm/Kbuild
+++ b/arch/score/include/asm/Kbuild
@@@ -4,6 -4,8 +4,7 @@@ header-y +
  
  generic-y += barrier.h
  generic-y += clkdev.h
 -generic-y += cputime.h
+ generic-y += current.h
  generic-y += irq_work.h
  generic-y += mcs_spinlock.h
  generic-y += mm-arch-hooks.h
