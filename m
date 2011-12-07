From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include xshm in linux-next
Date: Thu, 8 Dec 2011 00:28:22 +1100
Message-ID: <20111208002822.796a4cdbe4007773717e9043@canb.auug.org.au>
References: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__8_Dec_2011_00_28_22_+1100_sT390GO3qJCbDI6/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:41588 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755357Ab1LGN2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 08:28:33 -0500
In-Reply-To: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?IlNqdXIgQnLDpm5kZWxhbmQi?= <sjur.brandeland@stericsson.com>, linux-next@vger.kernel.org

--Signature=_Thu__8_Dec_2011_00_28_22_+1100_sT390GO3qJCbDI6/
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 7 Dec 2011 13:27:33 +0100 Linus Walleij <linus.walleij@linaro.org> =
wrote:
>
> while we are in the process of setting up a kernel.org repo for
> my colleague Sjur Br=C3=A6ndeland, could you please include the
> xshm-for-next branch from my ST-Ericsson tree on kernel.org
> so we catch any build problems etc:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
> xshm-for-next

I have added this tree with you and Sjur as contacts in case of trouble.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Thu__8_Dec_2011_00_28_22_+1100_sT390GO3qJCbDI6/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO32n2AAoJEECxmPOUX5FEwcwQAIBEVZZZoZJldmuyPFcO1/1X
lsuAB1mtBbD5CKh7/h58znYMA6/RigXTM9d6rogKdmifaolC4lcsVRIfU5PBYT7q
0cOZhyw9D3mi3RB8PfgSC1CMUtunVBOALKliHLkLnNUeusVXLsWwQkEoWaeeT42/
p6R6Bw40tUb3Gz/co3/tUZPnJsGhXJRANU/hM509pXh9T8Si+ph5bgFN2aMM2+VX
WuCxKsVJkR2OWL8pmTOKbIMEzZOh6SpOugBivCo2JWEA0jwirN/s1ICfuZdu8/Sa
GpEnULKCngkHB+3yUn78+3cE5qvcSCoWeBBtNKnsUDMty535JEDoqXJ5yoUoQL1i
7xmnHYFnicx7Y35oNDMbSL3jzA/TgEfOjgafcf+H+/m2BfJ+2XbZMjAzGAB+Svj5
uj8OO5l3hHn1hMMmIcKJFpv0sc+aLUhOnmq1SBNGpA7Ef0Y2oGLyUJut1rvjobiF
6S3tvNLJQxLtZNYncdX+UDkncPeTM6HzZGYB8bYK/b0DfXKQMcEWNsXkGLW4fQ9g
kJdIIf8T2zS9gUusJDUJuF5dQLMExJYwrD4XKZEof2XtlrRuOH7D3eoHOVzRs0HK
YUL629rIJiwIGqTa3o7pBubyeTR/982CQf9DM7PYtKe10rTgfe6jHG9Dtk1zwiZv
k4IjZFlZwNY5Bxs5mFMZ
=bjZA
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Dec_2011_00_28_22_+1100_sT390GO3qJCbDI6/--
