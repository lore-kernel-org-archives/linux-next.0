From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Fri, 20 Jul 2018 12:49:15 +0200
Message-ID: <20180720124915.47ead719@windsurf>
References: <20180720110310.6d07e86e@canb.auug.org.au>
        <20180720091553.GA23214@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720091553.GA23214@red-moon>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Evan Wang <xswang@marvell.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Fri, 20 Jul 2018 10:15:53 +0100, Lorenzo Pieralisi wrote:

> >   		switch (resource_type(res)) {
> >   		case IORESOURCE_IO:
> > - 			advk_pcie_set_ob_win(pcie, 1,
> > - 					     upper_32_bits(res->start),
> > - 					     lower_32_bits(res->start),
> > - 					     0,	0xF8000000, 0,
> > - 					     lower_32_bits(res->start),
> > - 					     OB_PCIE_IO);
> >  -			err = pci_remap_iospace(res, iobase);
> >  +			err = devm_pci_remap_iospace(dev, res, iobase);
> >   			if (err) {
> >   				dev_warn(dev, "error %d: failed to map resource %pR\n",
> >   					 err, res);  
> 
> Hi Stephen,
> 
> thanks for fixing this up, the fix looks fine to me (Thomas please
> confirm), if it is I would ask Bjorn please to send it upstream when the
> time for the PCI pull request comes.

I confirm that the fix looks good to me. Thanks Stephen for fixing it
up.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
