From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Fri, 16 Dec 2011 16:39:28 +1100
Message-ID: <20111216163928.030494ce1beb330e4e8b7b40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__16_Dec_2011_16_39_28_+1100_XS=M/gTPfBogq_Gy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:35459 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198Ab1LPFjh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 00:39:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

--Signature=_Fri__16_Dec_2011_16_39_28_+1100_XS=M/gTPfBogq_Gy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kernel/rtas_flash.c: In function 'rtas_flash_release':
arch/powerpc/kernel/rtas_flash.c:218:16: error: 'struct proc_dir_entry' has=
 no member named 'count'
arch/powerpc/kernel/rtas_flash.c: In function 'rtas_excl_open':
arch/powerpc/kernel/rtas_flash.c:343:21: error: 'struct proc_dir_entry' has=
 no member named 'count'
arch/powerpc/kernel/rtas_flash.c:348:16: error: 'struct proc_dir_entry' has=
 no member named 'count'
arch/powerpc/kernel/rtas_flash.c: In function 'rtas_excl_release':
arch/powerpc/kernel/rtas_flash.c:358:16: error: 'struct proc_dir_entry' has=
 no member named 'count'
arch/powerpc/kernel/rtas_flash.c: In function 'validate_flash_release':
arch/powerpc/kernel/rtas_flash.c:541:16: error: 'struct proc_dir_entry' has=
 no member named 'count'

Caused by commit aef714db6205 ("core kernel: add refcount type and
refcount misuse debugging").

This would also break in drivers/nubus/proc.c

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Dec_2011_16_39_28_+1100_XS=M/gTPfBogq_Gy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO6tmQAAoJEECxmPOUX5FElPkQAKXfEVfU+AGAq15hNllqvb+x
QY15CozCLj+Mjj4rvUJ31riBFJm/m+nfaSyy4tOCXGzouR7G66aU5vqthKbnXsD2
HiPYJMvbS9SrYlnJgjolL6PF9ENhNuBnEWpv2/rNPQlODiJY6XPzxkpUZCDil89N
SriZ25fbiLUoOmf1XxM17wbJOz8iL/W2i6InKT9Ij6aIaoFCNY2nrQWOskdoFYgJ
SA/POqWd/dsUyq8D73dNcwjeMxoUz9fLKGFjiy7XXO1+kLOanuT+OJzYuz/a93og
cSb2wR3tM7vM3DDNZktYtIFnVkerzuiaV2fkXNLqzZf9NbmjW0T8pLedRUeWSMN7
iGAslL0+7kE7okpRE4qpceP1qYipXrzTSpfPQcAfNFAx2FLfTCUATurkSOj6sUOA
YNHeI/wEbF0IR70SwQkZOy/Dzh64kzBdyRvKv6vR7ICW7jr4Nj7em+E5/BaPedly
YlPogigFrPo+Y0tls9CGQzIMD/xURfLP+x+PDCQdVBtXUGb0Tje0hp4p5uNXkoSF
5esiUKvKCvfF5uNFlcjG2Hi+8+U42Pl2Hnh9D9TlflhqSUg7ABFmnf3ugjPqXcu8
o+wohVEI22Ko6ygiQ+A9U2JvFHe+5z4Fr02dPrUKcibrKJGscDpDPwLIWXn56f1W
LeB4wSguxv6QLOWepJ6F
=Po0/
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Dec_2011_16_39_28_+1100_XS=M/gTPfBogq_Gy--
