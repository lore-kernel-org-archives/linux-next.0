From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with the arm-soc tree
Date: Thu, 15 Oct 2015 09:04:06 +0100
Message-ID: <20151015080406.GL32409@x1>
References: <20151015131911.3b3a7ca8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:33239 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbbJOIEL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 04:04:11 -0400
Received: by wijp11 with SMTP id p11so16618736wij.0
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2015 01:04:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151015131911.3b3a7ca8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>

On Thu, 15 Oct 2015, Stephen Rothwell wrote:

> Hi Lee,
>=20
> Today's linux-next merge of the mfd tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/mfd/s2mps11.txt
>=20
> between commit:
>=20
>   6a4479f96543 ("dt-bindings: Document grounded ACOKB pin on S2MPS11"=
)
>=20
> from the arm-soc tree and commit:
>=20
>   db96ec728d69 ("mfd: dt-bindings: Document pulled down WRSTBI pin on=
 S2MPS1X")
>=20
> from the mfd tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

Yeah, I thought this might happen.

Hence: http://www.spinics.net/lists/devicetree/msg97548.html.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
