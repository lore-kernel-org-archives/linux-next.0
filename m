From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: new stuff in the btrfs tree
Date: Thu, 14 Aug 2014 10:07:50 +1000
Message-ID: <20140814100750.5c6368f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9_AEYAbPdzcGmqtO2B/LMsi"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41365 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752422AbaHNAIE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2014 20:08:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/9_AEYAbPdzcGmqtO2B/LMsi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Are all the commits just added to the btrfs tree really intended for
v3.17?  If not then please remove them until after v3.17-rc1 is
released.  If so, then they are very late :-(

I suspect the latter because some of them seem to date from June (and a
few even from February).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9_AEYAbPdzcGmqtO2B/LMsi
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT6/3hAAoJEMDTa8Ir7ZwVNssP/08mj8FUVa74aBZtM8Xxf+L9
/0ipudRVDwRX1uEOW4pEitx66VfZ2pj5r65LCbOtsqQMeazqAwBcJmpSXHSlad2g
2EaIM45Vv7l8AVSNJjxOAIepwxoM2rvlwXD96HQ80SYx9kKrYGtnnnogzOjNkGr0
TKjvJ+dnczwJL5QtnTiK3eOlSgPnUAFAjP6DkOCQGzo5upFNZ1El8j4AtRd0pLeF
QEi2lMcUgWas4AnZhXiKHBa2cJRfFKUH+ORgW5l8/idbk9IcrlDqFlBTbSiPlCDT
Mtw/3VEtzyRhKQ+8UDkyfbBbh9fZOMwhvdwA3FwrT3U3nP2cgC+bg6zfZfxA89Mo
1UrZkfPHAJliIpGgsQ7qiuYm3BEPqiHVIuer77fgK9bCRAMYsf9zt9j1jG9YYHwu
JU/ChvqYMzDLZ3zsdSxrvUMGs+fi8fXcR0utngGGtc8fkG+P/t/9ZQOgz3j+hN1H
wx5pRKyNnpXB5C+spAVLXZijC6e5l1y4LmI8zDC5ObGmkdjmfQV0RgaHNb29rvJN
l4o6P5qMfwejeIPJmUfBoCMSvlKGJMJcU/nh6QmV7Ox+SHyTA4hEG8kMkAgE217k
m6dWjoAEtcG9Qv1fTkZkICPbHnJyvnUbVBS3BD7IAKc15QcR2d2BhQzTB7C7MpJS
gO5JQsUgN2l2cx6NZKwO
=BhVX
-----END PGP SIGNATURE-----

--Sig_/9_AEYAbPdzcGmqtO2B/LMsi--
