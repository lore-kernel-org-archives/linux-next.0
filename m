From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [TESTING] kbuild: link drivers subdirectories separately
Date: Thu, 11 Aug 2016 17:46:24 +0200
Message-ID: <3541255.WOXCFhM6uN@wuerfel>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com> <20160811231240.4ba73123@roar.ozlabs.ibm.com> <10934898.zRVpW5bs5f@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:55752 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932222AbcHKPrX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2016 11:47:23 -0400
In-Reply-To: <10934898.zRVpW5bs5f@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alan Modra <amodra@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>

On Thursday, August 11, 2016 3:49:03 PM CEST Arnd Bergmann wrote:
> @@ -137,7 +134,8 @@ obj-$(CONFIG_PPC_PS3)               += ps3/
>  obj-$(CONFIG_OF)               += of/
>  obj-$(CONFIG_SSB)              += ssb/
>  obj-$(CONFIG_BCMA)             += bcma/
> -obj-y                          += vhost/
> +obj-$(CONFIG_VHOST_RING)       += vhost/
> +obj-$(CONFIG_VHOST)            += vhost/
>  obj-$(CONFIG_VLYNQ)            += vlynq/
>  obj-$(CONFIG_STAGING)          += staging/
>  obj-y                          += platform/
> 

This hunk should have been the other way round to apply and work correctly,
I mixed up the number of reverts I had on my tree before it.

	Arnd
