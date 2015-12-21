From: Pramod Kumar <pramodku@broadcom.com>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Date: Mon, 21 Dec 2015 06:23:42 +0000
Message-ID: <0C803592FC378B4E83922050AB46442A2ADB298E@SJEXCHMB10.corp.ad.broadcom.com>
References: <20151221155811.04a84bf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_0C803592FC378B4E83922050AB46442A2ADB298ESJEXCHMB10corpa_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:22005 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbbLUGXo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 01:23:44 -0500
In-Reply-To: <20151221155811.04a84bf1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

--_002_0C803592FC378B4E83922050AB46442A2ADB298ESJEXCHMB10corpa_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Stephen Rothwell,

This is the same error what we discussed on Friday mail-chain. Please see t=
he attachment of my reply.

Regards,
Pramod

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 21 December 2015 10:28
> To: Linus Walleij
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Pramod Kuma=
r;
> Ray Jui; Scott Branden
> Subject: linux-next: build failure after merge of the pinctrl tree
>=20
> Hi Linus,
>=20
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:50: warning: 'struct cygnus_=
gpio'
> declared inside parameter list  static void iproc_gpio_unregister_pinconf=
(struct
> cygnus_gpio *chip)
>                                                   ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:50: warning: its scope is on=
ly this
> definition or declaration, which is probably not what you want
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function
> 'iproc_gpio_unregister_pinconf':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:642:25: error: dereferencing poi=
nter to
> incomplete type 'struct cygnus_gpio'
>   pinctrl_unregister(chip->pctl);
>                          ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function 'iproc_gpio_probe':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:738:32: warning: passing argumen=
t 1 of
> 'iproc_gpio_unregister_pinconf' from incompatible pointer type [-
> Wincompatible-pointer-types]
>   iproc_gpio_unregister_pinconf(chip);
>                                 ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:13: note: expected 'struct
> cygnus_gpio *' but argument is of type 'struct iproc_gpio *'
>  static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
>              ^
>=20
> Caused by commit
>=20
>  afc8c78d179d ("gpio: Rename func/macro/var to IP-block,iproc")
>=20
> This does not look like it has even been build tested :-(
>=20
> I have used the pinctrl tree from next-20151217 again as the previous
> (fixed) error was hiding this one.
>=20
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au


--_002_0C803592FC378B4E83922050AB46442A2ADB298ESJEXCHMB10corpa_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 21 Dec 2015 06:23:41 GMT";
	modification-date="Mon, 21 Dec 2015 06:23:41 GMT"

From: Pramod Kumar <pramodku@broadcom.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Thread-Topic: linux-next: build failure after merge of the pinctrl tree
Thread-Index: AQHROUaUovEAQ2V1DkmdTMll8kYmt57QMAoQ
Date: Fri, 18 Dec 2015 05:34:56 +0000
References: <20151218144516.77c8e052@canb.auug.org.au>
In-Reply-To: <20151218144516.77c8e052@canb.auug.org.au>
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi Stephen/Linus,

The patch " [PATCH v2 5/7] gpio: Rename func/macro/var to IP-block,iproc"=20
(https://lkml.org/lkml/2015/11/18/1004) in "for-next" and "devel" of  pinct=
rl
tree ( http://git.linaro.org/people/linus.walleij/linux-pinctrl.git ) has l=
ittle rebase issue.

Original patch has:
<snip>
-static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct iproc_gpio *chip)
<snip>

while "for-next" and "devel" branch of pinctrl tree has:
<snip>
-static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)=20
<snip>

Please suggest us how could we fix this issue.

Regards,
Pramod

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 18 December 2015 09:15
> To: Linus Walleij
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Pramod Kuma=
r;
> Ray Jui; Scott Branden
> Subject: linux-next: build failure after merge of the pinctrl tree
>=20
> Hi Linus,
>=20
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function
> 'iproc_gpio_unregister_pinconf':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:642:25: error: dereferencing poi=
nter to
> incomplete type 'struct cygnus_gpio'
>   pinctrl_unregister(chip->pctl);
>                          ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c: In function 'iproc_gpio_probe':
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:738:32: warning: passing argumen=
t 1 of
> 'iproc_gpio_unregister_pinconf' from incompatible pointer type [-
> Wincompatible-pointer-types]
>   iproc_gpio_unregister_pinconf(chip);
>                                 ^
> drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:640:13: note: expected 'struct
> cygnus_gpio *' but argument is of type 'struct iproc_gpio *'
>  static void iproc_gpio_unregister_pinconf(struct cygnus_gpio *chip)
>              ^
>=20
> Caused by commit
>=20
>   616043d58a89 ("pinctrl: Rename gpio driver from cygnus to iproc")
>=20
> I have used the pinctrl tree from next-20151217 for today.
>=20
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au


--_002_0C803592FC378B4E83922050AB46442A2ADB298ESJEXCHMB10corpa_--
