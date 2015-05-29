From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the h8300 tree with the imx-mxs tree
Date: Fri, 29 May 2015 12:00:13 +1000
Message-ID: <20150529120013.6f11e7e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/avt+1_fG2rtv.baVk/ZxuYz"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60457 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755308AbbE2CAU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 22:00:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/avt+1_fG2rtv.baVk/ZxuYz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yoshinori,

Today's linux-next merge of the h8300 tree got a conflict in
drivers/clocksource/Kconfig between commit 77b0235b6b5c ("ARM: imx:
move timer driver into drivers/clocksource") from the imx-mxs tree and
commit 2b5e104dcbd8 ("h8300: clocksource") from the h8300 tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clocksource/Kconfig
index 139a20795073,acce7cfb3cee..000000000000
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@@ -259,9 -259,10 +259,15 @@@ config CLKSRC_PX
  	  This enables OST0 support available on PXA and SA-11x0
  	  platforms.
 =20
 +config CLKSRC_IMX_GPT
 +	bool "Clocksource using i.MX GPT" if COMPILE_TEST
 +	depends on OF
 +	select CLKSRC_MMIO
 +
+ config H8300_TMR16
+         bool
+=20
+ config H8300_TPU
+         bool
+=20
  endmenu

--Sig_/avt+1_fG2rtv.baVk/ZxuYz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZ8gxAAoJEMDTa8Ir7ZwV3XwP/jJERgWuEwwwYO4+t0APXHLe
jSUqGGLPz7KtEBUmbOrqjIRn3hzD2RCtIFTudk+nQQJv6a06Lwh8gcv3E0wzaQTG
2ABi3EMm4eQo6n+J8lipMnsxx4xeTEpHLSDTyIsK/pNcUQYFXsGnYQyQ5c7cqw7Y
J/Nr/Xz7aqPOXlo8YT6qgE/w0vX/fSVhgy3/yBAeq47oizhjclDcLsvjDs+MXKSF
FzUf8UK6cS/yUzJvqoJJReDVp/jjAHUO2IW1y4SlRj4ZImgUKkgTTn/vKW/9x8ds
T2P1qw2WCQv1qEPQL9tFGi5ygZ1gLuYXtFUK64o3H7KuxwdOSjVYxa80YeaRYmY/
qTPYD+t1pefzZZQXK3P/IGxCF8CGM/rGWek19L+AiF4jtUl1PbM0uEzcGCWaRZJ4
WRq9ig+PH+d1MRphvRh8qYtyEPNTrZnODnYnxmVvJo4KjEf5gyqDQ87eGKT8/D0Q
4/t9JTKZSHcN4lsupPnaMP/FJGmiw0m9fndDFrmSz54DIUNR7O8MECIdUrn//1mD
CrJG2McfNx2B0ZAuqOgQHVS4kdBbA+Mg9AbqCtU0yH9/sNvJYn6/RtukTm6TaKO7
wDP3q2F8OhA88cs3YxF/f8WJKn3++b0xTGdbIUYIKvvu8nFdfCmTAZ26pae507Y6
E+WhjilVbIxT940cApj+
=ox0x
-----END PGP SIGNATURE-----

--Sig_/avt+1_fG2rtv.baVk/ZxuYz--
