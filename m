From: Michal Kazior <michal@plume.com>
Subject: Re: linux-next: build warning after merge of the leds tree
Date: Thu, 14 Feb 2019 08:51:07 +0100
Message-ID: <CABqz6Wz_J7xJwzYc7xaHJ87t6Uzzvkrn2x7M0ij6C6JbSOm82w@mail.gmail.com>
References: <20190214144610.3672e9d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214144610.3672e9d7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 14, 2019 at 4:46 AM Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>
> Hi Jacek,
>
> After merging the leds tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_firmware_loaded':
> drivers/leds/leds-lp55xx-common.c:217:1: warning: label 'out' defined but=
 not used [-Wunused-label]
>  out:
>  ^~~
>
> Introduced by commit
>
>   905c2157dd19 ("leds: lp55xx: fix null deref on firmware load failure")

I'm sorry guys, that's my fault. Let me fix that.


Micha=C5=82
