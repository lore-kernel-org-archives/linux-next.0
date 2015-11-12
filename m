From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 12 (staging/unisys/visorinput)
Date: Thu, 12 Nov 2015 12:05:26 -0800
Message-ID: <5644F106.2030503@infradead.org>
References: <20151112130114.3418c662@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37671 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753367AbbKLUFa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2015 15:05:30 -0500
In-Reply-To: <20151112130114.3418c662@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ken Cox <jkc@redhat.com>, Ben Romer <sparmaintainer@unisys.com>

On 11/11/15 18:01, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* add any material intended for v4.5 to your linux-next
> included branches until after v4.4-rc1 has been released.
> 
> Changes since 20151111:
> 
> *cickets*
   eh??


on x86_64:

ERROR: "input_event" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_set_capability" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_set_abs_params" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_free_device" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_register_device" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_allocate_device" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!
ERROR: "input_unregister_device" [drivers/staging/unisys/visorinput/visorinput.ko] undefined!

when CONFIG_INPUT is not enabled.

Just add
	depends on INPUT
to this driver's Kconfig file.

Thanks.


-- 
~Randy
