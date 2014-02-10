From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Sun, 9 Feb 2014 21:04:06 -0800
Message-ID: <20140210050406.GA15517@kroah.com>
References: <20140210155412.d42b2dda36feac3e9c8733fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37310 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751108AbaBJFCJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Feb 2014 00:02:09 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 74E6C20A12
	for <linux-next@vger.kernel.org>; Mon, 10 Feb 2014 00:02:07 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20140210155412.d42b2dda36feac3e9c8733fe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

On Mon, Feb 10, 2014 at 03:54:12PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/staging/rtl8188eu/core/rtw_mlme.c: In function '_rtw_init_mlme_priv':
> drivers/staging/rtl8188eu/core/rtw_mlme.c:65:2: error: implicit declaration of function 'vzalloc' [-Werror=implicit-function-declaration]
>   pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
>   ^

<snip>

Sorry about that.  Larry sent me a patch for this Friday evening and I
haven't had the chance to add it to my tree just yet.  Sorry for the
noise.

greg k-h
