From: "Sherman Yin" <syin@broadcom.com>
Subject: RE: linux-next: manual merge of the pinctrl tree with Linus'
 tree
Date: Thu, 29 Aug 2013 15:24:10 +0000
Message-ID: <051069C10411E24D9749790C498526FA1BDE034D@SJEXCHMB12.corp.ad.broadcom.com>
References: <20130829171704.7a7630dd19d19ccdb9aaf384@canb.auug.org.au>
 <CACRpkdbHtjvY_VypnCQZNU2N1YqWtUv_grTK30A+tgEP3a0uwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:4462 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752200Ab3H2PYT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 11:24:19 -0400
In-Reply-To: <CACRpkdbHtjvY_VypnCQZNU2N1YqWtUv_grTK30A+tgEP3a0uwQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@stericsson.com>

>I made a bit different fix, I just lock the spinlock around the entire
>loop, as this is not doing any delays or anything like that and
>just hammer a few registers with the settings, it makes sense to
>have that inside a single lock:

Hmm, I fixed this the first time I ported over to LinusW's devel tree,
but when I rebased on Sunday, the spin lock commit seemed to be
reverted or gone.  

Note the following return in between the locking and unlocking -
need an unlock there?

> +              case PIN_CONFIG_DRIVE_STRENGTH:
> +                      strength = pinconf_to_config_argument(configs[i]);
> +                      if (strength > 40)
> +                              return -EINVAL;
> +                      /*
> +                       * We convert from mA to what the register expects:
> +                       *   0: 10mA
> +                       *   1: 20mA
> +                       *   2: 30mA
> +                       *   3: 40mA
> +                       */

Regards,
Sherman
