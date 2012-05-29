From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the l2-mtd tree with Linus' tree
Date: Tue, 29 May 2012 12:45:01 +1000
Message-ID: <20120529124501.38995df01dfaebcbd5f1b869@canb.auug.org.au>
References: <20120529123301.b3f33396549e0762f26fa80b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__29_May_2012_12_45_01_+1000_eL=0kgMd3Z18t0nY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42201 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab2E2CpF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 May 2012 22:45:05 -0400
In-Reply-To: <20120529123301.b3f33396549e0762f26fa80b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@freescale.com>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__29_May_2012_12_45_01_+1000_eL=0kgMd3Z18t0nY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Tue, 29 May 2012 12:33:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> This tree (l2-mtd) needs to be updated since most of its patches (but not
> commits) have been merged into upstream trees.  Artem, you and Dave
> Woodhouse need to discuss your work flow.  (Or I just need to remove the
> l2-mtd tree from linux-next.)

I fact, I screwed up the various merge resolutions that the above mess
caused, so I just dropped the l2-mtd tree for today.  Please fix it up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__29_May_2012_12_45_01_+1000_eL=0kgMd3Z18t0nY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPxDgtAAoJEECxmPOUX5FE/9kP/3v5AEIM8ckGboaAdAKfHmvV
ma/NYnigOmFXlUfRRznZbdA91iBM6WdetS8QmjCtg9nmf/XUuBwk3FX+lV1GgNGU
Q3eHIeup5QtPrylF7NEhSpa0/N/RAvvnBL3tKGJB2lBMt26maijvf5XoGEca0eGp
SvFxQZp/ubYaIM3G3CYo8j7fDmWWuF66CWKpJK/SZayalFIFs58imrBaMwGmif6h
fX3m06f7FqJwxEyuYutup2Jw8A2/XaEB6B3ufXs8098dzNt1FjaefFqqFEeaLAWw
JLw2Ytu+sBCt1HhV8dbPPJMBLzVpPNHfHrr08OeAQp5kfVEerBeOZQz5gdCQ3tr6
HkCtXQkThf5cXxKRsguEhcV9R47yjxhw64FVTa8SOdfaJVGcD8D494Rxyhno8qR+
yC3oPqqqgLDMJhP7jk9fwIAnLUMfwdeDBxrptIm3fUfaTzOc71IJjW7uHKKpaHCN
u2XSp9ZaDD2wgZhjSmCJSnYBAqtDOae/GydCX7kCeuS0dRsvSkeDitIAiA4Nq263
ns6Bly+V1zF92tPqpGHp0nuMC2WKbr3vJ3XpJWFkiuqcDm9n3Pbyj1kTtonEypGS
ZfW00kq5Bc1YoAh5S8e93K8Aypbz0mqINP60LiA9NxvVo/nI81kwr36hvWmbdFrc
yrpm9CmitAr6tXmJhqzd
=FvHS
-----END PGP SIGNATURE-----

--Signature=_Tue__29_May_2012_12_45_01_+1000_eL=0kgMd3Z18t0nY--
