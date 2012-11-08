From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (pinctrl
 tree related)
Date: Thu, 8 Nov 2012 14:06:37 +0100
Message-ID: <CACRpkdb4LVG8TG58DmUMHRL3r0r4hn7wh-y47metBwth5c52-A@mail.gmail.com>
References: <20121107154837.05c74508452d69930b624280@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121107154837.05c74508452d69930b624280@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shiraz Hashim <shiraz.hashim@st.com>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 7, 2012 at 5:48 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Caused by commit e8321df59155 ("gpiolib: iron out include ladder
> mistakes") (and some earlier ones) from the pinctrl tree.
>
> I added this patch for today (there may be a better return value from
> gpiochip_add_pin_range):
(..)
> +struct gpio_chip;
> +
>  static inline int
>  gpiochip_add_pin_range(struct gpio_chip *chip, const char *pinctl_name,
>                        unsigned int pin_base, unsigned int npins)
>  {
> +       return 0;
>  }

Bah, I happened to put these prototypes just above the actual definition
of struct gpio_chip :-P

Fixing up and respinning the patch, I've added the compulsory return
value as well.

Yours,
Linus Walleij
