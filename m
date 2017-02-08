From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Thu, 9 Feb 2017 08:24:39 +1100
Message-ID: <20170209082439.25b5b337@canb.auug.org.au>
References: <201702082123.rT1uJnvr%fengguang.wu@intel.com>
        <1486571470.2133.404.camel@linux.intel.com>
        <20170208174759.GA4773@kroah.com>
        <1486582967.2133.415.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486582967.2133.415.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <greg@kroah.com>, kbuild test robot <lkp@intel.com>, Lee Jones <lee.jones@linaro.org>, kbuild-all@01.org, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 08 Feb 2017 21:42:47 +0200 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, 2017-02-08 at 18:47 +0100, Greg KH wrote:
> > On Wed, Feb 08, 2017 at 06:31:10PM +0200, Andy Shevchenko wrote:  
> > > 
> > > It requires to have immutable branch in one of the subsystem which
> > > the
> > > other one can pull.  
> > 
> > Which sucks, and is why you should not do api changes this way!  
> 
> Not only me :-)
> 
> If above will not work we may do something like below for this cycle:
> 
> static inline ... devm_get_gpiod_from_child()
> {
>  return devm_fwnode_get_gpiod_from_child(..., GPIO_AS_IS, "?");
> }
> 
> in GPIO tree.

I will use Lee's patch as a merge resolution when I merge the gpio
tree (as that is later in my list) from now on.  All that has to happen
now is that whichever tree is merged last by Linus (Torvalds) has to
have this same merge resolution applied.

In general, it is better if API changes can be done either as Greg
suggested or with a separate immutable topic branch merged into
whichever trees need it, but it doesn't happen that way very often, so
this is what we generally do.

-- 
Cheers,
Stephen Rothwell
