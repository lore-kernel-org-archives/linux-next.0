From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH -next] bcma: main.c and driver_mips.c need linux/export.h
Date: Wed, 21 Sep 2011 16:42:07 -0500
Message-ID: <4E7A5A2F.7030402@lwfinger.net>
References: <20110920173102.d38155c7defbbc29beaae7c0@canb.auug.org.au>	<4E78CFC0.4020003@xenotime.net>	<CACna6rxGrd-ORWZrc0xsAOKptU_Xj3eGh9qSfX9vJYCPTZrCRg@mail.gmail.com>	<4E78FCDB.1010002@xenotime.net>	<CACna6rywFitSNkkwo6tNy887vdsoyHG5Cadk6Bb8_qBJ+gc42w@mail.gmail.com>	<4E7A084C.3000304@xenotime.net> <CACna6ryNw+YgTiO5dBSGcTfUabM_yO0LaSsbGpC_X6JrQudnBQ@mail.gmail.com> <4E7A521B.50104@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:56790 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab1IUVmN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2011 17:42:13 -0400
In-Reply-To: <4E7A521B.50104@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 09/21/2011 04:07 PM, Randy Dunlap wrote:
> From: Randy Dunlap<rdunlap@xenotime.net>
>
> main.c and driver_mips.c use EXPORT_SYMBOL() etc.
> so they should include<linux/export.h>.
>
> Signed-off-by: Randy Dunlap<rdunlap@xenotime.net>

 From this commit message, it appears that every routine that uses 
EXPORT_SYMBOL() will need to include this header. I looked at modifying rtlwifi 
and friends to include this header, but found that include/linux/export.h does 
not exist in any of my source trees. From that I assume that the change will 
happen in 3.2.

I have prepared a patch, but cannot use it at the moment. Is there somewhere 
that I should send it?

Larry
