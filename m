From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH -next] media:
Date: Mon, 15 Apr 2013 20:10:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304152010180.3952@chino.kir.corp.google.com>
References: <20130408174343.cc13eb1972470d20d38ecff1@canb.auug.org.au> <51630297.2040803@infradead.org> <516461FE.4020007@iki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <516461FE.4020007@iki.fi>
Sender: linux-media-owner@vger.kernel.org
To: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-next.vger.kernel.org

On Tue, 9 Apr 2013, Antti Palosaari wrote:

> On 04/08/2013 08:47 PM, Randy Dunlap wrote:
> > From: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Fix randconfig error when USB is not enabled:
> > 
> > ERROR: "usb_control_msg" [drivers/media/common/cypress_firmware.ko]
> > undefined!
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Antti Palosaari <crope@iki.fi>
> 
> Reviewed-by: Antti Palosaari <crope@iki.fi>
> 
> 
> > ---
> >   drivers/media/common/Kconfig |    1 +
> >   1 file changed, 1 insertion(+)
> > 
> > --- linux-next-20130408.orig/drivers/media/common/Kconfig
> > +++ linux-next-20130408/drivers/media/common/Kconfig
> > @@ -18,6 +18,7 @@ config VIDEO_TVEEPROM
> > 
> >   config CYPRESS_FIRMWARE
> >   	tristate "Cypress firmware helper routines"
> > +	depends on USB
> > 
> >   source "drivers/media/common/b2c2/Kconfig"
> >   source "drivers/media/common/saa7146/Kconfig"
> > 

Mauro, this problem persists in linux-next seven days later, any chance we 
can get this fix from Randy merged?
