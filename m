From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [PATCH -next] i2c: fix xiic build error
Date: Tue, 16 Feb 2010 17:33:26 +0100
Message-ID: <20100216173326.091c1c77@hyperion.delvare>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au>
	<4B6B29DD.7060502@oracle.com>
	<4B7AC2A9.4070203@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:52240 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932350Ab0BPQd3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Feb 2010 11:33:29 -0500
In-Reply-To: <4B7AC2A9.4070203@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Randy,

On Tue, 16 Feb 2010 08:07:05 -0800, Randy Dunlap wrote:
> On 02/04/10 12:11, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Add header file to fix build error:
> > 
> > drivers/i2c/busses/i2c-xiic.c:493: error: implicit declaration of
> > function 'mdelay'
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > ---
> >  drivers/i2c/busses/i2c-xiic.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > --- linux-next-20100204.orig/drivers/i2c/busses/i2c-xiic.c
> > +++ linux-next-20100204/drivers/i2c/busses/i2c-xiic.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/errno.h>
> > +#include <linux/delay.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> > 
> 
> 
> This patch is still needed in linux-next-20100216.

Nothing I can do about it, as the i2c-xiic driver is neither upstream
nor in my tree.

-- 
Jean Delvare
