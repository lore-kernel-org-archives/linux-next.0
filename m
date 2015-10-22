From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Thu, 22 Oct 2015 13:26:52 +1100
Message-ID: <20151022132652.611ec628@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52054 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756570AbbJVC04 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Oct 2015 22:26:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/kernel/cpufeature.c

between commit:

  da8d02d19ffd ("arm64/capabilities: Make use of system wide safe value")

from the arm64 tree and commit:

  963fcd409587 ("arm64: cpufeatures: Check ICC_EL1_SRE.SRE before enabling ARM64_HAS_SYSREG_GIC_CPUIF")

from the tip tree.

I fixed it up (I have no idea here, so I just used the arm64 tree version)
and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
