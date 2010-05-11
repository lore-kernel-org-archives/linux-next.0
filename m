From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: [PATCH -next] gadget: f_fs.c needs to include pagemap.h
Date: Tue, 11 May 2010 12:02:03 +0200
Message-ID: <op.vcjctphf7p4s8u@pikus>
References: <20100510160234.54f76c0a.sfr@canb.auug.org.au>
 <20100510105136.eee3e58a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29244 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757719Ab0EKKBj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2010 06:01:39 -0400
In-reply-to: <20100510105136.eee3e58a.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>

On Mon, 10 May 2010 19:51:36 +0200, Randy Dunlap <randy.dunlap@oracle.c=
om> wrote:
> Fix g_ffs build error, add a needed header file:
>
> drivers/usb/gadget/f_fs.c:1064:error: 'PAGE_CACHE_SIZE' undeclared (f=
irst use in this function)
> drivers/usb/gadget/f_fs.c:1065:error: 'PAGE_CACHE_SHIFT' undeclared (=
first use in this function)

> --- linux-next-20100510.orig/drivers/usb/gadget/f_fs.c
> +++ linux-next-20100510/drivers/usb/gadget/f_fs.c
> @@ -28,6 +28,7 @@
>  /* #define VERBOSE_DEBUG */
> #include <linux/blkdev.h>
> +#include <linux/pagemap.h>
>  #include <asm/unaligned.h>
>  #include <linux/smp_lock.h>

Needles to say, this looks reasonable.

--=20
Best regards,                                        _     _
| Humble Liege of Serenely Enlightened Majesty of  o' \,=3D./ `o
| Computer Science,  Micha=C5=82 "mina86" Nazarewicz       (o o)
+----[mina86*mina86.com]---[mina86*jabber.org]----ooO--(_)--Ooo--
