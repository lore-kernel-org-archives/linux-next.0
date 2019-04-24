From: Tony Lindgren <tony@atomide.com>
Subject: Re: linux-next: manual merge of the tegra tree with the rockchip tree
Date: Wed, 24 Apr 2019 07:59:46 -0700
Message-ID: <20190424145946.GD8007@atomide.com>
References: <20190424094323.0ec123f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424094323.0ec123f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-Id: linux-next.vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [190423 23:43]:
> Hi all,
> 
> Today's linux-next merge of the tegra tree got a conflict in:
> 
>   arch/arm/configs/multi_v7_defconfig
> 
> between commit:
> 
>   366391f04177 ("ARM: multi_v7_defconfig: Enable missing drivers for supported Chromebooks")
> 
> from the rockchip tree and commit:
> 
>   35f8e2e29e74 ("ARM: multi_v7_defconfig: Update for moved options")
> 
> from the tegra tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

OK thank you!

Tony

> diff --cc arch/arm/configs/multi_v7_defconfig
> index 7a288d18e257,88d4da77ae9b..000000000000
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@@ -511,9 -501,6 +509,7 @@@ CONFIG_MFD_AC100=
>   CONFIG_MFD_AXP20X_I2C=y
>   CONFIG_MFD_AXP20X_RSB=y
>   CONFIG_MFD_CROS_EC=m
> - CONFIG_CROS_EC_I2C=m
> - CONFIG_CROS_EC_SPI=m
>  +CONFIG_MFD_CROS_EC_CHARDEV=m
>   CONFIG_MFD_DA9063=m
>   CONFIG_MFD_MAX14577=y
>   CONFIG_MFD_MAX77686=y
