From: "Arend van Spriel" <arend@broadcom.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (wireless-next tree related)
Date: Thu, 21 Jun 2012 10:59:52 +0200
Message-ID: <4FE2E288.2000201@broadcom.com>
References: <20120621155911.713748370d898a113e054693@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:1644 "EHLO mms3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758934Ab2FUJAF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jun 2012 05:00:05 -0400
In-Reply-To: <20120621155911.713748370d898a113e054693@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>

On 06/21/2012 07:59 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc 
> allyesconfig) failed like this:
> 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c: In function
> 'brcmf_sdio_dump_console': 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c:3085:3: error:
> implicit declaration of function 'vzalloc'
> [-Werror=implicit-function-declaration] 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c:3085:10:
> warning: assignment makes pointer from integer without a cast
> [enabled by default] 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c:3113:2: error:
> implicit declaration of function 'vfree'
> [-Werror=implicit-function-declaration]
> 
> Caused by commit 4fc0d0160d59 ("brcmfmac: introduce checkdied
> debugfs functionality") from the wireless-next tree. Forgot to
> include vmalloc.h ?
> 
> I have reverted that commit for today.

Hi Stephen,

We have setup a mailing list brcm80211-dev-list@broadcom.com for
reporting driver issues to make sure the right people are informed
regardless organizational changes. Feel free to use that as needed.

Gr. AvS
