From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the pci tree
Date: Tue, 21 Jun 2016 11:08:38 +1000
Message-ID: <20160621110838.4d4f1171@canb.auug.org.au>
References: <20160620115213.07231836@canb.auug.org.au>
	<20160620191136.GA17036@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56318 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751577AbcFUBIl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jun 2016 21:08:41 -0400
In-Reply-To: <20160620191136.GA17036@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Bjorn,

On Mon, 20 Jun 2016 14:11:36 -0500 Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Jun 20, 2016 at 11:52:13AM +1000, Stephen Rothwell wrote:
> > Hi Bjorn,
> > 
> > After merging the pci tree, today's linux-next build (arm
> > multi_v7_defconfig) produced these warnings:
> > 
> > drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
> > drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
> >    return err;
> >           ^
> > drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
> >    return PTR_ERR(cfg);
> >           ^
> > drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
> >   return err;
> >          ^
> > 
> > Introduced by commit
> > 
> >   3f8dcfc3fbba ("PCI: generic: Free resource list close to where it's allocated")  
> 
> Fixed, thanks a lot, Stephen!

Thanks.  Unfortunately, I still get this warning:

drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
   return PTR_ERR(cfg);
          ^

-- 
Cheers,
Stephen Rothwell
