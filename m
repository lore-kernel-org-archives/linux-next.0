From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Fri, 20 Jul 2018 10:15:53 +0100
Message-ID: <20180720091553.GA23214@red-moon>
References: <20180720110310.6d07e86e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180720110310.6d07e86e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Evan Wang <xswang@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 20, 2018 at 11:03:10AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pci tree got a conflict in:
> 
>   drivers/pci/controller/pci-aardvark.c
> 
> between commit:
> 
>   1df3e5b3feeb ("PCI: aardvark: Fix I/O space page leak")
> 
> from Linus' tree and commit:
> 
>   6df6ba974a55 ("PCI: aardvark: Remove PCIe outbound window configuration")
> 
> from the pci tree.
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
> diff --cc drivers/pci/controller/pci-aardvark.c
> index 0fae816fba39,d5030cd06197..000000000000
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@@ -843,13 -809,7 +809,7 @@@ static int advk_pcie_parse_request_of_p
>   
>   		switch (resource_type(res)) {
>   		case IORESOURCE_IO:
> - 			advk_pcie_set_ob_win(pcie, 1,
> - 					     upper_32_bits(res->start),
> - 					     lower_32_bits(res->start),
> - 					     0,	0xF8000000, 0,
> - 					     lower_32_bits(res->start),
> - 					     OB_PCIE_IO);
>  -			err = pci_remap_iospace(res, iobase);
>  +			err = devm_pci_remap_iospace(dev, res, iobase);
>   			if (err) {
>   				dev_warn(dev, "error %d: failed to map resource %pR\n",
>   					 err, res);

Hi Stephen,

thanks for fixing this up, the fix looks fine to me (Thomas please
confirm), if it is I would ask Bjorn please to send it upstream when the
time for the PCI pull request comes.

Thanks,
Lorenzo
