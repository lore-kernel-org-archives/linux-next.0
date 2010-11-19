From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH -next] staging: fix winbond build, needs delay.h
Date: Fri, 19 Nov 2010 09:38:31 -0800
Message-ID: <20101119173831.GA6098@suse.de>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
 <20101119093018.340dab03.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34520 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755658Ab0KSRoK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Nov 2010 12:44:10 -0500
Content-Disposition: inline
In-Reply-To: <20101119093018.340dab03.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 19, 2010 at 09:30:18AM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> winbond drivers use msleep() and delay(), so include linux/delay.h
> in a common header file to prevent build errors.
> 
> drivers/staging/winbond/phy_calibration.c:987: error: implicit declaration of function 'msleep'
> drivers/staging/winbond/phy_calibration.c:1556: error: implicit declaration of function 'udelay'
> drivers/staging/winbond/reg.c:894: error: implicit declaration of function 'msleep'
> drivers/staging/winbond/reg.c:1178: error: implicit declaration of function 'udelay'

Is this error showing up in Linus's tree, or only in linux-next?

thanks,

greg k-h
