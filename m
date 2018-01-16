From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Wed, 17 Jan 2018 09:30:18 +1100
Message-ID: <20180117093018.2004ae03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44273 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbeAPWaV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jan 2018 17:30:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Dave Martin <Dave.Martin@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/fpsimd.c

between commit:

  a45448313706 ("arm64: fpsimd: Fix copying of FP state from signal frame into task struct")

from Linus' tree and commit:

  0abdeff598a6 ("arm64: fpsimd: Fix state leakage when migrating after sigreturn")

from the arm64 tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
