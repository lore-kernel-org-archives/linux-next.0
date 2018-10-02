From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 2 Oct 2018 10:34:41 +0200
Message-ID: <CAMRc=MfGZ2txjBNJAePwabGoCCVY0U1X9vvYivQb_LusDnsvgg@mail.gmail.com>
References: <20181002153149.2a312771@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002153149.2a312771@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

wt., 2 pa=C5=BA 2018 o 07:31 Stephen Rothwell <sfr@canb.auug.org.au> napisa=
=C5=82(a):
>
> Hi all,
>
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/nvmem/lpc18xx_eeprom.c: In function 'lpc18xx_eeprom_remove':
> drivers/nvmem/lpc18xx_eeprom.c:258:6: warning: unused variable 'ret' [-Wu=
nused-variable]
>   int ret;
>       ^~~
>
> Introduced by commit
>
>   226014d13fa5 ("nvmem: lpc18xx_eeprom: use devm_nvmem_register()")
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

I'll send a follow-up to fix this.

Thanks,
Bartosz
