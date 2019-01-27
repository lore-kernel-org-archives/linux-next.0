From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: linux-next: build warning after merge of the gpio-brgl tree
Date: Sun, 27 Jan 2019 13:30:55 +0100
Message-ID: <CAMRc=MdMK=PMqHeroiyytwZ0w3++iiXWZaBQsRMQvjgvQqDBQw@mail.gmail.com>
References: <20190124151837.1ca96816@canb.auug.org.au> <df1743f8-71c8-3b18-1e8a-94198d99477d@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <df1743f8-71c8-3b18-1e8a-94198d99477d@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

czw., 24 sty 2019 o 06:42 YueHaibing <yuehaibing@huawei.com> napisa=C5=82(a=
):
>
> On 2019/1/24 12:18, Stephen Rothwell wrote:
> > Hi Bartosz,
> >
> > After merging the gpio-brgl tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >
> > drivers/gpio/gpio-davinci.c: In function 'davinci_gpio_get_irq_chip':
> > drivers/gpio/gpio-davinci.c:472:9: warning: function returns address of=
 local variable [-Wreturn-local-addr]
> >   return &gpio_unbanked.chip;
> >          ^~~~~~~~~~~~~~~~~~~
> > drivers/gpio/gpio-davinci.c: In function 'keystone_gpio_get_irq_chip':
> > drivers/gpio/gpio-davinci.c:480:9: warning: function returns address of=
 local variable [-Wreturn-local-addr]
> >   return &gpio_unbanked;
> >          ^~~~~~~~~~~~~~
> >
> > Introduced by commit
> >
> >   ee5e87158e63 ("gpio: davinci: drop pointless static qualifier")
>
> I'm very sorry for this.
>
> I misread the code, Pls revert this.
>
> >
>

I backed out this one.

Thanks,
Bartosz
