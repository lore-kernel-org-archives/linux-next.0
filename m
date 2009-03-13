From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lblnet tree build warnings
Date: Fri, 13 Mar 2009 16:32:52 +1100
Message-ID: <20090313163252.6333812e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__13_Mar_2009_16_32_52_+1100_1jr/ueKjCnIplKHH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59044 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753064AbZCMFdH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2009 01:33:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__13_Mar_2009_16_32_52_+1100_1jr/ueKjCnIplKHH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (powerpc ppc64_defconfig) produced these
warnings:

In file included from net/ipv4/ip_options.c:26:
include/net/cipso_ipv4.h: In function 'cipso_v4_req_delattr':
include/net/cipso_ipv4.h:264: warning: 'return' with a value, in function r=
eturning void
In file included from net/ipv4/sysctl_net_ipv4.c:22:
include/net/cipso_ipv4.h: In function 'cipso_v4_req_delattr':
include/net/cipso_ipv4.h:264: warning: 'return' with a value, in function r=
eturning void

Caused by commit d584c27edca286826e9145a3158f03e3bc81a6c0 ("netlabel:
Label incoming TCP connections correctly in SELinux").  (BTW, that commit
has no Signed-off-by.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Mar_2009_16_32_52_+1100_1jr/ueKjCnIplKHH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm58AQACgkQjjKRsyhoI8zrmwCeL3opY9uaePBoX1WUMcw0yjoD
G8AAoIka8FqxUFuJZqqwtZu0Vz34dqX2
=PAgx
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Mar_2009_16_32_52_+1100_1jr/ueKjCnIplKHH--
