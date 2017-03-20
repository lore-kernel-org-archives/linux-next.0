From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the gpio tree with the input tree
Date: Mon, 20 Mar 2017 12:54:39 +0200
Message-ID: <1490007279.19767.93.camel@linux.intel.com>
References: <20170320150340.6d73c179@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320150340.6d73c179@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, 2017-03-20 at 15:03 +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> Today's linux-next merge of the gpio tree got a conflict in:
> 
>   drivers/input/misc/soc_button_array.c
> 
> between commit:
> 
>   a01cd17000a4 ("Input: soc_button_array - use NULL for GPIO
> connection ID")
> 
> from the input tree and commit:
> 
>   c5097538c86a ("Input: soc_button_array - Propagate error from
> gpiod_count()")
> 
> from the gpio tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your
> tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any
> particularly
> complex conflicts.

The fix is correct.
Thank you, Stephen.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
