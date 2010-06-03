From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rr tree
Date: Thu, 3 Jun 2010 11:48:15 +1000
Message-ID: <20100603114815.08387225.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jun_2010_11_48_15_+1000_ujo4rpxT.QbgkbWx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48635 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932590Ab0FCBsW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jun 2010 21:48:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Jun_2010_11_48_15_+1000_ujo4rpxT.QbgkbWx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

kernel/module.c: In function 'load_module':
kernel/module.c:2407: warning: 'hdr' may be used uninitialized in this func=
tion

Probably introduced by commit 601b979485d01750ea17cf138e209d81acfe63b5
("module: refactor load_module part 3").  Its a false positive :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jun_2010_11_48_15_+1000_ujo4rpxT.QbgkbWx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwHCd8ACgkQjjKRsyhoI8ygQACfTx0gipgeKmetAAEU1zs93kJm
PdQAn211IkXpFdoki3Of9oCmOI/jSQ8i
=5fnE
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jun_2010_11_48_15_+1000_ujo4rpxT.QbgkbWx--
