From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Wed, 6 Mar 2013 08:43:41 +0800
Message-ID: <20130306004341.GA28426@kroah.com>
References: <20130306113508.9c868be103b6b140295c548f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35303 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754668Ab3CFAnR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Mar 2013 19:43:17 -0500
Content-Disposition: inline
In-Reply-To: <20130306113508.9c868be103b6b140295c548f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

On Wed, Mar 06, 2013 at 11:35:08AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/staging/zcache/debug.c:2:0:
> drivers/staging/zcache/debug.h: In function 'dec_zcache_obj_count':
> drivers/staging/zcache/debug.h:16:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
> 
> Caused by commit 95bdaee2140e ("zcache: Move debugfs code out of
> zcache-main.c file").
> 
> I applied this patch for today:
> 
> From 24b03cf426007c4e94c6bed81560e436afcc136c Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Mar 2013 11:31:06 +1100
> Subject: [PATCH] disable ZCACHE_DEBUG due to build error
> 
> In file included from drivers/staging/zcache/debug.c:2:0:
> drivers/staging/zcache/debug.h: In function 'dec_zcache_obj_count':
> drivers/staging/zcache/debug.h:16:2: error: implicit declaration of function 'BUG_ON' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/zcache/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Ick, sorry about that, I've applied your patch to my tree.

thanks,

greg k-h
