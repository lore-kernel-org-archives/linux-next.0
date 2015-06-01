From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the uml tree
Date: Mon, 1 Jun 2015 12:05:39 +1000
Message-ID: <20150601120539.1f9a84a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1zfXeSaB/C+xLuYGAaZoLRD"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50044 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752078AbbFACFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 22:05:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Richard Weinberger <richard@nod.at>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/1zfXeSaB/C+xLuYGAaZoLRD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/hppfs/hppfs.c between commit f74a14e870c8 ("um: Remove hppfs") from
the uml tree and commits 680baacbca69 ("new ->follow_link() and
->put_link() calling conventions"), 6e77137b363b ("don't pass nameidata
to ->follow_link()") and 5f2c4179e129 ("switch ->put_link() from dentry
to inode") from the vfs tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/1zfXeSaB/C+xLuYGAaZoLRD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa734AAoJEMDTa8Ir7ZwVlbgP/RtQs5HMNtT8oyIR/Bsx2bUo
RwEndlIdlGtiXAAM4S9IRgZBmfoiF6PfKpfDEWk95FPQxWYui9dAujIHIoaBZ+mv
oKSM30DI9s1MiNrrR6IQLbuc1i02fvdrzvH6erFGK8E5aNcJP6M0Tpu5PWBA/XaA
REDcqWSj32ObRtkRuxUZcyX5dVSKku8pf4a6qOuLxw8rI8eB3gqazOVunScb/Irw
TC92SqaIi0EL692gnyxWhB3Ww+l0EGwj+JsoOUy43N+CiLewqERYqJwFf+2az0wc
Q/7ttP33vOksQmQkCjRgySayLJidGZcHsKL/y54k5C92PXmZEaVs9PAao1F/JBTI
rY+zsQDBjj8dIfe1byrotFSN7f8TPQG6jWdRTXwf+jRm1ilBEPmVq9G7DGhEV5av
Chs/6PW2DMIGXCYOzGcSqob5ok164TqII2Cxju0Su/RcQvQ2fZWpyuQeMwt40Plp
tio2xKJX6X2+QCdXcs3oLpwUMNSAL43XmGb/vEAEnbFBvIiUHlIYIgWmRvungYaZ
4wam0bntfWAV/muzc3wfhkZx3rfS348PuRexo84b8nBHAP3QsKudfaQh/XMwqsfI
oY141AT/Z/PCSUvVDTr2oY5HEoYHbUwCedgswp7JlutAm5VGC5AWns4+51W0OGv6
E9cWN54lmXMMLN6Fel1Y
=78MD
-----END PGP SIGNATURE-----

--Sig_/1zfXeSaB/C+xLuYGAaZoLRD--
