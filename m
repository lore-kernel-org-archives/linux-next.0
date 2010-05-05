From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH -next] staging/rar_register: depends on PCI
Date: Thu, 6 May 2010 00:55:57 +0100
Message-ID: <20100506005557.7d458c7b@lxorguk.ukuu.org.uk>
References: <20100505123409.ed5678a2.sfr@canb.auug.org.au>
	<20100505154522.c3d7807c.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:48151 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752324Ab0EEXu2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 19:50:28 -0400
In-Reply-To: <20100505154522.c3d7807c.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org

On Wed, 5 May 2010 15:45:22 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> rar_register driver uses PCI interfaces and PCI devices, so it
> should depend on PCI.
> 
> Also format the Kconfig help text as normally done.
> 
> drivers/staging/rar_register/rar_register.c:623: error: implicit declaration of function 'pci_dev_get'
> drivers/staging/rar_register/rar_register.c:623: warning: assignment makes pointer from integer without a cast
> 
> Note:  The memrar driver selects this driver's Kconfig symbol, even when
> PCI is not enabled.  That select could be changed to
> 	select RAR_REGISTER if PCI
> but that would still result in build errors when PCI is not enabled, namely:
> drivers/built-in.o: In function `memrar_fini_rar_resources':
> memrar_handler.c:(.text+0x2391b7): undefined reference to `unregister_rar'
> drivers/built-in.o: In function `memrar_registration_callback':
> memrar_handler.c:(.text+0x23925a): undefined reference to `rar_get_address'
> drivers/built-in.o: In function `memrar_init':
> memrar_handler.c:(.init.text+0x12c7b): undefined reference to `register_rar'
> memrar_handler.c:(.init.text+0x12c97): undefined reference to `register_rar'
> 
> Does anyone have suggestions for this?

Yes - memrar should depend upon the RAR_REGISTER

> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>
