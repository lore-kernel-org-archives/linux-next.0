From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: linux-next: sh tree build warning
Date: Tue, 18 Nov 2008 12:42:06 +0900
Message-ID: <20081118034206.GA23923@linux-sh.org>
References: <20081117103446.e5c66fec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:51424 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751864AbYKRDnQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Nov 2008 22:43:16 -0500
Content-Disposition: inline
In-Reply-To: <20081117103446.e5c66fec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Magnus Damm <damm@igel.co.jp>

On Mon, Nov 17, 2008 at 10:34:46AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warning:
> 
> drivers/usb/gadget/m66592-udc.c: In function 'm66592_probe':
> drivers/usb/gadget/m66592-udc.c:1672: warning: label 'clean_up2' defined but not used
> drivers/usb/host/r8a66597-hcd.c: In function 'r8a66597_probe':
> drivers/usb/host/r8a66597-hcd.c:2401: warning: label 'clean_up2' defined but not used
> 
> Added by commit 985fc7c81c7852f2e104c71cbe913ace683c9e6a ("sh: sh_mobile
> usbf clock framework support").

Fixed, thanks.
