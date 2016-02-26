From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: next-20160225 build: 2 failures 44 warnings (next-20160225)
Date: Fri, 26 Feb 2016 09:08:30 +0100
Message-ID: <20160226090830.41a63a86@free-electrons.com>
References: <E1aYsmb-0006qb-76@optimist>
	<20160226030411.GK18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:44780 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753438AbcBZIIe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2016 03:08:34 -0500
In-Reply-To: <20160226030411.GK18327@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>

Mark,

On Fri, 26 Feb 2016 12:04:11 +0900, Mark Brown wrote:

> Today's -next fails to build an arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ../drivers/pci/host/pci-mvebu.c:755:12: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
> > ../drivers/pci/host/pci-mvebu.c:855:31: error: dereferencing pointer to incomplete type 'struct pci_sys_data'
> > ../drivers/pci/host/pci-mvebu.c:904:16: error: storage size of 'hw' isn't known
> > ../drivers/pci/host/pci-mvebu.c:919:2: error: implicit declaration of function 'pci_common_init_dev' [-Werror=implicit-function-declaration]
> > ../drivers/pci/host/pci-mvebu.c:1282:3: error: implicit declaration of function 'pci_ioremap_io' [-Werror=implicit-function-declaration]
> 
> caused by b4f596b19624 (arm64: add mvebu architecture entry) which
> enables MVBEU on arm64, the commit was present for a little while and
> the error cropped up but didn't get reported due to other things masking
> it.  This looks like the driver needs modernization and probably ought
> to have a !ARM64 dependency for now.

This has already been fixed by:

	[PATCH] PCI: mvebu: Restrict build to 32-bit ARM

submitted by Thierry Redding. I'm Cc'ing Bjorn, who is the one in
charge of merging this fix.

Thanks for reporting!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
