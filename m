From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (v4l-dvb
 tree related)
Date: Mon, 8 Jul 2013 15:26:58 +1000
Message-ID: <20130708152658.1d6e24874c3363c5f115a005@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__8_Jul_2013_15_26_58_+1000_y1KKVNw+X6tdyBzM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:60595 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484Ab3GHF1G (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Jul 2013 01:27:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Linus <torvalds@linux-foundation.org>

--Signature=_Mon__8_Jul_2013_15_26_58_+1000_y1KKVNw+X6tdyBzM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build
(powerpc_ppc44x_defconfig) failed like this:

arch/powerpc/boot/wrapper: line 314: .../scripts/mkuboot.sh: Permission den=
ied

Caused by commit cda2bf15f6dc ("Update email to m.chehab@samsung.com")
from the v4l-dvb tree.

I have reverted that commit for today.

Linus, please don't merge the v4l-dvb tree like it is.

Mauro, in the case of copyright notices, you should just remove your
email address, not bother changing it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__8_Jul_2013_15_26_58_+1000_y1KKVNw+X6tdyBzM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR2k2mAAoJEECxmPOUX5FEgDcP/0z2EohA+RQzNCy7699aG9/O
9QMKNpWaaKhAO3Bb1iPObZZIeOj+M9sxv3zgLS6+iO2wf/kRXxEOlrMqbZ8wIVxn
1BfbU8VnZBJzQnhE4M+70yFZvTwJ2vbyKlMceY6KRB21U7rDHRHjV26sMSY0n1uj
L3OT3HoipXQYRoO1NZwc33JTG+3UtEXJo6pCGEpYa3UAuvCqX7TGJHU/r+bNZ98T
Vuo5KBHArA4w1P6JfnlBXRvC9PyIbA/jh5CkvMIORofEqcTUcfRT7dYYi8PD6qVg
IeZ9Jt+xQjOakFuTTLuTlx8M+8stIuwsruBy9+st5Le2pcGpiY6oRUtoFWRq+CzG
l3ufXpKn0TPRO3+vv6JCxj0vS/I7Vuqwtl7hLF7I20uv0VdZS2L8A6MBd/Xv3Yqr
fDYpGmeab33zqMlooAQEp754etqZpa9bF8kIbmzVpa3YtZDM74V8txFl6bYymH+a
jdvuUpn5xGnAhYuY6Y11LgYvDNvUcHKPsuC6IuKHBbVx96NquEpes8WYhuiIRK5u
Zkl2279bNjuhcJp2AZBkBJH4/LaMftHjsj23S0GF63vhbLc/A9I0rJQUzxIaKHO2
uAe4hHoqihVC0/QKQotHEDC1wUSl2+m+umqDr+N27KhxADaRPkr2TmOY1n0enbeB
a/sVAurd3Q7NwlDubFBe
=Ef1W
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Jul_2013_15_26_58_+1000_y1KKVNw+X6tdyBzM--
