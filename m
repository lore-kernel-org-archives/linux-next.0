From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Thu, 9 Feb 2017 08:21:50 +0000
Message-ID: <20170209082150.m7u53pxz6evt5ckh@dell>
References: <20170208161113.1b597c01@canb.auug.org.au>
 <20170208092425.azqkx3nwf4jhsfz5@dell>
 <20170208130039.GA28327@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:35958 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751645AbdBIIVz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2017 03:21:55 -0500
Received: by mail-wr0-f175.google.com with SMTP id k90so77790747wrc.3
        for <linux-next@vger.kernel.org>; Thu, 09 Feb 2017 00:21:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170208130039.GA28327@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Wed, 08 Feb 2017, Greg KH wrote:

> On Wed, Feb 08, 2017 at 09:24:25AM +0000, Lee Jones wrote:
> > The commits mentioned below adapt the GPIO API to allow more information
> > to be passed directly through devm_get_gpiod_from_child() in the first
> > instance.  This facilitates the removal of subsequent calls, such as
> > gpiod_direction_output().  This patch firstly moves to utilise the new
> > API and secondly removes the now superfluous call do set the direction.
> > 
> > Fixes: a264d10ff45c ("gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO")
> > Fixes: b2987d7438e0 ("gpio: Pass GPIO label down to gpiod_request")
> > Fixes: 4b0947974e59 ("gpio: Rename devm_get_gpiod_from_child()")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/tty/serial/st-asc.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
> > index bcf1d33..c334bcc 100644
> > --- a/drivers/tty/serial/st-asc.c
> > +++ b/drivers/tty/serial/st-asc.c
> > @@ -575,12 +575,13 @@ static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
> >  			pinctrl_select_state(ascport->pinctrl,
> >  					     ascport->states[NO_HW_FLOWCTRL]);
> >  
> > -			gpiod =	devm_get_gpiod_from_child(port->dev, "rts",
> > -							  &np->fwnode);
> > -			if (!IS_ERR(gpiod)) {
> > -				gpiod_direction_output(gpiod, 0);
> > +			gpiod = devm_fwnode_get_gpiod_from_child(port->dev,
> > +								 "rts",
> > +								 &np->fwnode,
> > +								 GPIOD_OUT_LOW,
> > +								 np->name);
> 
> I can't apply this :(
> 
> Usually, when you move apis around, you add it, then convert it, wait a
> kernel release, then remove the old one.  That allows for issues like
> this when new code is added in one maintainer's branch but not yours.
> 
> So how about reverting your "drop the function" patch and then wait for
> -rc2 to really remove it?

I assume this is a question for LinusW?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
