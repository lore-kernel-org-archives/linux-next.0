From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the md tree
Date: Wed, 28 Mar 2012 14:32:04 +1100
Message-ID: <20120328143204.134662a493ade33ddd523821@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__28_Mar_2012_14_32_04_+1100_Jwr7rlols9pmR5DV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:51315 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755930Ab2C1DcY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Mar 2012 23:32:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>

--Signature=_Wed__28_Mar_2012_14_32_04_+1100_Jwr7rlols9pmR5DV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

After merging the md tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/raid5.c: In function 'analyse_stripe':
drivers/md/raid5.c:3209:33: error: 'struct stripe_head' has no member named=
 'devs'

Caused by commit 85e25cfc6bed ("md/raid5: fix handling of bad blocks
during recovery").

I have used the version of the md tree from next-20120327 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__28_Mar_2012_14_32_04_+1100_Jwr7rlols9pmR5DV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPcoY0AAoJEECxmPOUX5FEoroP/2b6gXdA/P6ZSns06mfCa9Ey
x/cUftDvJS2uJOFE2pNANV6uzN/kEjIlhIfceliU5yOKQyHgyoI1lU1ZrCYk+iFH
C/f1R8DwH89aDk49NMGOV9Z0VOiGvpfPIBN1eSFVZAMxs2/pA1ezONGPE/DpBypL
lOIJwwLLqYyTCwTTD+LsrQSBSrtv6HcLXabg5gP2aUhHRO2snic9FBORBXwN88d8
oYXjpFOqBXHkKSdQFRt/A8z5DWJLb6m6FHHbXRAGu9MEyDhToloDfVbl0b/YqPJh
zCjZru5ZWhJGkP7caCQzbxujiSduc+y3RnT993wkFkx8BiTUtaakxTmWnrX4MVqd
1ZDu78C6RR4ULExvTLVlMiIHmP4SyxfTJ6bOSLJADWo1GtuIFzyMthtKYW579cuB
hFSFZMMqokqredCV4gmb8zmnOiQWROHSTa78F0OkxxMl4F+AJbSkk0ekZF0B952G
aOcNVvA1BVB/5EUR0QgtSPIHjdWJhB0uJR2f2ZmdTxUk5tuI6kbo6ZD35AO0IH/y
kxt/RNS4XQ1o93zH7taOAdy6++zNCeBJTZzEiLW3MvltCSJ8PnpV8MioBN4cIJ//
NJteFT7nd6ttZsNbQxIaBzznHOLo/c+/Mu3v0zGX/slBYgR23YCDoZDuqWe4Lzuf
MZvMDVX7MyKzqfAvt7p3
=hTxf
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Mar_2012_14_32_04_+1100_Jwr7rlols9pmR5DV--
