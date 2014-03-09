From: Mark Brown <broonie@kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Sun, 9 Mar 2014 11:55:14 +0000
Message-ID: <20140309115514.GY28112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OMSrUQY9bOlYDMmd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38192 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105AbaCILzh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 9 Mar 2014 07:55:37 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--OMSrUQY9bOlYDMmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the arm-soc tree, today's linux-next build (20140309)
failed for arm64 defconfig like this:

/home/broonie/next/next/drivers/irqchip/irq-gic.c: In function 'gic_raise_softirq':
/home/broonie/next/next/drivers/irqchip/irq-gic.c:666:2: error: implicit declaration of function 'dmb' [-Werror=implicit-function-declaration]
  dmb(ishst);
  ^
/home/broonie/next/next/drivers/irqchip/irq-gic.c:666:6: error: 'ishst' undeclared (first use in this function)
  dmb(ishst);
      ^
/home/broonie/next/next/drivers/irqchip/irq-gic.c:666:6: note: each undeclared identifier is reported only once for each function it appears
in
cc1: some warnings being treated as errors
make[3]: *** [drivers/irqchip/irq-gic.o] Error 1

This is due to 8adbf57fc4294 (irqchip: gic: use dmb ishst instead of dsb
when raising a softirq) and has been going on for several builds now but
Stephen hasn't been including this build in his per-merge testing.  I've
abandoned arm64 testing since a simple revert causes problems for arm.

--OMSrUQY9bOlYDMmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTHFafAAoJELSic+t+oim9OXkQAIm/71GHMxm+rLJfUB6Y7TVn
zvKv8a9bzBc6bAw1MKo59FPrdpcKNmWdisrQf646H8yaaBDS+MtjyKCa01HKUNSr
PLdKocQW46rPjLhmCKGvBKBljYt8gG6Rd3R1DMimwzm4aW4N+M6qFaWlk04zVyU6
YKXr5Pux8pjcAW2gKC6eZVLl0f2emCmfCQi6g9+O18eUU7Ptx9Guj6rjr3XNS2PU
bfFJS4Atk0OK/G5KygOBpCvSHnVMYcD6g7ieNJSRC1hsTfmvaHttJfTLt2Ymla2c
Va8Z/ElOWcaFJBlRoU0J0S5lnY3xo4DH/KrBoDMpzJ8EfHgEHZ9fZz1oDcbNRyqR
f3gcJTwC4mYh+/NQozjcBzJYVyGwLKgSH7BPQvk5/npHHs7dGE7DhFt8Njj39D0F
SPjERNwyUSw9WdttlWc1h63wYhu3+NSLiw2rjYUTs/5i/C3KhamVRxIeQbXWfORF
Mpt7KVjxu5GQUM2H9DpMLZeYFPNjlOoSoBOc/GprsqMX5vQxGI2gxPyIybV5JDPT
gb7chkultDx8fmET8imP1yKW4ThZ8yophQ5vhf+W7BzREDQF9b+qzijNfbXnnwnY
LkRxv70l6UpvzVvrfOKriRhvCloABjMyFQxat9wbSQoyZwMoj3xML3jjUBRFCT/Z
k7wZms+IpcxMUtPnxWUy
=NdNk
-----END PGP SIGNATURE-----

--OMSrUQY9bOlYDMmd--
