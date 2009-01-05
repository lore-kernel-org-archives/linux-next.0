From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Pull request for Squashfs
Date: Mon, 5 Jan 2009 23:52:41 +1100
Message-ID: <20090105235241.3a2d54fc.sfr@canb.auug.org.au>
References: <E1Kv0C3-0006GU-ES@dylan>
	<20081028192919.94def38b.akpm@linux-foundation.org>
	<4961FD0C.8040309@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__5_Jan_2009_23_52_41_+1100_RQ_PWJrZ=vJ_k4HY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36063 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751003AbZAEMwy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 07:52:54 -0500
In-Reply-To: <4961FD0C.8040309@lougher.demon.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Mon__5_Jan_2009_23_52_41_+1100_RQ_PWJrZ=vJ_k4HY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phillip, Andrew,

On Mon, 05 Jan 2009 12:29:00 +0000 Phillip Lougher <phillip@lougher.demon.c=
o.uk> wrote:
>
> Andrew Morton wrote:
>=20
> > Generally looks OK to me.  Please prepare a tree for linux-next
> > inclusion and unless serious problems are pointed out I'd suggest
> > shooting for a 2.6.29 merge.
>=20
> Can you try pulling the master branch of:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
>=20
> into linux-next please?
>=20
> The Squashfs patches have been tested.

Is this intended for 2.6.29 (even this late) or should I wait until after
-rc1 to add this to linux-next?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__5_Jan_2009_23_52_41_+1100_RQ_PWJrZ=vJ_k4HY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkliApkACgkQjjKRsyhoI8wn7wCgiwHtG9EMV57kVZVSqjxNsDBW
K3UAoI+2zkX54tKj/EXvQLJwuxWW2jmj
=LMwG
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Jan_2009_23_52_41_+1100_RQ_PWJrZ=vJ_k4HY--
