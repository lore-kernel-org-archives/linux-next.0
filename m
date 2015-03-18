From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the virtio tree with Linus' tree
Date: Wed, 18 Mar 2015 12:40:36 +1100
Message-ID: <20150318124036.2a71a232@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XR_K6Myi.K5Wu5tKR2rFwRu"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43342 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753500AbbCRBkn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 21:40:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

--Sig_/XR_K6Myi.K5Wu5tKR2rFwRu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the virtio tree got a conflict in
net/9p/trans_virtio.c between commit 8051a2a518fc ("9p/trans_virtio:
fix hot-unplug") from Linus' tree and commit 1991755689ad
("9p/trans_virtio: fix hot-unplug") from the virtio tree.

I fixed it up (the latter is an older version the former, which is now
in Linus' tree) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/XR_K6Myi.K5Wu5tKR2rFwRu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCNeYAAoJEMDTa8Ir7ZwVjA0P+weXlERpLAyTyl/Ex6GlRSGJ
8qnHgh1lIOtOlST8lUTXwn5f4tEdiEv/sYi04pbtkCpZvuk8YgUe+J9E4GinKQ4D
StKAaZUfN9elrM26loU9x5rWtxu/D6Hj4i49R8SJ4D9+SebosOURhds0o65zkkCh
OI7jl8EbU3fLfibH85jP+Sm+kOgTMMgM59C7Frtg0Utl0PqToY/3RtIFGjZluZ4S
YDxaKS3lO9VIwNyS3I/2zkuHK1DPd8rvSnEFCYW+XqnBM1DlZpdVkEjRMupNHh0Q
G+pPqqPq/SPv2znCrrrPiq2ex1KdZMaRSjVkYh6Bp3NjOAeRMnkpP9SlYREt48SB
JzIi01lFPMmrim1bxaPNpchBVHpPfzm9aKl/M7n9uFpwLT97KyC6iaeS157N4Trz
7wVNqat9XUv9ry9/5UYPc/JSj9EoQF8Pcop/dEnUxijJwU1vqAT5q+dyYR08xQBF
Y0ms20L3gSj8ctMVN5eXwVd0uEVZT/CoPvReqrLynr6/B3D6vQXvqU5WP7hmpW1o
ylcTiHbGKVeK85Hw4UqQBAqGVADsK3aFH+gyUcUHPsIfdGIQTY9MabMidOPk8p4G
yB1WB+hfM0hROKqGn7nw27/Hb0yoGA/rLXXczoCtIxj4eqy9mdYg0UfLjy4nvszj
Q4QJDNbxGCTESbNk2F3t
=7LRl
-----END PGP SIGNATURE-----

--Sig_/XR_K6Myi.K5Wu5tKR2rFwRu--
