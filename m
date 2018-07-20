From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the powerpc-fixes tree
Date: Fri, 20 Jul 2018 12:34:06 +1000
Message-ID: <87r2jybppd.fsf@concordia.ellerman.id.au>
References: <20180720095138.275cc9aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720095138.275cc9aa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, David Gibson <david@gibson.dropbear.id.au>, Paul Mackerras <paulus@ozlabs.org>, Alex Williamson <alex.williamson@redhat.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   drivers/vfio/vfio_iommu_spapr_tce.c
>
> between commit:
>
>   1463edca6734 ("vfio/spapr: Use IOMMU pageshift rather than pagesize")
>
> from the powerpc-fixes tree and commit:
>
>   00a5c58d9499 ("KVM: PPC: Make iommu_table::it_userspace big endian")
>
> from the powerpc tree.

Thanks.

That has turned into a real mess, with conflicting code in next, fixes
and topic/ppc-kvm.

I'll fix it all up before the merge window.

cheers
