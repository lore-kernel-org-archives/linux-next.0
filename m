From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with Linus' tree
Date: Thu, 29 Aug 2013 19:21:21 +0200
Message-ID: <CACRpkdYRqXuqqtVyPY_99tCEhX=wHKuQ0=m9ptVFHKOD4tUteQ@mail.gmail.com>
References: <20130829171704.7a7630dd19d19ccdb9aaf384@canb.auug.org.au>
	<CACRpkdbHtjvY_VypnCQZNU2N1YqWtUv_grTK30A+tgEP3a0uwQ@mail.gmail.com>
	<051069C10411E24D9749790C498526FA1BDE034D@SJEXCHMB12.corp.ad.broadcom.com>
	<CACRpkdY-4+CJpCwGsbpb7mo0zRevEmpmoyirxeB9FbU0sS=GsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY-4+CJpCwGsbpb7mo0zRevEmpmoyirxeB9FbU0sS=GsQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sherman Yin <syin@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@stericsson.com>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 29, 2013 at 7:20 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> Note the following return in between the locking and unlocking -
>> need an unlock there?
>>
>>> +              case PIN_CONFIG_DRIVE_STRENGTH:
>>> +                      strength = pinconf_to_config_argument(configs[i]);
>>> +                      if (strength > 40)
>>> +                              return -EINVAL;
>
> Argh. Send a patch with your reported-by tag...

Not SEND, I mean SENT, I just SENT a patch...
subject "pinctrl: sunxi: drop lock on error path"
sorry for the confusion.

Yours,
Linus Walleij
