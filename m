From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Wed, 11 Nov 2009 14:01:26 +1100
Message-ID: <20091111140126.044be7d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Nov_2009_14_01_26_+1100_2Q.xqeo9lb05HZGY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52124 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753132AbZKKDBZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Nov 2009 22:01:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__11_Nov_2009_14_01_26_+1100_2Q.xqeo9lb05HZGY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

.tmp_exports-asm.o: In function `__ksymtab_load_gs_index':
(__ksymtab_sorted+0x5b40): undefined reference to `load_gs_index'

I have used the version of the rr tree from next-20091110 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Nov_2009_14_01_26_+1100_2Q.xqeo9lb05HZGY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr6KQYACgkQjjKRsyhoI8wo9gCgpib5uita92hdAaDESi0uKSTZ
bnMAoL+r9WauITvPKcp1qoplRGbdUrzs
=MOyx
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Nov_2009_14_01_26_+1100_2Q.xqeo9lb05HZGY--
