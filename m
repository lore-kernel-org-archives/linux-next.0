From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Renesas linux-next tree
Date: Tue, 4 Sep 2012 09:58:29 +1000
Message-ID: <20120904095829.e5fb4e978224ad3220d6cc15@canb.auug.org.au>
References: <201208270936.09252.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__4_Sep_2012_09_58_29_+1000_q9DYRHeFvkgcsRwD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:39518 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262Ab2ICX6j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Sep 2012 19:58:39 -0400
In-Reply-To: <201208270936.09252.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>

--Signature=_Tue__4_Sep_2012_09_58_29_+1000_q9DYRHeFvkgcsRwD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

On Mon, 27 Aug 2012 09:36:09 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
>
> Since the Renesas arm/mach-shmobile tree will be maintained by
> Simon Horman now, please stop pulling from the 'next' branch
> of my 'renesas.git' tree at:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/renesas.git next
>=20
> and please include the Simon's tree at:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>=20
> into linux-next instead.

I have changed that from today and set Simon as the contact person for
problems.

This is for Simon:

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

--Signature=_Tue__4_Sep_2012_09_58_29_+1000_q9DYRHeFvkgcsRwD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQRUQlAAoJEECxmPOUX5FEPh4P/AyIYnNxRf8hkwtdvg5kWdOu
ea65ktyVS1wprjZ6jXCSYI3mU864tSjuFieSwkoO2to8QwaIaTmlXwA2u4u5prLz
SETz+ittBbSbcVi/6frDwFqKKYRGKH8p9R1I+f40eTpLnB1ddQf0AIa0nRUKyZF2
JSWxy7CSSYoIxwg+xxAoCeBGmNFolPPaMwaHoJXbY5tqW/CT/lv97vZvHaKPUq9f
a8CGOfVYap5bD3ejMBDotBx6VBU9Rn+aTZ3p8lcB9QUxTCbrs/5p7uDBrEwA22lx
I9VUfowYZdE9xHubwtwpGPqfjfsgWE7fGYOemCcfbR8dMu840Z4KV7n26DT3E+lC
k0Uy0VGoxS9rxuLn1sVrNUI20jpdA+XCTjbIu/y9qejLwb8FKHquckVDlF77Mp7Q
2SBawbvP9lCX2Cjw72GVkPIInfpXqW2G+/Ldd1QJ6C1ZGQonNKVGhc02boDiiC/1
SCcn4j62cZEpuytA0AHUJLYFc+6d9nED5NQQS6Ni0F7zVdfPylXmVEp8NpPIKRlp
uccNyd4iFEubbvBYW42H5+Lr81IoVXhi/VwHyzQ0aaEEDomQ2QtAQk+gQaKf83VG
iysdWVPgT5rGA/ZSIMLq0IISE2P2H59uUgGuQ1CSd6fZcjyJYRrJ8uXCEnEZz0vC
XXDvNd91DnGaZIhip67Y
=41Y0
-----END PGP SIGNATURE-----

--Signature=_Tue__4_Sep_2012_09_58_29_+1000_q9DYRHeFvkgcsRwD--
