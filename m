From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: drm tree build failure
Date: Wed, 4 Feb 2009 16:33:18 +1100
Message-ID: <20090204163318.0ebba7e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__4_Feb_2009_16_33_18_+1100_ZKw9u.2+NP_NbS+I"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60915 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750886AbZBDFd0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 00:33:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IktyaXN0aWFuIEjDuGdzYmVyZyI=?= <krh@redhat.com>

--Signature=_Wed__4_Feb_2009_16_33_18_+1100_ZKw9u.2+NP_NbS+I
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/gpu/drm/radeon/radeon_drv.c:98: error: unknown field 'dri_library_n=
ame' specified in initializer
drivers/gpu/drm/radeon/radeon_drv.c:98: warning: initialization from incomp=
atible pointer type

Caused by commit 9a6c3df9d95d4986b55a6de951310aaf9e3c9546 ("drm: Drop
unused and broken dri_library_name sysfs attribute").  Grep is your
friend ...

I have dropped the drm tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__4_Feb_2009_16_33_18_+1100_ZKw9u.2+NP_NbS+I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmJKJ4ACgkQjjKRsyhoI8xczACfX1FYJT33AfdZme2x3IiXfRWX
0nQAoL6zj+o+gTeLoUdrRO7481qgdj56
=CrkT
-----END PGP SIGNATURE-----

--Signature=_Wed__4_Feb_2009_16_33_18_+1100_ZKw9u.2+NP_NbS+I--
