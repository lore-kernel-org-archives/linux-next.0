From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the init tree with the arm tree
Date: Wed, 3 Jun 2015 19:21:06 +1000
Message-ID: <20150603192106.1d30ff5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EDgh6wZgONk3=14BklXf5F."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55154 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752774AbbFCJVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 05:21:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/EDgh6wZgONk3=14BklXf5F.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the init tree got a conflict in
arch/arm/mach-keystone/platsmp.c between commit 7517021b8a32 ("ARM:
redo TTBR setup code for LPAE") from the arm tree and commit
5639d871ecb2 ("arm/mach-keystone: remove legacy __cpuinit sections that
crept in") from the init tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EDgh6wZgONk3=14BklXf5F.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbscCAAoJEMDTa8Ir7ZwVQrsP/0wF1trGMqsFOlnbwbt6uO6u
iogt++BrGwjnGp6DEjtMwNWFYnunRuQiHV5HoCRURS45+AFwnGZZXj45+F6iixi2
Lu3tOQSa1NATnjQOYNSpbP1BtobvTSqJ/7OST52wmQDUpyrTN4GbqMe9JEi6Itss
6qUyFLz5eEbJXxXj6KuPo42YhF5enBIuyQ4qJYJNL8pCfwB1EUMJOW2kyq8SN0YX
2d/r/NAQE34wgqEFjgl5bhWRPzNGnaj8lZ/ZJg2iIjrwYje96XXRJhdKuO7dXtXf
98J+XYOHCTOmHgExrrprKGtudqNgxpiXNKL4tMMCfEJUvCuNzle6oHHPpNO1mWkw
ygN8C2VuUvs/xNQuMv7GQ8bel2cvuK98MPkmvs+UWkh5QWAk9lvBT8bbz4h7DjlN
yezUR0sFvMcVRmatJjNW11ZigoC81+R7tA0qq5PfK5rRl5G4//qRFH8H7DaksqMy
cbvsh7rootiJQK/Tk4LDnGfRJkcRldTJ0LVZDJRSs9rW4Seqyh+Nclglts1vCBQl
7u5pAkKuXsMY4xNvJOqe3rjh+X9XM/uSqKKfq+1HZJcxtmCz91k2Phtp6T2j3VgS
62ks/hGPUlCPJlbSi/ybb1sT+B1W/hrn6Lo3XePEMJLQhUaj7+wJT+tQEhUIjsGJ
c7SdvFE2TV4xUcSveIZl
=fWGf
-----END PGP SIGNATURE-----

--Sig_/EDgh6wZgONk3=14BklXf5F.--
