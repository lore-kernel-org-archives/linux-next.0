From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-updates tree with Linus'
 tree
Date: Mon, 1 Jun 2015 20:58:03 +1000
Message-ID: <20150601205803.0e77fecf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hscHD7V7dvRn_G+ASAWbolQ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47774 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbbFAK6S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 06:58:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Grover <agrover@redhat.com>, Christoph Hellwig <hch@lst.de>

--Sig_/hscHD7V7dvRn_G+ASAWbolQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

Today's linux-next merge of the target-updates tree got a conflict in
drivers/target/target_core_device.c between commit a3541703ebbf
("target: Use a PASSTHROUGH flag instead of transport_types") from
Linus' tree and commit 1362adc724c4 ("target: Subsume se_port +
t10_alua_tg_pt_gp_member into se_lun") from the target-updates tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/hscHD7V7dvRn_G+ASAWbolQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbDrIAAoJEMDTa8Ir7ZwV/cEP/iRW8fndcyqkbsPHRBHwmiKo
lbqNAvIDaoMinGRM+ZecrCYhLGync9omYN7huECRyUgKLHEL4WzAcTBiaqMyagcj
QHE4uipk4+I6b6D4ocD41O8Ke6qMvJmUr18DUj9jb6PSlarwsEzcG0I/yrCOBLiJ
YZg4qMrQ0Cj09OhttsQdxPEoKHV6fTzxF7tPJwBxJOnV0a/DH0ZS8sfS1KnBUQkA
w0DQ0vBtACKG3KZgcbv4hK7t6K4eptsep989Z61F46gU0tyWiUsW/1dLD28E/KQU
0wpevF9jnG/McZsrNIszCYsoleLSuPADcWRxe6W/eI3q8L7RqOywqyjp6X0gexvw
gINPa1YRFihRdO7T6R8VWJpzQTBtCr3uVVFGxQ4ahBR7LkzxWzB3HNpx5CTLOysM
4kxR9Oe3I1FQ08P4w8dwTYaA/jYOWcToU6NP0GR/ky72F7W1xgJ/EoSK5dX5N8Vg
Hn9dGQmVDmhTLKGmffgNRHJDhLCc2PxlfhSUcCUq+b4znSDsIIfaFTZimE+sY8FW
VStI4vtIAEsiHLDAgDgeUVfcvgyD/zFU4WvQgYr2SpKe+CidDPgNARZT+Kt6R9TM
R7YuHND+TW/lNG8FP/AAO3ZUpiYVBAhw3B4CSiP0iFD/v+oeHq3btCEFvCx84POo
juFsTeBvd81A/HvZ44iA
=/sTk
-----END PGP SIGNATURE-----

--Sig_/hscHD7V7dvRn_G+ASAWbolQ--
