From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cpufreq tree build failure
Date: Thu, 5 Feb 2009 18:54:20 +1100
Message-ID: <20090205185420.38214a06.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_18_54_20_+1100_byrQk9SV6i6.0tnT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42000 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753129AbZBEHy2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 02:54:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Thomas Renninger <trenn@suse.de>

--Signature=_Thu__5_Feb_2009_18_54_20_+1100_byrQk9SV6i6.0tnT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/cpufreq/cpufreq_conservative.o: In function `minimum_sampling_rate':
(.opd+0x30): multiple definition of `minimum_sampling_rate'
drivers/cpufreq/cpufreq_ondemand.o:(.opd+0x18): first defined here
drivers/cpufreq/cpufreq_conservative.o: In function `minimum_sampling_rate':
drivers/cpufreq/cpufreq_conservative.c:64: multiple definition of `.minimum=
_sampling_rate'
drivers/cpufreq/cpufreq_ondemand.o:drivers/cpufreq/cpufreq_ondemand.c:62: f=
irst defined here

Caused by commit f935195b8a341d7ffdf600dd98a657f2f09b7908 ("[CPUFREQ]
ondemand/conservative: sanitize sampling_rate restrictions").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_18_54_20_+1100_byrQk9SV6i6.0tnT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKmywACgkQjjKRsyhoI8w+3ACfXeTYVfYa2b6nk7kKocFinqMt
fy8An0Kz5F9ZubIduosBk3Pfj9oTvhUX
=NMAB
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_18_54_20_+1100_byrQk9SV6i6.0tnT--
