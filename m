From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: linux-next: Tree for Oct 31 (ehci, dbgp)
Date: Thu, 01 Nov 2012 19:46:52 +0000
Message-ID: <5092D1AC020000780008EB60@nat28.tlf.novell.com>
References: <509199A5.1090109@infradead.org>
 <Pine.LNX.4.44L0.1211011120230.1762-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:44322 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933652Ab2KATq4 convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-next@vger.kernel.org:4:2>);
	Thu, 1 Nov 2012 15:46:56 -0400
In-Reply-To: <Pine.LNX.4.44L0.1211011120230.1762-100000@iolanthe.rowland.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdunlap@infradead.org, stern@rowland.harvard.edu
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

>>> Alan Stern <stern@rowland.harvard.edu> 11/01/12 4:28 PM >>>
>On Wed, 31 Oct 2012, Randy Dunlap wrote:
>> on x86_64:
>> 
>> drivers/built-in.o: In function `ehci_reset':
>> host.c:(.text+0x542a7e): undefined reference to `dbgp_reset_prep'
>> host.c:(.text+0x542b75): undefined reference to `dbgp_external_startup'
>> drivers/built-in.o: In function `ehci_bus_resume':
>> host.c:(.text+0x544705): undefined reference to `dbgp_reset_prep'
>> host.c:(.text+0x544731): undefined reference to `dbgp_external_startup'
>
>We all forgot about the chipidea driver.  It includes code from 

I didn't even know of this.

>ehci-hcd in a rather unorthodox manner (see 
>drivers/usb/chipidea/host.c).
>
>Evidently we need to change your new test in
>drivers/usb/early/ehci-dbgp.c to:
>
>#if IS_ENABLED(CONFIG_USB_HCD_EHCI) || defined(CONFIG_USB_CHIPIDEA_HOST)
>
>Upcoming changes to ehci-hcd will make this unnecessary in 3.8, but for 
>now we need it.

Which tells me that the CONFIG_USB_SUPPORT version would have been
the better one  (and I would favor that over the ugly variant you suggest
above).

Jan
