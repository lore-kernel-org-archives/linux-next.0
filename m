From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request inclusion of ARM v7 cache optimization patch into
 linux-next
Date: Tue, 26 Nov 2013 10:33:43 +1100
Message-ID: <20131126103343.bb5990829d3c0f2c0fc0723d@canb.auug.org.au>
References: <20131125112318.GA4179@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__26_Nov_2013_10_33_43_+1100_1MsEIEux=Dz90V2M"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:52852 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab3KYXdz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Nov 2013 18:33:55 -0500
In-Reply-To: <20131125112318.GA4179@e102568-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk

--Signature=_Tue__26_Nov_2013_10_33_43_+1100_1MsEIEux=Dz90V2M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Mon, 25 Nov 2013 11:23:18 +0000 Lorenzo Pieralisi <lorenzo.pieralisi@arm=
.com> wrote:
>
> can I ask you please to include the following branch into linux-next:
>=20
> git://linux-arm.org/linux-2.6-lp.git v7-cache-opt
>=20
> It contains a patch implementing cache optimizations for ARM 32-bit v7
> architectures, it was reviewed and tested but -next would give it wider
> test coverage before it gets merged in the coming cycle, so please
> include it as soon as you deem fit.

Included from today.  Please remember to ask me to remove it when it has
been merged upstream (since I assume it will no longer be necessary).

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

--Signature=_Tue__26_Nov_2013_10_33_43_+1100_1MsEIEux=Dz90V2M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSk95cAAoJEMDTa8Ir7ZwVxeoP/Apo/Bnv/W4V0/d3xyYWB5nC
mswruRqx9uOhuV4c2CJYsbLEQ3jOXijixOf8iUJSVzDZHv+eW5cDK/fdxqe3UTc8
rQ5ccXwpu9GqWyZNZBns6SaPj3LBnwVxE5EdTSyYzsAJTpJ0MkbNbCM/R5TGriHQ
HyxNfY9Lc5QMtRiGh1yhTZN6+sPAq+uCXTuT+jAahuJaxMKB7vVLhlBwtXRtdZcp
uzQwU+oa0h4nwjcVFUI9xVNsFbTSLaNsdsUMFKmIlSZnv5+Nbrtp0IIU/AxxSTUt
sLpVDPSKTyouDn+jkoc3CJk1+xa3L0tEfR711Glzo5M8lbGxVCkZGZkWUj/5ByUh
ahc1X/QrB31F8jwiqvfpLZT6IezAMAufc+yZWYdAAMLqBURMTWvZkmhg00wgxI40
uk3gEYskGndY7wNq9OFuyk4Nh++gm130PP7Q79QAbZ8T8qKLwf9+cdWsujwb9UFn
R2g5Czx/N7fKTd9crlBgQq/9I31z9MXRNg5CY7CzFIKKMsFxNVRtNFebGbXB4cEA
c1p0u6O04OWzqUsBLvRIDYr3DcgdSB/tXRI3nB9TKyesiNmYTLeZesk/vhjYI6Ov
V98KiTjDTowfoBhXiuw390tsHjUrhJtmGh9wNthxHP7kCX7OITZ88pTeZAJmpoMy
LLaH70JBUTMYwvOPhT24
=aaWL
-----END PGP SIGNATURE-----

--Signature=_Tue__26_Nov_2013_10_33_43_+1100_1MsEIEux=Dz90V2M--
