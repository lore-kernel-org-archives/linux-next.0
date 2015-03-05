From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 5 Mar 2015 15:47:51 +1100
Message-ID: <20150305154751.482ae42a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HtE6693wQuzWfh8v11tb9aF"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39395 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751066AbbCEEr7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2015 23:47:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Toshi Kani <toshi.kani@hp.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/HtE6693wQuzWfh8v11tb9aF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (bfin
TCM-BF537_defconfig and many others) failed like this:

(.init.text+0x5f8): undefined reference to `ioremap_huge_init'

Caused by commit 45eaed3ec431 ("lib/ioremap.c: add huge I/O map
capability interfaces"). lib/ioremp.o is only built if CONFIG_MMU is
set ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/HtE6693wQuzWfh8v11tb9aF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU99/8AAoJEMDTa8Ir7ZwVgwkP/jfn7LFTqRvQfSLNmSXl3hUb
NphYxMnv2TKqlRCDy+jzDlH/hgs95h4NKUx5S72T6V2mHkq1rhJKZepIaoP/1BvU
NRXfHb4RC88wjDwKA8LhnCO5O9rQE3zYDqeHHxbeOb8lcJ7d+5dA0tryV0rkChva
JhtThkVC5XRWsq+v9jGyMSW6SivxLPibbeMvmF5G4G/4bHE+SCGdWsCEfLJuVarS
QomDT20+QkUK4m5f3jBve18rL4ev20m5NVerqMfW9beNHnixGzmY9OgaShewtjff
BAlHGABQV73ra8zftesnhNgeduPNIpjQbU4o4kFBUy020oRsGIK6DhgeB6woPDoC
6dlCBxXWJWjclukIoHhUDnX1vyfh4SiwFXxgneVFm6mY+/ZkXxg+iY/653aeoQu3
XY6FXbHVxudLPWJwSJ2Tno4WmWgoRPqeZ0BPssyoGpMi+mSkAHW0YtpDdmjBKqtN
OZhjkJtDaVOzM3QlPX2KOWOBzI0iSZMU4lIaDcaMmYUzSYK4tO7xyAOo81P3V1+n
fh8bGqYMtytkPsAhB3Xtqqqs6Z2mITKkl7Zc8stDgot1BbKut5fY7YTUFIr+hWzw
VIgR0RwM2/pXqQLBgVnRQgz1e93M89CnKFwBfthXGNDGaQ3FR1+18mmUMaYCLxgA
wjmGBxJKYlZztL4GsIw+
=m7+M
-----END PGP SIGNATURE-----

--Sig_/HtE6693wQuzWfh8v11tb9aF--
