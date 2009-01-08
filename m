From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nommu tree
Date: Thu, 8 Jan 2009 15:30:09 +1100
Message-ID: <20090108153009.96d9d01a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__8_Jan_2009_15_30_09_+1100_4zr9kI7ncI/XeFvI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59798 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752690AbZAHEad (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Jan 2009 23:30:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org, Matt Mackall <mpm@selenic.com>

--Signature=_Thu__8_Jan_2009_15_30_09_+1100_4zr9kI7ncI/XeFvI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the nommu tree got a conflict in
mm/tiny-shmem.c between commit 853ac43ab194f5051b27a55060215d696dc9480d
("shmem: unify regular and tiny shmem") from Linus' tree and commit
d10f9907ba3626261f45dbb498867f441f06c486 ("shmem: remove unused
shmem_get_unmapped_area") from the nommu tree.

The former removed the file and so have I.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__8_Jan_2009_15_30_09_+1100_4zr9kI7ncI/XeFvI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkllgVEACgkQjjKRsyhoI8xyBACfTRU0g48CwxdzZTDS+07y09Vf
YkMAoKwqSXKB0Wl3AutoQn/7j/KkeoVy
=YOh6
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Jan_2009_15_30_09_+1100_4zr9kI7ncI/XeFvI--
