From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: cifs tree build failure
Date: Wed, 15 Apr 2009 12:59:40 +1000
Message-ID: <20090415125940.98f40db3.sfr@canb.auug.org.au>
References: <20090414114153.00467d45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__15_Apr_2009_12_59_40_+1000_NPKPIkAIS0/8256h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49427 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756105AbZDOC7u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 22:59:50 -0400
In-Reply-To: <20090414114153.00467d45.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Shirish Pargaonkar <shirishp@us.ibm.com>

--Signature=_Wed__15_Apr_2009_12_59_40_+1000_NPKPIkAIS0/8256h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Tue, 14 Apr 2009 11:41:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>=20
> fs/cifs/dir.c: In function 'cifs_lookup':
> fs/cifs/dir.c:664: error: dereferencing pointer to incomplete type
>=20
> Caused by commit 84c63ad9195b37b3de43427c11471a763c3993cc ("[CIFS] Add
> support for posix open during lookup") from the cifs tree (probably an
> interaction with commit 5ad4e53bd5406ee214ddc5a41f03f779b8b2d526 ("Get
> rid of indirect include of fs_struct.h") - now in Linus' tree).
>=20
> I have used the cifs tree from next-20090409 for today.

Still there.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__15_Apr_2009_12_59_40_+1000_NPKPIkAIS0/8256h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknlTZwACgkQjjKRsyhoI8zLMgCfZUar8ec3F7MQMA+QK99GBTat
UlcAn1hpY5es9/rCRE+RC2IPlRZYpdS6
=nsjZ
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Apr_2009_12_59_40_+1000_NPKPIkAIS0/8256h--
