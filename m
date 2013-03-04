From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Mon, 4 Mar 2013 03:30:30 +0100
Message-ID: <CACRpkdZPkUT1=W=NgKDdUXy7fiSjymki0jjOFE5_KuVtyStuzg@mail.gmail.com>
References: <20130304124513.cf97f6249b0759a1ea1cb34d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130304124513.cf97f6249b0759a1ea1cb34d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Gabriel Fernandez <gabriel.fernandez@stericsson.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 4, 2013 at 2:45 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-stmpe.c: In function 'stmpe_gpio_irq_init':
> drivers/gpio/gpio-stmpe.c:313:23: error: 'struct gpio_chip' has no member named 'of_node'
> drivers/gpio/gpio-stmpe.c:316:61: error: 'struct gpio_chip' has no member named 'of_node'
> drivers/gpio/gpio-stmpe.c: In function 'stmpe_gpio_probe':
> drivers/gpio/gpio-stmpe.c:351:18: error: 'struct gpio_chip' has no member named 'of_node'

So basically when I look at this issue the way we have
the of node optional in gpiolib is inconsistent with the device
core and that makes it easy to do things like this :-(

include/linux/device.h:
struct device {
(...)
         struct device_node      *of_node; /* associated device tree node */
(...)
}

No #ifdef, it used to be there but I guess we deleted it because
of #ifdef clutter elsewhere.

include/asm-generic/gpio.h:
struct gpio_chip {
(...)
#if defined(CONFIG_OF_GPIO)
        /*
         * If CONFIG_OF is enabled, then all GPIO controllers described in the
         * device tree automatically may have an OF translation
         */
        struct device_node *of_node;
        int of_gpio_n_cells;
        int (*of_xlate)(struct gpio_chip *gc,
                        const struct of_phandle_args *gpiospec, u32 *flags);
#endif
(...)
}

Will it help if we just move the of_node outside of the #ifdef
in this case? Or does it have hard deps such that the
of_gpio_n_cells and of_xlate also need to be moved out
in that case?

Yours,
Linus Walleij
