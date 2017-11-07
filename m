From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with Linus' tree
Date: Wed, 8 Nov 2017 09:32:24 +1100
Message-ID: <20171108093224.54fb4bb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48467 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752843AbdKGWc1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Nov 2017 17:32:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/mm/tlb-radix.c

between commit:

  26e53d5ebe2e ("powerpc/64s/radix: Fix preempt imbalance in TLB flush")

from Linus' tree and commit:

  dffe8449c5dd ("powerpc/64s/radix: Improve preempt handling in TLB code")

from the powerpc tree.

I fixed it up (I effectively dropped the former as it seems to be fixed in
the latter as well) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
