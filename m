From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 13 Feb 2017 16:18:06 +0100
Message-ID: <CACRpkdY2Ki1m__O0tSpstJpP9p2BWmXNzV9np6emoAtXqt-9yw@mail.gmail.com>
References: <20170208161113.1b597c01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208161113.1b597c01@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 8, 2017 at 6:11 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/tty/serial/st-asc.c: In function 'asc_set_termios':
> drivers/tty/serial/st-asc.c:578:12: error: implicit declaration of function 'devm_get_gpiod_from_child' [-Werror=implicit-function-declaration]
>     gpiod = devm_get_gpiod_from_child(port->dev, "rts",
>             ^
> drivers/tty/serial/st-asc.c:578:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>     gpiod = devm_get_gpiod_from_child(port->dev, "rts",
>           ^
>
> Caused by commits
>
>   a264d10ff45c ("gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO")
>   b2987d7438e0 ("gpio: Pass GPIO label down to gpiod_request")
>   4b0947974e59 ("gpio: Rename devm_get_gpiod_from_child()")
>
> interacting with commit
>
>   d7356256488c ("serial: st-asc: (De)Register GPIOD and swap Pinctrl profiles")
>
> from the tty tree.

Ah what a bummer, a new user colliding with the treewide changes of these
prototypes.

> I applied the following merge fix patch (I guessed about the new arguments):

Looks correct. Well not much to do about it apart from mentioning the
problem to Linus (the big penguin) when merging the trees.

Thanks for your efforts!

Yours,
Linus Walleij
