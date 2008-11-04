From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: git tree with cputime changes
Date: Wed, 5 Nov 2008 02:01:39 +1100
Message-ID: <20081105020139.a6a2be85.sfr@canb.auug.org.au>
References: <1225725054.24817.15.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_02_01_39_+1100_HnEKHh4QmpJrTq/Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55161 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751938AbYKDPBr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 10:01:47 -0500
In-Reply-To: <1225725054.24817.15.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__5_Nov_2008_02_01_39_+1100_HnEKHh4QmpJrTq/Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Mon, 03 Nov 2008 16:10:54 +0100 Martin Schwidefsky <schwidefsky@de.ibm.c=
om> wrote:
>
> I've created the cputime git branch on git390.osdl.marist.edu with the
> improvements for the idle time accounting. I've got feedback from the
> ia64 and powerpc maintainers but nothing really conclusive yet. To find
> potential problems it would be nice if you could add=20
>=20
> 	git://git390.osdl.marist.edu/pub/scm/linux-2.6.git cputime
>=20
> to linux-next. The branch has four patches:

Sure, I have added it for the next tree.

> Martin Schwidefsky (4):
>       [S390] fix scaled & unscaled cputime accounting
>       [S390] idle cputime accounting

These first two aren't really s390 specific, are they?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_02_01_39_+1100_HnEKHh4QmpJrTq/Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkQY9MACgkQjjKRsyhoI8xwqwCguvqhTgOjBkzO4pqaaU4scuuB
ACsAnjxDoJb7oqz7LnjYiNsrVUKg7L8b
=3Fi9
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_02_01_39_+1100_HnEKHh4QmpJrTq/Z--
