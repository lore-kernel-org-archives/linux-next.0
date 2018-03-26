From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Mon, 26 Mar 2018 14:53:36 -0500
Message-ID: <20180326195336.GB224629@bhelgaas-glaptop.roam.corp.google.com>
References: <20180326123143.38630ea3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180326123143.38630ea3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 26, 2018 at 12:31:43PM +1100, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from /home/sfr/next/next/drivers/pci/host/pcie-iproc.c:16:0:  
> /home/sfr/next/next/include/linux/irqchip/arm-gic-v3.h:560:10: fatal error: asm/arch_gicv3.h: No such file or directory
>  #include <asm/arch_gicv3.h>
>           ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   af3c73473d10 ("PCI: Improve host drivers compile test coverage")
> 
> I used the pci tree from next-20180323 for today.

Thanks, I updated my tree to drop af3c73473d10 ("PCI: Improve host
drivers compile test coverage") for now.

I know Lorenzo is out this week, so he may not be able to do an
update, but if you post a new version, Rob, I'll see if I can pull it
in.

Bjorn
