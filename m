From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] serial: st-asc: Use new GPIOD API to obtain RTS pin
Date: Wed, 08 Feb 2017 18:31:10 +0200
Message-ID: <1486571470.2133.404.camel@linux.intel.com>
References: <201702082123.rT1uJnvr%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201702082123.rT1uJnvr%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: kbuild-all@01.org, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2017-02-08 at 21:48 +0800, kbuild test robot wrote:
> Hi Lee,
> 
> [auto build test ERROR on tty/tty-testing]
> [cannot apply to v4.10-rc7 next-20170208]
> [if your patch is applied to the wrong git tree, please drop us a note
> to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Lee-Jones/serial-st-a
> sc-Use-new-GPIOD-API-to-obtain-RTS-pin/20170208-180609
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
>  tty-testing
> config: x86_64-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 

It requires to have immutable branch in one of the subsystem which the
other one can pull.

> All errors (new ones prefixed by >>):
> 
>    drivers/tty/serial/st-asc.c: In function 'asc_set_termios':
> > > drivers/tty/serial/st-asc.c:578:12: error: implicit declaration of
> > > function 'devm_fwnode_get_gpiod_from_child' [-Werror=implicit-
> > > function-declaration]
> 
>        gpiod = devm_fwnode_get_gpiod_from_child(port->dev,
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/tty/serial/st-asc.c:578:10: warning: assignment makes
> pointer from integer without a cast [-Wint-conversion]
>        gpiod = devm_fwnode_get_gpiod_from_child(port->dev,
>              ^
>    cc1: some warnings being treated as errors
> 
> vim +/devm_fwnode_get_gpiod_from_child +578 drivers/tty/serial/st-
> asc.c
> 
>    572		} else {
>    573			/* If flow-control disabled, it's safe
> to handle RTS manually */
>    574			if (!ascport->rts && ascport-
> >states[NO_HW_FLOWCTRL]) {
>    575				pinctrl_select_state(ascport-
> >pinctrl,
>    576						     ascport-
> >states[NO_HW_FLOWCTRL]);
>    577	
>  > 578				gpiod =
> devm_fwnode_get_gpiod_from_child(port->dev,
>    579									
>  "rts",
>    580									
>  &np->fwnode,
>    581									
>  GPIOD_OUT_LOW,
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
