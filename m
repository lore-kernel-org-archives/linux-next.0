From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Wed, 21 Jun 2017 16:09:34 +1000
Message-ID: <20170621160934.67c1f27e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Xiaoguang Chen <xgchenshy@gmail.com>, Jisheng Zhang <jszhang@marvell.com>
List-Id: linux-next.vger.kernel.org

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_set_type':
drivers/gpio/gpio-dwapb.c:291:2: error: stray '\357' in program
  if =EF=BC=88type !=3D IRQ_TYPE_EDGE_BOTH=EF=BC=89
  ^
drivers/gpio/gpio-dwapb.c:291:2: error: stray '\274' in program
drivers/gpio/gpio-dwapb.c:291:2: error: stray '\210' in program
drivers/gpio/gpio-dwapb.c:291:8: error: expected '(' before 'type'
  if =EF=BC=88type !=3D IRQ_TYPE_EDGE_BOTH=EF=BC=89
        ^
drivers/gpio/gpio-dwapb.c:291:8: warning: statement with no effect [-Wunuse=
d-value]
drivers/gpio/gpio-dwapb.c:291:8: error: stray '\357' in program
drivers/gpio/gpio-dwapb.c:291:8: error: stray '\274' in program
drivers/gpio/gpio-dwapb.c:291:8: error: stray '\211' in program

Caused by commit

  a9d21d8da766 ("gpio: dwapb: fix missing first irq for edgeboth irq type")

It looks like those '(' ')' chars are not what they seem ...

I have used the gpio tree from next-20170620 for today.

--=20
Cheers,
Stephen Rothwell
