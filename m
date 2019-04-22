From: Fabio Estevam <festevam@gmail.com>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Mon, 22 Apr 2019 19:54:22 -0300
Message-ID: <CAOMZO5B4MA8kjxk+nYdwMhBHM4OKPFe0RsQyHibNkcewkdjOpw@mail.gmail.com>
References: <20190423084501.15824b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423084501.15824b18@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawnguo@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 22, 2019 at 7:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the imx-mxs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/boot/dts/imx7d-zii-rpu2.dts:46.12-50.4: Warning (io_channels_property): /iio-hwmon: Missing property '#io-channel-cells' in node /soc/aips-bus@30400000/adc@30610000 or bad phandle (referred from io-channels[0])
>
> Caused by commit
>
>   69ab5392f517 ("ARM: dts: Add support for ZII i.MX7 RPU2 board")

Andrey has submitted a fix for this issue:
https://lkml.org/lkml/2019/4/14/168
