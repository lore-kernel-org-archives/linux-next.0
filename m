From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 1 Jun 2018 09:23:25 +0100
Message-ID: <bc517d41-dac3-13a1-23b7-9d3f4cab3154@arm.com>
References: <20180601162320.1ef18d8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601162320.1ef18d8e@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall <cdall@cs.columbia.edu>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 01/06/18 07:23, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got conflicts in:
> 
> arch/arm64/include/asm/kvm_host.h arch/arm64/kvm/hyp/switch.c
> 
> between commit:
> 
> 55e3748e8902 ("arm64: KVM: Add ARCH_WORKAROUND_2 support for
> guests")
> 
> from the arm64 tree and commits:
> 
> fa89d31c5306 ("KVM: arm64: Repurpose vcpu_arch.debug_flags for
> general-purpose flags") e6b673b741ea ("KVM: arm64: Optimise FPSIMD
> handling to reduce guest/host thrashing")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This 
> is now fixed as far as linux-next is concerned, but any non
> trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to
> consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 

All three resolutions look correct to me.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
