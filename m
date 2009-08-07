From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Fri, 7 Aug 2009 14:59:32 +1000
Message-ID: <20090807145932.77bc2c98.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Aug_2009_14_59_32_+1000_hsPb.fX.AkksnJXL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49193 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753981AbZHGE7y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Aug 2009 00:59:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>

--Signature=_Fri__7_Aug_2009_14_59_32_+1000_hsPb.fX.AkksnJXL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

kernel/sysctl.c:1321: error: 'mmap_min_addr_handler' undeclared here (not i=
n a function)
mm/mmap.c: In function 'do_mmap_pgoff':
mm/mmap.c:935: error: implicit declaration of function 'round_hint_to_min'

Caused by commit a2551df7ec568d87793d2eea4ca744e86318f205
("Security/SELinux: seperate lsm specific mmap_min_addr") -
CONFIG_SECURITY is not set in this build.

I have used the version of the security-testing tree from next-20090806
for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Aug_2009_14_59_32_+1000_hsPb.fX.AkksnJXL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp7tLQACgkQjjKRsyhoI8xsnACfY4TeDil/cpQH6jE1KQew+v+5
+F0An3J/OU9M9hJhnGt6RRmBjk/5kGvd
=cX4y
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Aug_2009_14_59_32_+1000_hsPb.fX.AkksnJXL--
