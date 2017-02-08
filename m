From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 8 Feb 2017 10:05:03 +0100
Message-ID: <20170208100503.375ab31a@bbrezillon>
References: <20170208161113.1b597c01@canb.auug.org.au>
        <20170208084854.qrxnbrtdnbxefwpg@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208084854.qrxnbrtdnbxefwpg@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 8 Feb 2017 08:48:54 +0000
Lee Jones <lee.jones@linaro.org> wrote:

> On Wed, 08 Feb 2017, Stephen Rothwell wrote:
> 
> > Hi Linus,  
> 
> I believe this patch would need to go in via Greg's tree.
> 
> (see below)
> 
> > After merging the gpio tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/tty/serial/st-asc.c: In function 'asc_set_termios':
> > drivers/tty/serial/st-asc.c:578:12: error: implicit declaration of function 'devm_get_gpiod_from_child' [-Werror=implicit-function-declaration]
> >     gpiod = devm_get_gpiod_from_child(port->dev, "rts",
> >             ^
> > drivers/tty/serial/st-asc.c:578:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
> >     gpiod = devm_get_gpiod_from_child(port->dev, "rts",
> >           ^
> > 
> > Caused by commits
> > 
> >   a264d10ff45c ("gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO")
> >   b2987d7438e0 ("gpio: Pass GPIO label down to gpiod_request")
> >   4b0947974e59 ("gpio: Rename devm_get_gpiod_from_child()")
> > 
> > interacting with commit
> > 
> >   d7356256488c ("serial: st-asc: (De)Register GPIOD and swap Pinctrl profiles")
> > 
> > from the tty tree.
> > 
> > I applied the following merge fix patch (I guessed about the new arguments):
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 8 Feb 2017 15:50:22 +1100
> > Subject: [PATCH] serial: st-asc: merge fix for devm_get_gpiod_from_child rename
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/tty/serial/st-asc.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
> > index bcf1d33e6ffe..c02e6b089364 100644
> > --- a/drivers/tty/serial/st-asc.c
> > +++ b/drivers/tty/serial/st-asc.c
> > @@ -575,8 +575,11 @@ static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
> >  			pinctrl_select_state(ascport->pinctrl,
> >  					     ascport->states[NO_HW_FLOWCTRL]);
> >  
> > -			gpiod =	devm_get_gpiod_from_child(port->dev, "rts",
> > -							  &np->fwnode);
> > +			gpiod =	devm_fwnode_get_gpiod_from_child(port->dev,
> > +								 "rts",
> > +								 &np->fwnode,
> > +								 GPIOD_IN,  
> 
> GPIOD_OUT

I think it should be GPIOD_OUT_LOW ...

> 
> > +								 np->name);
> >  			if (!IS_ERR(gpiod)) {
> >  				gpiod_direction_output(gpiod, 0);

... and you should drop this call to gpiod_direction_output().

> >  				ascport->rts = gpiod;  
> 
