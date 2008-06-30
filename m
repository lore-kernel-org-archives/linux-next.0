From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 30 (USB: cdc-acm)
Date: Mon, 30 Jun 2008 11:43:32 -0700
Message-ID: <20080630114332.b797e5e4.randy.dunlap@oracle.com>
References: <20080701001656.e156585c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:14383 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbYF3SoN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 14:44:13 -0400
In-Reply-To: <20080701001656.e156585c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, greg@kroah.com

cdc-acm fails to build when CONFIG_PM=n:

linux-next-20080630/drivers/usb/class/cdc-acm.c: In function 'acm_suspend':
linux-next-20080630/drivers/usb/class/cdc-acm.c:1263: error: 'struct usb_device' has no member named 'auto_pm'
make[4]: *** [drivers/usb/class/cdc-acm.o] Error 1

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
