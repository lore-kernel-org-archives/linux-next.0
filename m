From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Date: Tue, 23 Apr 2019 10:12:37 +0800
Message-ID: <20190423021235.GE16166@dragon>
References: <20190423084501.15824b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423084501.15824b18@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, Apr 23, 2019 at 08:45:01AM +1000, Stephen Rothwell wrote:
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

Fixed.  Thanks for reporting.

Shawn
