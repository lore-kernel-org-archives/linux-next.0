From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Thu, 14 Feb 2013 15:25:15 +1100
Message-ID: <20130214152515.b11be705b26defa876e4973e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__14_Feb_2013_15_25_15_+1100_6uqIaE8Pdc7GqdaV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:46455 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754914Ab3BNEZb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Feb 2013 23:25:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dagfinn Ilmari =?UTF-8?B?TWFubnPDpWtlcg==?= <ilmari@ilmari.org>

--Signature=_Thu__14_Feb_2013_15_25_15_+1100_6uqIaE8Pdc7GqdaV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
kernel/timeconst.pl between commit 63a3f603413f ("timeconst.pl: Eliminate
Perl warning") from the tip tree and commit "timeconst.pl: remove
deprecated defined(@array)" from the akpm tree.

These both fix the same problem, I arbitrarily chose the akpm tree version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__14_Feb_2013_15_25_15_+1100_6uqIaE8Pdc7GqdaV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRHGcrAAoJEECxmPOUX5FE0g8P/30ExZntPHtZEJHMmvJpuAKO
Wt0Un4vkm9UDicJpELUR4gTCxZsTsP+W/iJNQsp3QgwgsEpyq/SWGm9wFnZV9O/b
AG8cS2Oi7AMo0A+EmBLIGQzPJaNZk1qhD/I3Qoh2uszvlT3yChWx/73MRdLfu3CE
XGa8hLTvJnN68xjx5PfDRQ29kEs7IwgP21oa3ZiuNuJug3Sqfv8qhwATGP77U8PQ
SjrvH8z0aNio+8dpXT4EWwpYmVR+KtjwslqElk+RF9MeMNVRdRG/Gj0YEz4bST4U
xTCCcQIIlTNcXM7vS61MnonG7hTQplrfrhFrHP76uY4ZWEMIp9lxH+RF/uSISqfw
cbq8gqberrzwyFP5MNieMOvHATGHD66rQmZpreigheg+lTd/JIDfIfD3rZr4bXn0
QGO70KUMoZYaKD2+nlyoLhWi2sp99aXmxLoNFwquPHAuGrXNJl/yTTrN1HQJ5GhI
5JtNoZMo01A/ZLwxuEoi4Yj3Mk89r00OW1cIcxRr1AupMb9zOVtUjbKa9+2toaKF
+FqBd9fiXMC8F58e5TKKtnsdcox5U1vN7Ir09ZeErz7Xju7yiNzBjymZ08m5gPhh
lqKo8okxMSoIX3m+vwQJoOpGUy1b4joubdxVBKZb1UZp0pBEfiuEwp40kcgIghm7
BpOVtz0Tw08QuaUwYG8/
=04sl
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Feb_2013_15_25_15_+1100_6uqIaE8Pdc7GqdaV--
