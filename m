From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with Linus' tree
Date: Mon, 09 Nov 2015 01:46:01 +0100
Message-ID: <4227495.5k86JKlag9@vostro.rjw.lan>
References: <20151109104512.781b6af2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:42125 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752199AbbKIAQp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2015 19:16:45 -0500
In-Reply-To: <20151109104512.781b6af2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>

On Monday, November 09, 2015 10:45:12 AM Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> Today's linux-next merge of the pm tree got a conflict in:
> 
>   drivers/of/of_pci.c
>   include/linux/of_pci.h
> 
> between commits:
> 
>   f81c11af617c ("of/pci: Add of_pci_check_probe_only to parse "linux,pci-probe-only"")
> 
> from Linus' tree and commit:
> 
>   50230713b639 ("PCI: OF: Move of_pci_dma_configure() to pci_dma_configure()")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks a lot for taking care of this!

Rafael
