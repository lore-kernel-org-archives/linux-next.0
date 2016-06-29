From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the powerpc tree with Linus' tree
Date: Wed, 29 Jun 2016 10:54:26 +0530
Message-ID: <20160629052426.GB14508@naverao1-tp.localdomain>
References: <20160629103507.52c60714@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42734 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750892AbcF2FYg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jun 2016 01:24:36 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5T5Nk7G066757
	for <linux-next@vger.kernel.org>; Wed, 29 Jun 2016 01:24:35 -0400
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
	by mx0b-001b2d01.pphosted.com with ESMTP id 23uw5pmc0s-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 29 Jun 2016 01:24:35 -0400
Received: from localhost
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <naveen.n.rao@linux.vnet.ibm.com>;
	Wed, 29 Jun 2016 15:24:32 +1000
Content-Disposition: inline
In-Reply-To: <20160629103507.52c60714@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thadeu Lima de Souza Cascardo <cascardo@redhat.com>

On 2016/06/29 10:35AM, Stephen Rothwell wrote:
> Hi all,

Hi Stephen,

> 
> Today's linux-next merge of the powerpc tree got a conflict in:
> 
>   arch/powerpc/Kconfig
> 
> between commit:
> 
>   844e3be47693 ("powerpc/bpf/jit: Disable classic BPF JIT on ppc64le")

Ah, I see that the above commit is not part of powerpc next tree, which 
explains the conflict.

> 
> from Linus' tree and commit:
> 
>   156d0e290e96 ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> 
> from the powerpc tree.
> 
> I fixed it up (see below - I am not sure this entirely correct) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/powerpc/Kconfig
> index 0a9d439bcda6,ee82f9a09a85..000000000000
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@@ -128,7 -128,8 +128,8 @@@ config PP
>   	select IRQ_FORCED_THREADING
>   	select HAVE_RCU_TABLE_FREE if SMP
>   	select HAVE_SYSCALL_TRACEPOINTS
> - 	select HAVE_CBPF_JIT if CPU_BIG_ENDIAN
>  -	select HAVE_CBPF_JIT if !PPC64
> ++	select HAVE_CBPF_JIT if !PPC64 && CPU_BIG_ENDIAN

'if !PPC64' condition is sufficient, though having the BIG_ENDIAN check 
should be ok too.

Thanks,
Naveen

> + 	select HAVE_EBPF_JIT if PPC64
>   	select HAVE_ARCH_JUMP_LABEL
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> 
