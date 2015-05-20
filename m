From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the at91 tree with the arm-soc tree
Date: Wed, 20 May 2015 09:41:32 +0200
Message-ID: <555C3AAC.40101@atmel.com>
References: <20150520100851.2e485c02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:43466 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277AbbETHmb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 03:42:31 -0400
In-Reply-To: <20150520100851.2e485c02@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Le 20/05/2015 02:08, Stephen Rothwell a =E9crit :
> Hi Nicolas,
>=20
> Today's linux-next merge of the at91 tree got a conflict in
> arch/arm/configs/multi_v7_defconfig between commit 7b57472fb6cb ("ARM=
:
> multi_v7_defconfig: enable asm and NEON accelerated crypto modules")
> from the arm-soc tree and commit 822cfdfb9511 ("ARM:
> multi_v7_defconfig: Add Atmel SAMA5 family") from the at91 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

=46ix seems perfect: thanks Stephen.

Bye,
--=20
Nicolas Ferre
