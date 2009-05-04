From: Kalle Valo <kalle.valo@nokia.com>
Subject: Re: linux-next: wireless tree build warning
Date: Mon, 04 May 2009 09:48:49 +0300
Message-ID: <87y6tdbbxq.fsf@nokia.com>
References: <20090501133539.5fc53f8a.sfr@canb.auug.org.au>
	<20090501123339.GA4917@hash.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:46015 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753410AbZEDGtx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 02:49:53 -0400
In-Reply-To: <20090501123339.GA4917@hash.localnet> (ext Bob Copeland's message of "Fri\, 1 May 2009 14\:33\:39 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Bob Copeland <me@bobcopeland.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

ext Bob Copeland <me@bobcopeland.com> writes:

> On Fri, May 01, 2009 at 01:35:39PM +1000, Stephen Rothwell wrote:
>> Hi John,
>> 
>> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
>
> Thanks -- John, this should fix:
>
> From 2c6ef7ec3a3b46601597615cf9e40b2a0c9f2f72 Mon Sep 17 00:00:00 2001
> From: Bob Copeland <bob@hash.(none)>
> Date: Fri, 1 May 2009 08:20:07 -0400
> Subject: [PATCH] wl12xx: correct printk format warnings
>
> Fixes warnings:
>   drivers/net/wireless/wl12xx/main.c:87: warning: int format, different
>     type arg (arg 2)
>   drivers/net/wireless/wl12xx/main.c: In function `wl12xx_fetch_nvs':
>   drivers/net/wireless/wl12xx/main.c:125: warning: int format, different
>     type arg (arg 2)
>   drivers/net/wireless/wl12xx/wl1251.c: In function 'wl1251_upload_firmware':
>   drivers/net/wireless/wl12xx/wl1251.c:94: warning: int format, different
>     type arg (arg 2)
>   drivers/net/wireless/wl12xx/wl1251.c:141: warning: int format, different
>     type arg (arg 2)
>
> Signed-off-by: Bob Copeland <me@bobcopeland.com>

Thanks.

Acked-by: Kalle Valo <kalle.valo@nokia.com>

-- 
Kalle Valo
