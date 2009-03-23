From: Janne Grunau <j@jannau.net>
Subject: Re: linux-next: Tree for March 23 (media/video/hdpvr)
Date: Mon, 23 Mar 2009 22:19:43 +0100
Message-ID: <20090323211943.GC5079@aniel>
References: <20090323205454.d0cbf721.sfr@canb.auug.org.au> <49C7D965.5080202@oracle.com> <20090323204940.GA5079@aniel> <200903232204.15457.hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200903232204.15457.hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 23, 2009 at 10:04:15PM +0100, Hans Verkuil wrote:
> On Monday 23 March 2009 21:49:40 Janne Grunau wrote:
> > 
> > diff --git a/drivers/media/video/hdpvr/hdpvr-core.c
> > b/drivers/media/video/hdpvr/hdpvr-core.c index e7300b5..dadb2e7 100644
> > --- a/drivers/media/video/hdpvr/hdpvr-core.c
> > +++ b/drivers/media/video/hdpvr/hdpvr-core.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/usb.h>
> >  #include <linux/mutex.h>
> >  #include <linux/i2c.h>
> > +#include <linux/autoconf.h>
> >
> >  #include <linux/videodev2.h>
> >  #include <media/v4l2-dev.h>
> 
> Don't include autoconf.h! It's preloaded for you already and shouldn't be
> included manually. Esp. since the v4l-dvb tree creates and preloads a custom
> version. Loading it manually will overwrite that.
> 
> Other than that it's fine.

Thanks Hans,

fixed in the patch sent to Mauro.

Janne
