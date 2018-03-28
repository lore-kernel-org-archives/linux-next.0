From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Wed, 28 Mar 2018 12:53:59 +0100
Message-ID: <20180328115358.GC30850@arm.com>
References: <20180328160034.61e0e588@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180328160034.61e0e588@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shanker Donthineni <shankerd@codeaurora.org>, Dave Martin <dave.martin@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Mar 28, 2018 at 04:00:34PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/kernel/cpu_errata.c
> 
> between commit:
> 
>   c0cda3b8ee6b ("arm64: capabilities: Update prototype for enable call back")
>   followed by a series of patches cleaning up capabilities
> 
> from the arm64 tree and commits:
> 
>   4b472ffd1513 ("arm64: Enable ARM64_HARDEN_EL2_VECTORS on Cortex-A57 and A72")
>   f9f5dc19509b ("arm64: KVM: Use SMCCC_ARCH_WORKAROUND_1 for Falkor BP hardening")
> 
> from the kvm-arm tree.
> 
> I fixed it up (maybe, please check the result and see below) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is a really grotty conflict, so Marc and I have decided to revert
f9f5dc19509b ("arm64: KVM: Use SMCCC_ARCH_WORKAROUND_1 for Falkor BP hardening")
from kvm-arm for now. There's a little hack necessary to keep things
building after that, but we can clean that up at -rc1.

Shanker -- I'm still aiming to get your patch into 4.17, either during the
second half of the merge window or at -rc1.

Cheers,

Will
