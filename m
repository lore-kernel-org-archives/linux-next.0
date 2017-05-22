From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 22 May 2017 13:27:11 +1000
Message-ID: <20170522132711.22b80ff5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751002AbdEVDfP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 May 2017 23:35:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/include/asm/cpufeature.h

between commit:

  63a1e1c95e60 ("arm64/cpufeature: don't use mutex in bringup path")

from Linus' tree and commit:

  d54bb72551b9 ("arm64/cpufeature: Use static_branch_enable_cpuslocked()")

from the tip tree.

I have no idea what the correct resolution is here, so I have just gone
with the former for now (i.e. removed the
static_branch_enable_cpuslocked() call).  This will probably need a
better (or even correct :-)) fix.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
