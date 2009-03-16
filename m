From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build warning
Date: Mon, 16 Mar 2009 19:14:34 +1100
Message-ID: <20090316191434.47e98665.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_19_14_34_+1100_8rYaeMDFY_xEY6O0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37744 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753573AbZCPIOm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 04:14:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Mar_2009_19_14_34_+1100_8rYaeMDFY_xEY6O0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/md/raid5.c: In function 'ops_run_compute6_1':
drivers/md/raid5.c:737: warning: 'target' may be used uninitialized in this=
 function

Introduced by commit 5b3de0be4eb1545f4425118620cf065e703fa731 ("raid6 bug
fixes").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_19_14_34_+1100_8rYaeMDFY_xEY6O0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+CmoACgkQjjKRsyhoI8wU8gCfb9xtdzXjDdV8DVrc4U0YPtry
YWUAoIZ40+4hSvjS+6QDplzEz03bDMLH
=8gEk
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_19_14_34_+1100_8rYaeMDFY_xEY6O0--
