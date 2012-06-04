From: Ryan Mallon <rmallon@gmail.com>
Subject: Re: Request for inclusion of ep93xx tree in linux-next
Date: Mon, 04 Jun 2012 15:52:13 +1000
Message-ID: <4FCC4D0D.8000504@gmail.com>
References: <4F9F16A9.9090108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44720 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752906Ab2FDFwU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jun 2012 01:52:20 -0400
Received: by pbbrp8 with SMTP id rp8so5532599pbb.19
        for <linux-next@vger.kernel.org>; Sun, 03 Jun 2012 22:52:19 -0700 (PDT)
In-Reply-To: <4F9F16A9.9090108@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, H Hartley Sweeten <hartleys@visionengravers.com>, Mika Westerberg <mika.westerberg@iki.fi>, Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org

Hi Stephen,

I have ended up adding another branch to my ep93xx tree, so I have
created an ep93xx-for-next branch, which I will just merge all of
branches into. Can you please drop the ep93xx-cleanup and ep93xx-fixes
branches and just include ep93xx-for-next instead.

Thanks,
~Ryan

On 01/05/12 08:48, Ryan Mallon wrote:

> Hi Stephen,
> 
> Can you please add the following branches:
> 
>   ep93xx-cleanup
>   ep93xx-fixes
> 
> from the ep93xx git tree:
> 
>   git://github.com/RyanMallon/linux-ep93xx.git
> 
> To linux-next. Both branches are stable and based on v3.4-rc2. Testing
> for the tree is covered by the arm ep93xx_defconfig.
> 
> Thanks,
> ~Ryan
