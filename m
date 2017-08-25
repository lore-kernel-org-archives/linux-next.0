From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 25 Aug 2017 14:57:21 +1000
Message-ID: <20170825145721.51c56af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48601 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751411AbdHYE5X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Aug 2017 00:57:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>, Julien Thierry <julien.thierry@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/esr.h

between commit:

  1f9b8936f36f ("arm64: Decode information from ESR upon mem faults")

from the arm64 tree and commit:

  c5511c3c068c ("KVM: arm/arm64: Fix guest external abort matching")

from the kvm-arm tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
