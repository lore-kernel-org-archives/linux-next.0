From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the md tree
Date: Mon, 2 Mar 2015 16:50:57 +1100
Message-ID: <20150302165057.29087a08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VDOqFPisTjKfBQY2dVM3=OD"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46872 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750758AbbCBFvE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Mar 2015 00:51:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/VDOqFPisTjKfBQY2dVM3=OD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Neil,

After merging the md tree, today's linux-next build (i386 defconfig)
failed like this:

drivers/built-in.o: In function `bitmap_read_sb':
bitmap.c:(.text+0x29cd52): undefined reference to `__udivdi3'

Probably caused by commit b97e92574c0b ("Use separate bitmaps for each
nodes in the cluster") or commit f9209a323547 ("bitmap_create returns
bitmap pointer").

I reverted the md tree for today (because I am not sure how to fix
this and reverting less became messy).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/VDOqFPisTjKfBQY2dVM3=OD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU8/pFAAoJEMDTa8Ir7ZwVngIP/Rdgm0bZPklkUX7RuGpjzhE0
IHY85Ri4rTctJbNrB9fg1/oHfTWkTwIQ7U3FtiSLi9awDYWSY23up6vs5x87OOkO
xxtVqDgivfy44EPlWIfdXFBtoT6zTRM/fILBZQ4raSePsuAYTthqTt/SS3fPCres
oSilw1z6Ua4OeAKQommsFy109ZFwW6bdsGGg7m6rv/EHPg7Hq8L8zthOQ41OnhPS
GG8LPx/67w/nctRdMcVY56exlVim7qwsqye3Epe3IyYn3C6uCJhhadBytDx32kFS
x1SOkyX/XeIUJTNcdFYP+x64EQ2xOqPhtXYimJNLJKjQeLNBbHYdSKyGGeAzj1Jp
+Ffc+H3xuaelMoqLYGZ2ZkCNJMDiGDoU8FDSXj4hDq2uHJodze2SNxaKdLEVMbda
tlGDsNM29tWf2L445kP1NGN3A+8goQwEnezDT6xTpjZAslz832qXlSW1BnDUGisv
UstksM7ZaHiHR5xXe6dHCciSBHPXDj4dTkndhY31AMuUTA8drypFDZDkRDK6d5zk
kfP5brPBggbDZxo/8iJp4PDDs5RQHa8pQ4t6d6/G7pz+xlyt60dxtdTtVbWtQCJF
DvfpsW8mnKAzk79yftt8tCFEOlAP5h1Lox02y5ZSa4Wp2w/jlEVbDS+wtURRHFpn
TYgKnUnt0BoTtCTTP7PJ
=wEmQ
-----END PGP SIGNATURE-----

--Sig_/VDOqFPisTjKfBQY2dVM3=OD--
