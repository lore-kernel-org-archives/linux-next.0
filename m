From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Wed, 8 Feb 2017 18:47:59 +0100
Message-ID: <20170208174759.GA4773@kroah.com>
References: <201702082123.rT1uJnvr%fengguang.wu@intel.com>
 <1486571470.2133.404.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486571470.2133.404.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kbuild test robot <lkp@intel.com>, Lee Jones <lee.jones@linaro.org>, kbuild-all@01.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 08, 2017 at 06:31:10PM +0200, Andy Shevchenko wrote:
> On Wed, 2017-02-08 at 21:48 +0800, kbuild test robot wrote:
> > Hi Lee,
> > 
> > [auto build test ERROR on tty/tty-testing]
> > [cannot apply to v4.10-rc7 next-20170208]
> > [if your patch is applied to the wrong git tree, please drop us a note
> > to help improve the system]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Lee-Jones/serial-st-a
> > sc-Use-new-GPIOD-API-to-obtain-RTS-pin/20170208-180609
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
> >  tty-testing
> > config: x86_64-allmodconfig (attached as .config)
> > compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> > reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64 
> > 
> 
> It requires to have immutable branch in one of the subsystem which the
> other one can pull.

Which sucks, and is why you should not do api changes this way!

greg k-h
