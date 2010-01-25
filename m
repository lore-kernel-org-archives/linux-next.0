From: Tobias Klauser <tklauser@distanz.ch>
Subject: Re: linux-next: input tree build failure
Date: Mon, 25 Jan 2010 08:26:33 +0100
Message-ID: <20100125072633.GP31478@distanz.ch>
References: <20100125165219.cd0b869d.sfr@canb.auug.org.au> <20100125064602.GA22833@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752117Ab0AYH0i@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100125064602.GA22833@core.coreip.homeip.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Linn <john.linn@xilinx.com>
List-Id: linux-next.vger.kernel.org

On 2010-01-25 at 07:46:03 +0100, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> On Mon, Jan 25, 2010 at 04:52:19PM +1100, Stephen Rothwell wrote:
> > Hi Dmitry,
> > 
> > Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
> > 
> > drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_probe':
> > drivers/input/serio/xilinx_ps2.c:273: error: incompatible type for argument 1 of 'resource_size'
> > include/linux/ioport.h:132: note: expected 'const struct resource *' but argument is of type 'struct resource'
> > drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_remove':
> > drivers/input/serio/xilinx_ps2.c:347: error: incompatible type for argument 1 of 'resource_size'
> > include/linux/ioport.h:132: note: expected 'const struct resource *' but argument is of type 'struct resource'
> > 
> > Please at least build test this stuff ...
> > 
> > Caused by commit cc7bbfa322b48be82b1c86a104433d4ac349da79 ("Input:
> > xilinx_ps2 - use resource_size").
> > 
> > I have reverted that commit for today.
> > 
> 
> Argh, sorry about that. I adjusted the commit; John, Tobias, please
> verify (next branch in my tree).

Sorry, that was completely my fault. I didn't have the appropriate build
environment to at least build test it.

The adjusted commit looks fine to me.

Sorry again,
Tobias
