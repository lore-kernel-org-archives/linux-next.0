From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH -next] staging: fix winbond build, needs delay.h
Date: Fri, 19 Nov 2010 18:37:32 +0100
Message-ID: <20101119173731.GA25098@elf.ucw.cz>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
 <20101119093018.340dab03.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ksp.mff.cuni.cz ([195.113.26.206]:57394 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754194Ab0KSRfi (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Nov 2010 12:35:38 -0500
Content-Disposition: inline
In-Reply-To: <20101119093018.340dab03.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri 2010-11-19 09:30:18, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> winbond drivers use msleep() and delay(), so include linux/delay.h
> in a common header file to prevent build errors.
> 
> drivers/staging/winbond/phy_calibration.c:987: error: implicit declaration of function 'msleep'
> drivers/staging/winbond/phy_calibration.c:1556: error: implicit declaration of function 'udelay'
> drivers/staging/winbond/reg.c:894: error: implicit declaration of function 'msleep'
> drivers/staging/winbond/reg.c:1178: error: implicit declaration of function 'udelay'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Ack.

> ---
>  drivers/staging/winbond/sysdef.h |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- linux-next-20101119.orig/drivers/staging/winbond/sysdef.h
> +++ linux-next-20101119/drivers/staging/winbond/sysdef.h
> @@ -2,6 +2,9 @@
>  
>  #ifndef SYS_DEF_H
>  #define SYS_DEF_H
> +
> +#include <linux/delay.h>
> +
>  #define WB_LINUX
>  #define WB_LINUX_WPA_PSK
>  

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
