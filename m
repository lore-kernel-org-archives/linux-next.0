From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Mon, 6 Nov 2017 13:52:20 +1100
Message-ID: <20171106135220.77c2101d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750848AbdKFCwV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Nov 2017 21:52:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dongjiu Geng <gengdongjiu@huawei.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm/kvm/emulate.c

between commit:

  fd6c8c206fc5 ("arm/arm64: KVM: set right LR register value for 32 bit guest when inject abort")

from Linus' tree and commit:

  00586cdaf597 ("KVM: arm/arm64: Unify 32bit fault injection")

from the kvm-arm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
