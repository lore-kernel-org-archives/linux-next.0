From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm-arm
 tree
Date: Wed, 1 May 2019 11:48:01 +0100
Message-ID: <20190501104758.GM3567@e103592.cambridge.arm.com>
References: <20190501160902.49dcf348@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501160902.49dcf348@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Daniel Kachhap <amit.kachhap@arm.com>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 01, 2019 at 04:09:02PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-ppc tree got a conflict in:
> 
>   include/uapi/linux/kvm.h
> 
> between commits:
> 
>   555f3d03e7fb ("KVM: arm64: Add a capability to advertise SVE support")
>   a243c16d18be ("KVM: arm64: Add capability to advertise ptrauth for guest")
> 
> from the kvm-arm tree and commit:
> 
>   eacc56bb9de3 ("KVM: PPC: Book3S HV: XIVE: Introduce a new capability KVM_CAP_PPC_IRQ_XIVE")
> 
> from the kvm-ppc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/uapi/linux/kvm.h
> index 4dc34f8e29f6,52bf74a1616e..000000000000
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@@ -988,9 -988,7 +988,10 @@@ struct kvm_ppc_resize_hpt 
>   #define KVM_CAP_ARM_VM_IPA_SIZE 165
>   #define KVM_CAP_MANUAL_DIRTY_LOG_PROTECT 166
>   #define KVM_CAP_HYPERV_CPUID 167
>  -#define KVM_CAP_PPC_IRQ_XIVE 168
>  +#define KVM_CAP_ARM_SVE 168
>  +#define KVM_CAP_ARM_PTRAUTH_ADDRESS 169
>  +#define KVM_CAP_ARM_PTRAUTH_GENERIC 170
> ++#define KVM_CAP_PPC_IRQ_XIVE 171

Looks good to me.

Cheers
---Dave
