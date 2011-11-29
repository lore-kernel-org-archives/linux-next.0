From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the l2-mtd tree
Date: Tue, 29 Nov 2011 14:33:58 +1100
Message-ID: <20111129143358.0859ae27c22f2c752a608f65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__29_Nov_2011_14_33_58_+1100_10vryHzLGJr5.slU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:50776 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753033Ab1K2DeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2011 22:34:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

--Signature=_Tue__29_Nov_2011_14_33_58_+1100_10vryHzLGJr5.slU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

After merging the l2-mtd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mtd/devices/docg3.c: In function 'doc_write_page_ecc_init':
drivers/mtd/devices/docg3.c:577:6: warning: suggest parentheses around oper=
and of '!' or change '|' to '||' or '!' to '~' [-Wparentheses]

Introduced by commit 496a5fc59dae ("mtd/docg3: add write functions").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Nov_2011_14_33_58_+1100_10vryHzLGJr5.slU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO1FKmAAoJEECxmPOUX5FEmbQP/0KScJ0jzrjdsQ/X1pFd759w
Y1CLG0hAnypSIP1kCoVGM0aFiuS86MH2w4Ljh3urdA25jpIigi3EZ9EcdY9Fbiga
nFFxQsCiAP+w9hjz1BrCpNbN+wvA2B29TcWScBKO3aRl8guZSPYi4Z3H392o40JM
mWEoW8XYJgEY4v7nlSeWG/9RqHzEPmSXWC4MclBdfjCcee6M8vlV7TKXyHswh+zv
C79vFGDgkP4juFcPaeUVJJCl2uYipxiQ9eHQrdHxtb8dnIuDVnnEPcYCsYLoN6nv
e2U7hjp4xP8pzzDq9ppJspwU2G6lR3Dx/c87iSoMz766NotK5N4OSj8EXrmvYr7O
IRu4pZzE+WIQpYqPDvlcAc1sz/HRysWmXx92TBfA3+KoTXW6OFqEwpmehNNxjMyW
XmE137y9mNBJlxBH/5rJr2lEu7aBoPVu99a+6iKqjGsmuSn7rDeoMuNTt+M9zLyW
fjfzhdCiZYabnozRNytCBgydnAu2+fMhDsc+uJWvsZkluEbdfInGB4UdtV5u+mxu
HKZ1kAbxdkcP3HXTnKAmz3ZFrnAwVMpdQBgu6rAoicLCGTV1PiDJflAaGldG9LWj
DyOoyn2JZ7vL+CyJKsGMvvtldRfBVZF2P5gLREWHWx2OYxGo/KfLimYscRuba0rT
+D6lIl4oFKDlwuQvh3A7
=2jS0
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Nov_2011_14_33_58_+1100_10vryHzLGJr5.slU--
