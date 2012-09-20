From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the ixp4xx tree with the arm-soc tree
Date: Thu, 20 Sep 2012 15:31:49 +0000
Message-ID: <201209201531.50167.arnd@arndb.de>
References: <20120920163227.c6d8f1559b9cde971a376abf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:64648 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755826Ab2ITPbx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Sep 2012 11:31:53 -0400
In-Reply-To: <20120920163227.c6d8f1559b9cde971a376abf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khc@pm.waw.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Thursday 20 September 2012, Stephen Rothwell wrote:
> Today's linux-next merge of the ixp4xx tree got conflicts in
> arch/arm/mach-ixp4xx/common.c and
> arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h between commit
> 13ec32f47cb4 ("ARM: ixp4xx: use __iomem pointers for MMIO") from the
> arm-soc tree and commits 43690ab7543a ("IXP4xx: Always ioremap() Queue
> Manager MMIO region at boot") and f62736b567ff ("IXP4xx: map CPU config
> registers within VMALLOC region") from the ixp4xx tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Ok, thanks!

This conflict will go away once Krzysztof's patches make it into arm-soc.

	Arnd
