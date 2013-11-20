From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 20 (usb/gadget/storage_common.c)
Date: Wed, 20 Nov 2013 10:34:04 -0800
Message-ID: <528D009C.8020507@infradead.org>
References: <20131120132847.9321fab265bc5cb0a117c61e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:51253 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754477Ab3KTSeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2013 13:34:06 -0500
In-Reply-To: <20131120132847.9321fab265bc5cb0a117c61e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>

On 11/19/13 18:28, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* add any v3.14 material to linux-next until after
> v3.13-rc1 is released.
> 
> Changes since 20131119:
> 

on x86_64:
when CONFIG_BLOCK is not enabled:

drivers/usb/gadget/storage_common.c: In function 'fsg_lun_open':
drivers/usb/gadget/storage_common.c:241:3: error: implicit declaration of function 'bdev_logical_block_size' [-Werror=implicit-function-declaration]
drivers/usb/gadget/storage_common.c:242:3: error: implicit declaration of function 'blksize_bits' [-Werror=implicit-function-declaration]



-- 
~Randy
