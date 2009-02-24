From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cpufreq tree build failure
Date: Tue, 24 Feb 2009 17:21:12 +1100
Message-ID: <20090224172112.727b4043.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Feb_2009_17_21_12_+1100_ZNUPdy9c6nuT+ppZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59611 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751411AbZBXGVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2009 01:21:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Matthias-Christian Ott <ott@mirix.org>, Dominik Brodowski <linux@brodo.de>

--Signature=_Tue__24_Feb_2009_17_21_12_+1100_ZNUPdy9c6nuT+ppZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "recalibrate_cpu_khz" [arch/x86/kernel/cpu/cpufreq/p4-clockmod.ko] u=
ndefined!

Caused by commit f20b61aa18b99d91c2a08f8863409bb8002d87fb ("[CPUFREQ] p4-cl=
ockmod reports wrong frequency").

I have dropped the cpufreq tree for today.

--=20
Cheers,
Stephen Rothwell

--Signature=_Tue__24_Feb_2009_17_21_12_+1100_ZNUPdy9c6nuT+ppZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmjkdgACgkQjjKRsyhoI8wrggCdEgLYxWiQ9uMh/V14UAU5qqeU
7dEAmQHL6RxRiRZcV9iSsSP9kFcdANL1
=Ogi4
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Feb_2009_17_21_12_+1100_ZNUPdy9c6nuT+ppZ--
