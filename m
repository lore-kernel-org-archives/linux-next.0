From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request for inclusion of ep93xx tree in linux-next
Date: Tue, 1 May 2012 10:27:15 +1000
Message-ID: <20120501102715.12aaaf0a846059f486682221@canb.auug.org.au>
References: <4F9F16A9.9090108@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__1_May_2012_10_27_15_+1000_tZA1y/_T+CvvJygs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42023 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757250Ab2EAA13 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Apr 2012 20:27:29 -0400
In-Reply-To: <4F9F16A9.9090108@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ryan Mallon <rmallon@gmail.com>
Cc: H Hartley Sweeten <hartleys@visionengravers.com>, Mika Westerberg <mika.westerberg@iki.fi>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org

--Signature=_Tue__1_May_2012_10_27_15_+1000_tZA1y/_T+CvvJygs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Tue, 01 May 2012 08:48:09 +1000 Ryan Mallon <rmallon@gmail.com> wrote:
>
> Can you please add the following branches:
>=20
>   ep93xx-cleanup
>   ep93xx-fixes
>=20
> from the ep93xx git tree:
>=20
>   git://github.com/RyanMallon/linux-ep93xx.git
>=20
> To linux-next. Both branches are stable and based on v3.4-rc2. Testing
> for the tree is covered by the arm ep93xx_defconfig.

I have added these from today as ep93xx-current (fixes for Linus' current
tree - branch ep93xx-fixes) and ep93xx (stuff for the next merge window -
branch ep93xx-cleanup).  I have listed just you as the contact in case I
have problems (conflicts, build failures, unable to fetch etc).

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

--Signature=_Tue__1_May_2012_10_27_15_+1000_tZA1y/_T+CvvJygs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPny3jAAoJEECxmPOUX5FEcJ4P/0GcncB5oNC/obSZ/Oqv4xy2
QtffUA3q6Be+0axlRD7RlcX6Ve1+Y3DJSClpYgquK4CUG5EONW5wwi6h3j+7vsV0
zNEpU1X8/ZL+Nj3QZomH1qAcKvn33KfNdJ8TQUgOzihheUnjCWgDDsK3aIEQpnUo
RrEmI3sw92+2pEtXZ7nqRgvwzqWlFY94EDoCJC3+9yYcf84FXEJzsQJ6sO3wZq+C
ylj5orIOsMCokNYfGVBmNeOZjAOiD5D+kd5hknHriaiGU+kngguxvDE05qsYEalP
NsZSSPOpMQCAx/3Y9GRBlkLgfzv7TFIqBDCLncrZkUFFSuLe7s7nn6wD1g+tgM45
PVmLZ5rn9gXNjnhCj8I1tZBjElfm+coLJftezaXiZz7tcCbhgJmpsRmx087qKEwA
2cAAVwLijud4UhNEWWbFAo41UVIkUs0xnIrP8O5KsntHvOYBThwTBZlv7Yji3dal
cSs+q2qqkUg+LvWuiYikzQ07FgTwks4KRxY76lmxxrYM0ol9K0svsTK6bVI7+TJl
5we4gnPHMiS6Xkx60DcoCrpj1pc3CYOBCiSAHA5Oc/OAVgh5nThKYDaavThbnlF0
JgIRh6zHGOHiORVGUqtx672wye4PrIPxFhU2mLlDWo7juJZIWfFq39yeBg7kur0v
zQDb7z3RyWP335XK+mgm
=bT4A
-----END PGP SIGNATURE-----

--Signature=_Tue__1_May_2012_10_27_15_+1000_tZA1y/_T+CvvJygs--
