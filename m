From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: uwb build errors: CONFIG_PCI=n, CONFIG_USB=y
Date: Wed, 14 May 2008 13:17:49 -0700
Message-ID: <20080514131749.17675ba0.randy.dunlap@oracle.com>
References: <Pine.LNX.4.64.0805061356150.17702@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:30939 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbYENUXJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 May 2008 16:23:09 -0400
In-Reply-To: <Pine.LNX.4.64.0805061356150.17702@shark.he.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm <akpm@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, david.vrabel@csr.com, greg@kroah.com

[dropped closed list: linux-uwb@bughost.org]

This build error has now moved into 2.6.26-rc2-mm1 also.


On Tue, 6 May 2008 13:58:22 -0700 (PDT) Randy.Dunlap wrote:

> 
> On x86_64 or i386, maybe others:
> 
> In file included from /home/rdunlap/linsrc/next-20080506/drivers/uwb/umc-bus.c:12:
> /home/rdunlap/linsrc/next-20080506/include/linux/uwb/umc.h: In function 'umc_parent_pci_dev':
> /home/rdunlap/linsrc/next-20080506/include/linux/uwb/umc.h:145: error: 'pci_bus_type' undeclared (first use in this function)
> /home/rdunlap/linsrc/next-20080506/include/linux/uwb/umc.h:145: error: (Each undeclared identifier is reported only once
> /home/rdunlap/linsrc/next-20080506/include/linux/uwb/umc.h:145: error: for each function it appears in.)
> /home/rdunlap/linsrc/next-20080506/drivers/uwb/umc-bus.c: In function 'umc_match_pci_id':
> /home/rdunlap/linsrc/next-20080506/drivers/uwb/umc-bus.c:29: error: 'pci_bus_type' undeclared (first use in this function)
> /home/rdunlap/linsrc/next-20080506/drivers/uwb/umc-bus.c:33: error: implicit declaration of function 'pci_match_id'
> make[3]: *** [drivers/uwb/umc-bus.o] Error 1
> make[2]: *** [drivers/uwb] Error 2



---
~Randy
