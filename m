From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: RE: linux-next: build failure after merge of the mmc tree
Date: Tue, 22 Apr 2014 13:57:04 +0900
Message-ID: <001001cf5de7$4e3728a0$eaa579e0$%jun@samsung.com>
References: <20140422130655.51daec1807bde98ade65d691@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27614 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890AbaDVE5H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Apr 2014 00:57:07 -0400
In-reply-to: <20140422130655.51daec1807bde98ade65d691@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>, 'Chris Ball' <chris@printf.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jaehoon Chung' <jh80.chung@samsung.com>, 'Ulf Hansson' <ulf.hansson@linaro.org>

On Tue, April 22, 2014, Stephen Rothwell wrote:
> Hi Chris,
> 
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/net/wireless/rsi/rsi_91x_sdio.c: In function 'rsi_reset_card':
> drivers/net/wireless/rsi/rsi_91x_sdio.c:288:20: error: 'MMC_STATE_HIGHSPEED' undeclared (first use in
> this function)
>     card->state &= ~MMC_STATE_HIGHSPEED;
>                     ^
> drivers/net/wireless/rsi/rsi_91x_sdio.c:288:20: note: each undeclared identifier is reported only once
> for each function it appears in
> drivers/net/wireless/rsi/rsi_91x_sdio.c:299:4: error: implicit declaration of function
> 'mmc_card_set_highspeed' [-Werror=implicit-function-declaration]
>     mmc_card_set_highspeed(card);
>     ^
> drivers/net/wireless/rsi/rsi_91x_sdio.c:306:2: error: implicit declaration of function
> 'mmc_card_highspeed' [-Werror=implicit-function-declaration]
>   if (mmc_card_highspeed(card))
>   ^
> 
> Caused by commit 395784826a81 ("mmc: drop the speed mode of card's state").
> 
> I have used the version of the mmc tree from next-20140417 for today.

I didn't detect usage out of mmc-sub for that.
Let me fix and send a patch.

Thanks,
Seungwon Jeon

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
