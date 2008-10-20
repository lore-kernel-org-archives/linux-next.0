From: "Lee Howard" <lee.howard@mainpine.com>
Subject: RE: linux-next: ttydev tree build failure
Date: Mon, 20 Oct 2008 14:48:41 -0700
Message-ID: <3F54F8F6E95741F79C6C6AE19D9208AD@callisto>
References: <20081020190600.65a8b298.sfr@canb.auug.org.au>
Reply-To: <lee.howard@mainpine.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.mainpine.com ([66.119.206.114]:39730 "EHLO
	mail.mainpine.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295AbYJTV6a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 17:58:30 -0400
In-Reply-To: <20081020190600.65a8b298.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Alan Cox' <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

Do I need to rewrite the patches that I submitted?  I made them against
2.6.26 and I built with the patches many times, and I run systems with it,
too.

Thanks,

Lee. 


Lee Howard
Mainpine, Inc. Software Development Lead
Tel: +1 866 363 6680 ext 805 | Fax: +1 360 462 8160
lee.howard@mainpine.com | www.mainpine.com

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Monday, October 20, 2008 1:06 AM
To: Alan Cox
Cc: linux-next@vger.kernel.org; Lee Howard
Subject: linux-next: ttydev tree build failure

Hi Alan,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/serial/8250_pci.c: In function 'pci_oxsemi_tornado_init':
drivers/serial/8250_pci.c:1869: error: 'PCI_VENDOR_OXSEMI' undeclared (first
use in this function)
drivers/serial/8250_pci.c: In function 'pciserial_init_ports':
drivers/serial/8250_pci.c:1903: error: expected ')' before
'pci_oxsemi_tornado_init'
drivers/serial/8250_pci.c:1969: error: expected expression before '}' token

Caused by commit fd13cafdcc95c68e9ea3af4ea1d629abeac55638
("8250-oxsemi-mainpine") which was clearly never even built!  :-(

I reverted it (I shouldn't have to fix simple typos).
--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
