From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build warning after merge of the imx-mxs tree
Date: Mon, 14 May 2018 08:56:32 +0800
Message-ID: <20180514005629.GA11867@dragon>
References: <20180514092158.297b4fe4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180514092158.297b4fe4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Mon, May 14, 2018 at 09:21:58AM +1000, Stephen Rothwell wrote:
> Hi Shawn,
> 
> After merging the imx-mxs tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> arch/arm/boot/dts/imx6dl-aristainetos_7.dtb: Warning (reg_format): /soc/ipu@2400000/port@2/endpoint@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> arch/arm/boot/dts/imx6dl-aristainetos_7.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-aristainetos_7.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> arch/arm/boot/dts/imx6dl-aristainetos_7.dtb: Warning (avoid_default_addr_size): /soc/ipu@2400000/port@2/endpoint@0: Relying on default #address-cells value
> 
> and about 7000 more lines across several files ...
> 
> It is hard tell what introduced these warnings ...

Commit e6bb17850d1e ("ARM: dts: imx: fix IPU OF graph endpoint node
names") introduced the warnings.  I will submit a patch to fix them.
Sorry for this.

Shawn
