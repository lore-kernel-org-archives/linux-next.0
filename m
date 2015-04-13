From: Wei Yang <weiyang@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the powerpc-mpe tree with the
 powerpc tree
Date: Mon, 13 Apr 2015 14:09:13 +0800
Message-ID: <20150413060913.GA2365@richard>
References: <20150413132715.2303253f@canb.auug.org.au>
Reply-To: Wei Yang <weiyang@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150413132715.2303253f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>, Wei Yang <weiyang@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 13, 2015 at 01:27:15PM +1000, Stephen Rothwell wrote:
>Hi all,
>
>Today's linux-next merge of the powerpc-mpe tree got a conflict in
>arch/powerpc/include/asm/machdep.h between commit 6e628c7d33d9
>("powerpc/powernv: Reserve additional space for IOV BAR according to
>the number of total_pe") from the  tree and commit 467efc2e4fdc
>("powerpc: Remove shims for pci_controller_ops operations") from the
>powerpc-mpe tree.
>
>I fixed it up (see below) and can carry the fix as necessary (no action
>is required).

Hi, Stephen,

Thanks for your finding :-) Your fix looks good to me.

Michael & Ben,

Do I need to rebase the patch or what should I do?

>
>-- 
>Cheers,
>Stephen Rothwell                    sfr@canb.auug.org.au
>
>diff --cc arch/powerpc/include/asm/machdep.h
>index 1b268044f290,5c19ac527a8e..000000000000
>--- a/arch/powerpc/include/asm/machdep.h
>+++ b/arch/powerpc/include/asm/machdep.h
>@@@ -240,21 -236,6 +236,11 @@@ struct machdep_calls 
>  	/* Called after scan and before resource survey */
>  	void (*pcibios_fixup_phb)(struct pci_controller *hose);
>  
>- 	/* Called during PCI resource reassignment */
>- 	resource_size_t (*pcibios_window_alignment)(struct pci_bus *, unsigned long type);
>- 
>- 	/* Reset the secondary bus of bridge */
>- 	void  (*pcibios_reset_secondary_bus)(struct pci_dev *dev);
>- 
> +#ifdef CONFIG_PCI_IOV
> +	void (*pcibios_fixup_sriov)(struct pci_dev *pdev);
> +	resource_size_t (*pcibios_iov_resource_alignment)(struct pci_dev *, int resno);
> +#endif /* CONFIG_PCI_IOV */
> +
>  	/* Called to shutdown machine specific hardware not already controlled
>  	 * by other drivers.
>  	 */



-- 
Richard Yang
Help you, Help me
