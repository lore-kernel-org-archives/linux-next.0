From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the samsung tree with the arm-soc and
 at91 trees
Date: Wed, 20 May 2015 09:35:36 +0900
Message-ID: <CAJKOXPdsi-5kdQJtybeaMCy0DXuRTRGgBEOM=SH9BsjquEMjCQ@mail.gmail.com>
References: <20150520102743.3d336a73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vn0-f54.google.com ([209.85.216.54]:43141 "EHLO
	mail-vn0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbbETAfh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2015 20:35:37 -0400
In-Reply-To: <20150520102743.3d336a73@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Baruch Siach <baruch@tkos.co.il>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

2015-05-20 9:27 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Kukjin,
>
> Today's linux-next merge of the samsung tree got a conflict in
> arch/arm/configs/multi_v7_defconfig between various commits from the
> arm-soc and at91 trees and various commits from the samsung tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Hi,

Thanks for the merge.

The parts coming from samsung-soc related to manually toggling stuff
(by me and Javier) look fine. The rest (coming from Kukjin's
savedefconfig) I don't know - too much of them.

On the other hand I wonder if savedefconfig was done on 4.1-rc1 (base
of branch samsung-defconfig [0]). If yes then it would discard any
Kconfig changes (like new dependencies and symbols) done in for-next
of arm-soc tree.

[0] https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=samsung-defconfig

Best regards,
Krzysztof
