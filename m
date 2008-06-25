From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Wed, 25 Jun 2008 16:58:25 +1000
Message-ID: <20080625165825.60fdd9e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Jun_2008_16_58_25_+1000_Syby+HhYQSCffR3A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44898 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754532AbYFYG6h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 02:58:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>

--Signature=_Wed__25_Jun_2008_16_58_25_+1000_Syby+HhYQSCffR3A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig (CONFIG_VIRTIO_CONSOLE=3Dy,
CONFIG_VIRTIO=3Dm)) failed like this:

drivers/built-in.o: In function `init':
drivers/char/virtio_console.c:245: undefined reference to `register_virtio_=
driver'

I assume it is caused by commit 6588784e224baacbc209ce32bd82d92ab05ae0e8
("virtio_console: use virtqueue notification for hvc_console")  which I
have reverted for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Jun_2008_16_58_25_+1000_Syby+HhYQSCffR3A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhh7JEACgkQTgG2atn1QN8nsACfVTvNXQ4dgdfrjVFsWkZwkNZs
mhQAn0dXiCiSxY/xuX1blvV8H7i5PcNa
=ImIe
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Jun_2008_16_58_25_+1000_Syby+HhYQSCffR3A--
