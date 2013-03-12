From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree
Date: Tue, 12 Mar 2013 15:30:47 +1100
Message-ID: <20130312153047.dc10eb2392d07af8822e45f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__12_Mar_2013_15_30_47_+1100_bcwKL/VCAPw8jBHc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:52433 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752237Ab3CLEau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 00:30:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Hellstrom <daniel@gaisler.com>

--Signature=_Tue__12_Mar_2013_15_30_47_+1100_bcwKL/VCAPw8jBHc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/input/serio/apbps2.c: In function 'apbps2_of_probe':
drivers/input/serio/apbps2.c:176:2: error: implicit declaration of function=
 'kzalloc' [-Werror=3Dimplicit-function-declaration]
drivers/input/serio/apbps2.c:176:11: warning: assignment makes pointer from=
 integer without a cast [enabled by default]

Caused by commit 928a48c9e40e ("Input: add support for GRLIB APBPS2 PS/2
Keyboard/Mouse") from the input tree.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__12_Mar_2013_15_30_47_+1100_bcwKL/VCAPw8jBHc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRPq93AAoJEECxmPOUX5FEHRIP/RNv0tCGuh5SkHFW6BYy7yMJ
HkqLClD2+7Qw96dVOyv85vM2e0OQD7e6lcLF6nY8YdwDGqlqHNM6DBw+67q6PDMW
4i8oh+vaNbV30SvUbxwx0tqh7YRcXqqO81wY+i8RWTWBnz0plSOsgzQbKNh1bw+R
pauxKIidlRTf/udJspXqtzE9vW56SwkvSe1+hYlC4PBc6Z570h5frLQfPGH3h20Q
oIgdhW1P1tFSgnJDh9GhcOpr3Oo7HQg2jIm+MDgoZX1qm5KX+D+9Grzfmk7e8jx+
FsEVtyWMNG999JyhvVgq4jtl78t1uM6ZBHEdrEsBxOekDzSQ9WSC/xab/DldHDBi
LCizxVnQMPql5ZqbqTiFvWbFOajNdIHWRz5FJvlv0xYckS8KDVWkzd9h/d7wOI4T
x/UhW0/DXslfcMtIcXofY6U2HBxWA7mF9zokyHBHQ5RwkG1/kFKOwkWpkfVI6Oe3
nHZKvcr/4CJ7AdLIxJhPgI1DvL4OXYPAN0NSTtN3cG4Q1BhK+FfJUUWdJVO165wA
rmH1PqX7mbmVWLGKkNreWjFtX1xZSowPIRsDxhyE7ECqO/AnmHP75OcjHXxBQ8ZX
JGJHG8C00s+2V/NgxP6rzPSW5ElzWWIVMQ2gs/gv7FuUpYocsYlLE9u5L80yYsTY
CyxdWDLRMPFNVLG4uooV
=Ed2j
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Mar_2013_15_30_47_+1100_bcwKL/VCAPw8jBHc--
