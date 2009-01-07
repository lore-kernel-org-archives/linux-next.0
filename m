From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Subject: Re: linux-next: Tree for January 7 (wimax: more)
Date: Wed, 7 Jan 2009 10:51:22 -0800
Message-ID: <200901071051.23010.inaky@linux.intel.com>
References: <20090107170646.8d44292b.sfr@canb.auug.org.au> <4964EDE6.5090902@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:50776 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751865AbZAGSvk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 13:51:40 -0500
In-Reply-To: <4964EDE6.5090902@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: wimax@linuxwimax.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wimax@intel.com

On Wednesday 07 January 2009, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> >
> > The powerpc ppc44x_defconfig builds again.
> >
> > Changes since 20090106:
>
> drivers/net/wimax/i2400m/usb.c:403: error: 'struct usb_device' has no
> member named 'autosuspend_delay' drivers/net/wimax/i2400m/usb.c:404: error:
> 'struct usb_device' has no member named 'autosuspend_disabled'
> drivers/net/wimax/i2400m/usb.c:506: error: 'struct usb_device' has no
> member named 'auto_pm'

Fix on the way -- need #ifdef CONFIG_PMs in a few parts.

-- 
Inaky
