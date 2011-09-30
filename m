From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Fri, 30 Sep 2011 14:56:46 -0400
Message-ID: <CAP=VYLq5-6RG9DnQkrAV98Mpn6iBwnrscsFP--PN6jkmYVYPCQ@mail.gmail.com>
References: <20110930145042.4a7ee530848262294b297939@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110930145042.4a7ee530848262294b297939@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 30, 2011 at 12:50 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Paul,
>
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/pinctrl/core.c:80:1: warning: data definition has no type or =
storage class [enabled by default]
> drivers/pinctrl/core.c:80:1: warning: type defaults to 'int' in decla=
ration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/core.c:80:1: warning: parameter names (without types)=
 in function declaration [enabled by default]
> drivers/pinctrl/core.c:86:1: warning: data definition has no type or =
storage class [enabled by default]
> drivers/pinctrl/core.c:86:1: warning: type defaults to 'int' in decla=
ration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/core.c:86:1: warning: parameter names (without types)=
 in function declaration [enabled by default]
> drivers/pinctrl/core.c:152:1: warning: data definition has no type or=
 storage class [enabled by default]
> drivers/pinctrl/core.c:152:1: warning: type defaults to 'int' in decl=
aration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/core.c:152:1: warning: parameter names (without types=
) in function declaration [enabled by default]
> drivers/pinctrl/core.c:590:1: warning: data definition has no type or=
 storage class [enabled by default]
> drivers/pinctrl/core.c:590:1: warning: type defaults to 'int' in decl=
aration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/core.c:590:1: warning: parameter names (without types=
) in function declaration [enabled by default]
> drivers/pinctrl/core.c:614:1: warning: data definition has no type or=
 storage class [enabled by default]
> drivers/pinctrl/core.c:614:1: warning: type defaults to 'int' in decl=
aration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/core.c:614:1: warning: parameter names (without types=
) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c: In function 'pin_request':
> drivers/pinctrl/pinmux.c:143:2: error: implicit declaration of functi=
on 'try_module_get' [-Werror=3Dimplicit-function-declaration]
> drivers/pinctrl/pinmux.c: In function 'pin_free':
> drivers/pinctrl/pinmux.c:206:2: error: implicit declaration of functi=
on 'module_put' [-Werror=3Dimplicit-function-declaration]
> drivers/pinctrl/pinmux.c: At top level:
> drivers/pinctrl/pinmux.c:234:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:234:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:234:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c:257:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:257:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:257:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c:754:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:754:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:754:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c:779:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:779:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:779:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c:813:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:813:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:813:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
> drivers/pinctrl/pinmux.c:837:1: warning: data definition has no type =
or storage class [enabled by default]
> drivers/pinctrl/pinmux.c:837:1: warning: type defaults to 'int' in de=
claration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
> drivers/pinctrl/pinmux.c:837:1: warning: parameter names (without typ=
es) in function declaration [enabled by default]
>
>
> Caused by commit 05f20c997d73 ("drivers: create a pin control subsyst=
em
> v8"), revelealed by the module.h split.
>
> I have applied the following patch for today (Linus, the
> drivers/pinctrl/pinmux.c part of this can be applied to your tree).

I've queued the remaining export.h part to core.c as a post-merge patch=
 in the
modsplit-post-merge queue.

Paul.

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 30 Sep 2011 14:39:04 +1000
> Subject: [PATCH] pinctrl: EXPORT_SYMBOL needs export.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =A0drivers/pinctrl/core.c =A0 | =A0 =A01 +
> =A0drivers/pinctrl/pinmux.c | =A0 =A01 +
> =A02 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 4229628..f9263b2 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -12,6 +12,7 @@
> =A0#define pr_fmt(fmt) "pinctrl core: " fmt
>
> =A0#include <linux/kernel.h>
> +#include <linux/export.h>
> =A0#include <linux/init.h>
> =A0#include <linux/device.h>
> =A0#include <linux/slab.h>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 37803f0..6b28f2b 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -12,6 +12,7 @@
> =A0#define pr_fmt(fmt) "pinmux core: " fmt
>
> =A0#include <linux/kernel.h>
> +#include <linux/module.h>
> =A0#include <linux/init.h>
> =A0#include <linux/device.h>
> =A0#include <linux/slab.h>
> --
> 1.7.6.3
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
