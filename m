From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH -next] extcon: extcon-arizona depends on INPUT
Date: Mon, 27 Aug 2012 08:53:50 +0900
Message-ID: <503AB70E.2000407@samsung.com>
References: <20120824172820.ee0f412d2944b08789414207@canb.auug.org.au>
 <5037B41C.6040703@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51400 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751087Ab2HZXxw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Aug 2012 19:53:52 -0400
In-reply-to: <5037B41C.6040703@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On 08/25/2012 02:04 AM, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> extcon-arizona uses input_*() functions so it should depend
> on INPUT.
> 
> ERROR: "input_event" [drivers/extcon/extcon-arizona.ko] undefined!
> ERROR: "input_free_device" [drivers/extcon/extcon-arizona.ko] undefined!
> ERROR: "input_register_device" [drivers/extcon/extcon-arizona.ko] undefined!
> ERROR: "input_set_capability" [drivers/extcon/extcon-arizona.ko] undefined!
> ERROR: "input_allocate_device" [drivers/extcon/extcon-arizona.ko] undefined!
> ERROR: "input_unregister_device" [drivers/extcon/extcon-arizona.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---

Thanks much,

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

I will apply this patch to
http://10.90.51.51/cgi-bin/gitweb.cgi?p=linux-samsung;a=shortlog;h=refs/heads/extcon-for-next
and you can check it after some hours.
