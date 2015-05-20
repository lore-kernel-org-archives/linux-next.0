From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the samsung tree with the arm-soc
 and at91 trees
Date: Wed, 20 May 2015 09:45:56 +0200
Message-ID: <555C3BB4.2000802@atmel.com>
References: <20150520102743.3d336a73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:44459 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbbETHqz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 03:46:55 -0400
In-Reply-To: <20150520102743.3d336a73@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Baruch Siach <baruch@tkos.co.il>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Le 20/05/2015 02:27, Stephen Rothwell a =E9crit :
> Hi Kukjin,
>=20
> Today's linux-next merge of the samsung tree got a conflict in
> arch/arm/configs/multi_v7_defconfig between various commits from the
> arm-soc and at91 trees and various commits from the samsung tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

AT91 part seems okay. Thanks,
--=20
Nicolas Ferre
