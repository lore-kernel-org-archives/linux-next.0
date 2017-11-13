From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the powerpc tree with Linus' tree
Date: Mon, 13 Nov 2017 16:37:06 +1100
Message-ID: <20171113163706.6c5a98a1@canb.auug.org.au>
References: <20171030125133.ce5vb6z67dqjb7oj@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751583AbdKMFhI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:37:08 -0500
In-Reply-To: <20171030125133.ce5vb6z67dqjb7oj@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Mark Brown <broonie@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>, Paul Mackerras <paulus@ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 30 Oct 2017 12:51:33 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
> 
> Today's linux-next merge of the powerpc tree got a conflict in:
> 
>   arch/powerpc/kvm/powerpc.c
> 
> between commit:
> 
>   ac64115a66c1 ("KVM: PPC: Fix oops when checking KVM_CAP_PPC_HTM")
> 
> from Linus' tree and commit:
> 
>   2a3d6553cbd7 ("KVM: PPC: Tie KVM_CAP_PPC_HTM to the user-visible TM feature")
> 
> from the powerpc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/powerpc/kvm/powerpc.c
> index ee279c7f4802,a3746b98ec11..000000000000
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@@ -644,7 -644,8 +644,8 @@@ int kvm_vm_ioctl_check_extension(struc
>   		break;
>   #endif
>   	case KVM_CAP_PPC_HTM:
> - 		r = cpu_has_feature(CPU_FTR_TM_COMP) && hv_enabled;
>  -		r = is_kvmppc_hv_enabled(kvm) &&
> ++		r = hv_enabled &&
> + 		    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_HTM_COMP);
>   		break;
>   	default:
>   		r = 0;

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
