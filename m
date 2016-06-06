From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: build failure after merge of the amlogic tree
Date: Sun, 5 Jun 2016 20:40:28 -0700
Message-ID: <CAOi56cVQPutG1ZBw16=HWBAVdbV+i2VL4vDRdc_23qVT+MEL+A@mail.gmail.com>
References: <20160606095559.67cf4f00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606095559.67cf4f00@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Sun, Jun 5, 2016 at 4:55 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kevin,
>
> After merging the amlogic tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from arch/arm/boot/dts/meson8b-mxq.dts:48:0:
> arch/arm/boot/dts/meson8b.dtsi:49:53: fatal error: dt-bindings/reset/amlogic,meson8b-reset.h: No such file or directory
> In file included from arch/arm/boot/dts/meson8b-odroidc1.dts:48:0:
> arch/arm/boot/dts/meson8b.dtsi:49:53: fatal error: dt-bindings/reset/amlogic,meson8b-reset.h: No such file or directory
>
> Caused by commit
>
>   bf205ad75a17 ("ARM: dts: amlogic: Enable Reset Controller on Meson8b platforms")
>
> I guess a file was forgotten.

Not forgotten, but merged through Philip's reset tree, which I thought
was already in linux-next.  Sorry about that.

Kevin
