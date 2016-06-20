From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: build warnings after merge of the pci tree
Date: Mon, 20 Jun 2016 14:11:36 -0500
Message-ID: <20160620191136.GA17036@localhost>
References: <20160620115213.07231836@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160620115213.07231836@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jun 20, 2016 at 11:52:13AM +1000, Stephen Rothwell wrote:
> Hi Bjorn,
> 
> After merging the pci tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
> 
> drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
> drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
>    return err;
>           ^
> drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
>    return PTR_ERR(cfg);
>           ^
> drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
>   return err;
>          ^
> 
> Introduced by commit
> 
>   3f8dcfc3fbba ("PCI: generic: Free resource list close to where it's allocated")

Fixed, thanks a lot, Stephen!
