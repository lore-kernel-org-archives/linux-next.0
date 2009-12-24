From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kgdb tree build failure
Date: Thu, 24 Dec 2009 11:56:24 +1100
Message-ID: <20091224115624.77c910d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Dec_2009_11_56_24_+1100_RfoTcT./rPGw=tj9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36924 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbZLXA4c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Dec 2009 19:56:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__24_Dec_2009_11_56_24_+1100_RfoTcT./rPGw=tj9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Today's linux-next build (i386 defconfig) failed like this:

drivers/built-in.o: In function `drm_fb_kdb_enter':
drm_fb_helper.c:(.text+0x6567a): undefined reference to `kgdb_active'
drivers/built-in.o: In function `drm_fb_helper_free':
(.text+0x65ec7): undefined reference to `dbg_kms_console_ops_unregister'
drivers/built-in.o: In function `drm_fb_helper_single_fb_probe':
(.text+0x6645d): undefined reference to `dbg_kms_console_ops_register'

Clearly, the kgdb patches need some more testing.  Please remove them
from linux-next until that is done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Dec_2009_11_56_24_+1100_RfoTcT./rPGw=tj9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksyvDgACgkQjjKRsyhoI8ydcQCfZAn1/aL7QDQJsSzCRKKcqyQt
bnYAoKHdywX4CAVUn3aKVmLGLftRVK4P
=ZmXq
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Dec_2009_11_56_24_+1100_RfoTcT./rPGw=tj9--
