From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 5 Sep 2016 11:27:42 +1000
Message-ID: <20160905112742.668cb341@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754244AbcIEB1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Sep 2016 21:27:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/head.S

between commit:

  fd363bd417dd ("arm64: avoid TLB conflict with CONFIG_RANDOMIZE_BASE")

from Linus' tree and commit:

  3c5e9f238bc4 ("arm64: head.S: move KASLR processing out of __enable_mmu()")

from the arm64 tree.

I fixed it up (the latter included the former change, so I just used that)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
