From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the unicore32 tree
Date: Wed, 7 Jun 2017 13:19:30 +1000
Message-ID: <20170607131930.0e83279e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47665 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751511AbdFGDTe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Jun 2017 23:19:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Xuetao Guan <epip.guan@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qin Rui <qinrui@pku.edu.cn>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/unicore32/include/asm/Kbuild

between commit:

  bc27113620ca ("unicore32-oldabi: add oldabi syscall interface")

from the unicore32 tree and commit:

  6bc51cbaa9d7 ("signal: Remove non-uapi <asm/siginfo.h>")

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

diff --cc arch/unicore32/include/asm/Kbuild
index ea47c4bf3aa7,7a53a55341de..000000000000
--- a/arch/unicore32/include/asm/Kbuild
+++ b/arch/unicore32/include/asm/Kbuild
@@@ -44,7 -44,7 +44,6 @@@ generic-y += serial.
  generic-y += setup.h
  generic-y += shmbuf.h
  generic-y += shmparam.h
- generic-y += siginfo.h
 -generic-y += signal.h
  generic-y += sizes.h
  generic-y += socket.h
  generic-y += sockios.h
