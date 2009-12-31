From: =?ISO-8859-1?Q?Ren=E9_Bolldorf?= <xsecute@googlemail.com>
Subject: Re: linux-next: wireless tree build warnings
Date: Thu, 31 Dec 2009 01:56:49 +0100
Message-ID: <4B3BF6D1.6010209@googlemail.com>
References: <20091231105709.c50f22c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:43372 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735AbZLaA4y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Dec 2009 19:56:54 -0500
In-Reply-To: <20091231105709.c50f22c0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/31/09 00:57, Stephen Rothwell wrote:
> Hi John,
>
> Today's linux-next build (i386 defconfig) produced thes warnings:
>
> net/mac80211/work.c: In function 'ieee80211_remain_on_channel_timeout':
> net/mac80211/work.c:534: warning: cast from pointer to integer of different size
> net/mac80211/work.c: In function 'ieee80211_remain_done':
> net/mac80211/work.c:1030: warning: cast from pointer to integer of different size
> net/mac80211/work.c: In function 'ieee80211_wk_remain_on_channel':
> net/mac80211/work.c:1056: warning: cast from pointer to integer of different size
> net/mac80211/work.c: In function 'ieee80211_wk_cancel_remain_on_channel':
> net/mac80211/work.c:1072: warning: cast from pointer to integer of different size
>
> Introduced by commits e4da8c37af626001ff704fb29ea14eb58f5f7208
> ("mac80211: make off-channel work generic") and
> b8bc4b0aa9bfba755c64b11b8f60e6cfab25dc9d ("mac80211: support
> remain-on-channel command").
>

Hi,
shouldn't it be u32 instead of u64? Please correct me if I'am wrong.

Example:
cfg80211_ready_on_channel(wk->sdata->dev, (u32)wk, wk->chan,
		wk->chan_type, wk->remain.duration, GFP_KERNEL);
instead of:
cfg80211_ready_on_channel(wk->sdata->dev, (u64)wk, wk->chan,
		wk->chan_type, wk->remain.duration, GFP_KERNEL);

I wish you all a happy new year!
