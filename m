From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath6kl: fix function name conflicts with ath9k
Date: Wed, 10 Aug 2011 10:24:23 +0300
Message-ID: <4E423227.2070404@qca.qualcomm.com>
References: <20110810122109.a81b3186e4131aba82a4cae0@canb.auug.org.au> <1312960312-7884-1-git-send-email-kvalo@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:27584 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737Ab1HJHYa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Aug 2011 03:24:30 -0400
In-Reply-To: <1312960312-7884-1-git-send-email-kvalo@qca.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org

On 08/10/2011 10:11 AM, Kalle Valo wrote:
> Stepher reported that compilation fails if both ath6kl and ath9k are
> compiled in:
> 
> drivers/net/wireless/ath/ath6kl/built-in.o: In function `htc_start':
> (.opd+0x600): multiple definition of `htc_start'
> drivers/net/wireless/ath/ath9k/built-in.o:(.opd+0x3e40): first defined here
> drivers/net/wireless/ath/ath6kl/built-in.o: In function `.htc_stop':
> (.text+0x7b40): multiple definition of `.htc_stop'
> drivers/net/wireless/ath/ath9k/built-in.o:(.text+0x67b34): first defined he=
> re
> drivers/net/wireless/ath/ath6kl/built-in.o: In function `.htc_start':
> (.text+0x7d18): multiple definition of `.htc_start'
> drivers/net/wireless/ath/ath9k/built-in.o:(.text+0x67ba0): first defined he=
> re
> drivers/net/wireless/ath/ath6kl/built-in.o: In function `htc_stop':
> (.opd+0x5e8): multiple definition of `htc_stop'
> drivers/net/wireless/ath/ath9k/built-in.o:(.opd+0x3e28): first defined here
> 
> To fix this add ath6kl prefix to all public functions in htc.c.

I have applied this to the ath6kl tree now:

http://git.kernel.org/?p=linux/kernel/git/kvalo/ath6kl.git;a=summary

I'll send a pull request to John later today.

Kalle
