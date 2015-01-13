From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Date: Tue, 13 Jan 2015 14:18:32 +0100
Message-ID: <3097971.rZTsHKr4DO@wuerfel>
References: <20150113111636.7bc5785c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:51416 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751004AbbAMNS6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Jan 2015 08:18:58 -0500
In-Reply-To: <20150113111636.7bc5785c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawn.guo@linaro.org>, Olof Johansson <olof@lixom.net>, Anson Huang <b20788@freescale.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>

On Tuesday 13 January 2015 11:16:36 Stephen Rothwell wrote:
>  -      imx6q-tx6q-1110.dtb \
>  -      imx6sl-evk.dtb \
>  +      imx6q-tx6q-1110.dtb
>  +dtb-$(CONFIG_SOC_IMX6SL) += \
>  +      imx6sl-evk.dtb
>  +dtb-$(CONFIG_SOC_IMX6SX) += \
> +       imx6sx-sabreauto.dtb \
>         imx6sx-sdb.dtb \
>  +dtb-$(CONFIG_SOC_LS1021A) += \
>         ls1021a-qds.dtb \
>  -      ls1021a-twr.dtb \
>  +      ls1021a-twr.dtb
>  +dtb-$(CONFIG_SOC_VF610) += \
> 

There is an extraneous '\' character behind imx6sx-sdb.dtb now, which caused
build errors for me. We should soon be able to merge the other branches into
arm-soc to avoid the entire set of merge conflicts, until then please
change your recorded resolution to avoid the build error.

Thanks!

	Arnd
