From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: security-testing tree build failure
Date: Wed, 12 Nov 2008 16:05:53 +1100
Message-ID: <20081112160553.33ad43df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Nov_2008_16_05_53_+1100_K0io.hlA_oBlC8Y/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60166 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750778AbYKLFGL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 00:06:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>, Stephen Smalley <sds@tycho.nsa.gov>

--Signature=_Wed__12_Nov_2008_16_05_53_+1100_K0io.hlA_oBlC8Y/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from init/main.c:35:
include/linux/security.h:1788: error: static declaration of 'security_capab=
le' follows non-static declaration
include/linux/capability.h:524: error: previous declaration of 'security_ca=
pable' was here
include/linux/security.h:1793: error: static declaration of 'security_capab=
le_noaudit' follows non-static declaration
include/linux/capability.h:525: error: previous declaration of 'security_ca=
pable_noaudit' was here

Caused by commit 06112163f5fd9e491a7f810443d81efa9d88e247 ("Add a new
capable interface that will be used by systems that use audit to").

Please compile test with and without CONFIG_SECURITY.

I have dropped the security-testing tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__12_Nov_2008_16_05_53_+1100_K0io.hlA_oBlC8Y/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkaZDEACgkQjjKRsyhoI8yOSQCeLmOs4yZRi7t+mwSRKl0qUzgj
uY4An0W52/hadDrLpKmq6lxDQwBy1FEU
=YsJm
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Nov_2008_16_05_53_+1100_K0io.hlA_oBlC8Y/--
