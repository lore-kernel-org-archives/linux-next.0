From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: manual merge of the mmc tree with the imx-mxs tree
Date: Thu, 10 Nov 2016 09:35:36 +0800
Message-ID: <20161110013535.GD14622@dragon>
References: <20161110115004.431c171e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161110115004.431c171e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>, Hongtao Jia <hongtao.jia@nxp.com>
List-Id: linux-next.vger.kernel.org

Hi Ulf,

On Thu, Nov 10, 2016 at 11:50:04AM +1100, Stephen Rothwell wrote:
> Hi Ulf,
> 
> Today's linux-next merge of the mmc tree got a conflict in:
> 
>   arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> 
> between commit:
> 
>   784e94eeb377 ("arm64: dts: ls2080a: Add TMU device tree support for LS2080A")
> 
> from the imx-mxs tree and commit:
> 
>   61ab9ffac1b9 ("ARM64: dts: ls2080a: add device configuration node")

Is there a reason why this dts patch has to go through mmc tree?  We
normally have them go via arm-soc tree.

Shawn

> 
> from the mmc tree.
