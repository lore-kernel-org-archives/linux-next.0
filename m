From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next-20081120 - staging - asus_oled device build fails
	with !CONFIG_USB_SUPPORT
Date: Fri, 21 Nov 2008 11:02:47 -0800
Message-ID: <20081121190247.GE31017@suse.de>
References: <20081120212907.efc2276b.sfr@canb.auug.org.au> <20081120170927.GB4821@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:60786 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757553AbYKUTrl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Nov 2008 14:47:41 -0500
Content-Disposition: inline
In-Reply-To: <20081120170927.GB4821@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sjakub@gmail.com

On Thu, Nov 20, 2008 at 10:39:27PM +0530, Kamalesh Babulal wrote:
> Hi Stephen,
> 
> 	next-2001120 kernel randconfig build fails with build failure
> drivers/built-in.o: In function `enable_oled':
> asus_oled.c:(.text+0x170d26): undefined reference to `usb_bulk_msg'
> drivers/built-in.o: In function `send_packet':
> asus_oled.c:(.text+0x170e5e): undefined reference to `usb_bulk_msg'
> drivers/built-in.o: In function `send_packets':
> asus_oled.c:(.text+0x170fd4): undefined reference to `usb_bulk_msg'
> drivers/built-in.o: In function `asus_oled_disconnect':
> asus_oled.c:(.text+0x171761): undefined reference to `usb_put_dev'
> drivers/built-in.o: In function `asus_oled_probe':
> asus_oled.c:(.text+0x17189f): undefined reference to `usb_get_dev'
> asus_oled.c:(.text+0x171a4c): undefined reference to `usb_put_dev'
> drivers/built-in.o: In function `asus_oled_init':
> asus_oled.c:(.init.text+0xdabe): undefined reference to `usb_register_driver'
> drivers/built-in.o: In function `asus_oled_exit':
> asus_oled.c:(.exit.text+0x2281): undefined reference to `usb_deregister'
> 
> asus_oled depends on the CONFIG_USB_SUPPORT, I have only build tested
> the patch.

Looks correct, thanks for the patch.

greg k-h
