From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with the input tree
Date: Tue, 14 Feb 2017 08:38:40 +0000
Message-ID: <20170214083840.s36lep65kvecoao3@dell>
References: <20170214131006.4c5ab762@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170214131006.4c5ab762@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Douglas Anderson <dianders@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, 14 Feb 2017, Stephen Rothwell wrote:

> Hi Lee,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   drivers/input/keyboard/cros_ec_keyb.c
> 
> between commits:
> 
>   2057e15945a8 ("Input: cros_ec_keyb - drop unnecessary call to dev_set_drvdata and other changes")
>   aef01aad89e4 ("Input: matrix-keypad - switch to using generic device properties")
> 
> from the input tree and commit:
> 
>   cdd7950e7aa4 ("input: cros_ec_keyb: Add non-matrix buttons and switches")
> 
> from the mfd tree.
> 
> It looks like the latter introduces a call to dev_get_drvdata(), so I
> left the dev_set_drvdata() call in.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Morning Stephen,

It looks like Dmitry is yet to pull from:

  http://tinyurl.com/ztg68nj

Kind regards,
Lee

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
