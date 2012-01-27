From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Fri, 27 Jan 2012 12:53:15 +1100
Message-ID: <20120127125315.e6e70511badf68c4e760afc3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__27_Jan_2012_12_53_15_+1100_nSPKJPZvT+xC.6g_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48300 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751645Ab2A0Bxj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jan 2012 20:53:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>, Antti Miettinen <amiettinen@nvidia.com>, Diwakar Tundlam <dtundlam@nvidia.com>, Scott Williams <scwilliams@nvidia.com>, Yu-Huan Hsu <yhsu@nvidia.com>, markgross <markgross@thegnar.org>

--Signature=_Fri__27_Jan_2012_12_53_15_+1100_nSPKJPZvT+xC.6g_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/power/process.c: In function 'thaw_kernel_threads':
kernel/power/process.c:199:2: error: 'g' undeclared (first use in this func=
tion)
kernel/power/process.c:199:2: note: each undeclared identifier is reported =
only once for each function it appears in
kernel/power/process.c:199:2: error: 'p' undeclared (first use in this func=
tion)

Caused by commit 625278ca8016 ("PM / QoS: Simplify PM QoS expansion/merge").

Clearly never built :-(  At least, not in this form.

I have used the pm tree from next-20120125 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__27_Jan_2012_12_53_15_+1100_nSPKJPZvT+xC.6g_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPIgOLAAoJEECxmPOUX5FEr04P+wQMzYzLL1enHc2uIAVudGq6
dgGDoce62CvKgFia2502Rp/e4s6QQuLL0FWx97Zd69Sk/t7tdA7eL9BQRZKJ2t6W
7TaQex5hsW1vlyeOnBKCVUbdX33pPNsessSryJFCEC9NH529BThRrmUT+xzc8SIo
eWK3zY908UbagypGHqRkS+08gkWveAd0s+Gz0Bte+EhHEW4e3kghcSR+tolJFufO
/KQYI+8w8ClEBsgXaU+RS8SAiEc/YbtpSSbR8cl5lGa0se95yFaozNjaeHLFyLrr
1QUaf/BKg/xf1jJvxtMUh8A7dkGdDxRgADfd1+F88bEsNBZRZ2YTpjdouj3wdeVR
jqQagSbK2ePmo5HvnrJL0SvWRtsiaaAwapn5SOSVXYo4OnGxVrBP/C/9gdkDOI/a
uVTAXPUAjzEdg2YBw4bKXAzIS2AOV5o7bmib7t3swxxixoYM5OUDKkwZUyS5HfvR
ioJspqdrkN3n/Gs+zrTRiiiiNvchZO2VPidM2lzM21R+lEf2EPruYPuKjgSt5NBh
60VmvA0y/dL1J+G/GUmWvw81ATayO9sGjjbN7XStcyj6YiDuElR4IgTltjPAdZEi
8Vz1gK7PVQ+QfAIYKfbo6eQHhkDAA+DRMXimTpnsUZLCJFaUCL5GIH4wZL+Df0zs
IqKbvSpNAoA8f4j8Qjjs
=wTGo
-----END PGP SIGNATURE-----

--Signature=_Fri__27_Jan_2012_12_53_15_+1100_nSPKJPZvT+xC.6g_--
