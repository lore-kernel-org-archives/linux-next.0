From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with Linus' tree
Date: Thu, 29 Aug 2013 19:20:19 +0200
Message-ID: <CACRpkdY-4+CJpCwGsbpb7mo0zRevEmpmoyirxeB9FbU0sS=GsQ@mail.gmail.com>
References: <20130829171704.7a7630dd19d19ccdb9aaf384@canb.auug.org.au>
	<CACRpkdbHtjvY_VypnCQZNU2N1YqWtUv_grTK30A+tgEP3a0uwQ@mail.gmail.com>
	<051069C10411E24D9749790C498526FA1BDE034D@SJEXCHMB12.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:37997 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754Ab3H2RUU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 13:20:20 -0400
Received: by mail-oa0-f48.google.com with SMTP id o17so979266oag.35
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2013 10:20:19 -0700 (PDT)
In-Reply-To: <051069C10411E24D9749790C498526FA1BDE034D@SJEXCHMB12.corp.ad.broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sherman Yin <syin@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@stericsson.com>

On Thu, Aug 29, 2013 at 5:24 PM, Sherman Yin <syin@broadcom.com> wrote:

> Hmm, I fixed this the first time I ported over to LinusW's devel tree,
> but when I rebased on Sunday, the spin lock commit seemed to be
> reverted or gone.

My pinctrl devel branch was branched off of v3.11-rc1, and the
spinlock changes were in some later -rc and I didn't merge
them in until now, because I thought they were orthogonal.

How wrong I was. So merged in -rc7 now and pushed, please
check the end result or linux-next.

> Note the following return in between the locking and unlocking -
> need an unlock there?
>
>> +              case PIN_CONFIG_DRIVE_STRENGTH:
>> +                      strength = pinconf_to_config_argument(configs[i]);
>> +                      if (strength > 40)
>> +                              return -EINVAL;

Argh. Send a patch with your reported-by tag...

Yours,
Linus Walleij
