From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: RE: linux-next: Tree for Jul 15 (usb gadget and rdnis)
Date: Tue, 16 Jul 2013 10:51:51 +0200
Message-ID: <003301ce8201$b785f1f0$2691d5d0$%p@samsung.com>
References: <20130715134528.8e4977b2c2623d749d23d5ab@canb.auug.org.au>
 <51E41B37.6080801@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12205 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196Ab3GPIwB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Jul 2013 04:52:01 -0400
In-reply-to: <51E41B37.6080801@infradead.org>
Content-language: pl
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Randy Dunlap' <rdunlap@infradead.org>, 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'USB list' <linux-usb@vger.kernel.org>

Hello, 

On Monday, July 15, 2013 5:55 PM Randy Dunlap wrote:

> On 07/14/13 20:45, Stephen Rothwell wrote:
> > Hi all,
> >
> > The merge window is closed.  Time to clean up all those unclean trees.
> > The good among you can just fast forward to v3.11-rc1 ;-)
> >
> > Changes since 20130712:
> >
> 
> on x86_64:
> 
> ERROR: "rndis_msg_parser" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_signal_disconnect" [drivers/usb/gadget/usb_f_rndis.ko]
> undefined!
> ERROR: "rndis_get_next_response" [drivers/usb/gadget/usb_f_rndis.ko]
> undefined!
> ERROR: "rndis_signal_connect" [drivers/usb/gadget/usb_f_rndis.ko]
> undefined!
> ERROR: "rndis_set_param_vendor" [drivers/usb/gadget/usb_f_rndis.ko]
> undefined!
> ERROR: "rndis_register" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_uninit" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_deregister" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_rm_hdr" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_free_response" [drivers/usb/gadget/usb_f_rndis.ko]
undefined!
> ERROR: "rndis_add_hdr" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_set_host_mac" [drivers/usb/gadget/usb_f_rndis.ko] undefined!
> ERROR: "rndis_set_param_medium" [drivers/usb/gadget/usb_f_rndis.ko]
> undefined!
> ERROR: "rndis_set_param_dev" [drivers/usb/gadget/usb_f_rndis.ko]
undefined!
> 
> 
> Full randconfig file is attached.
> 
> 

There is a patch for that:

http://www.mail-archive.com/linux-usb@vger.kernel.org/msg24015.html

Andrzej
