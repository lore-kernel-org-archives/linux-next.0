From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the leds tree
Date: Mon, 17 Jun 2013 15:29:08 +1000
Message-ID: <20130617152908.1b9c999c01f18262a387dc91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__17_Jun_2013_15_29_08_+1000_yvOexKNgI_U6co0W"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42720 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800Ab3FQF3O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 01:29:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>

--Signature=_Mon__17_Jun_2013_15_29_08_+1000_yvOexKNgI_U6co0W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

After merging the leds tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/leds-mc13783.c: In function 'mc13xxx_led_probe':
drivers/leds/leds-mc13783.c:280:4: error: implicit declaration of function =
'of_get_next_child' [-Werror=3Dimplicit-function-declaration]
    child =3D of_get_next_child(parent, child);
    ^

Caused by commit 2ca3a455432f ("leds: leds-mc13783: Add devicetree support"=
).  of_get_next_child() is only defined if CONFIG_OF is set.

I have used the version of the leds tree from next-20130607 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__17_Jun_2013_15_29_08_+1000_yvOexKNgI_U6co0W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRvp6kAAoJEECxmPOUX5FEK+UP/iSEBVK7gdq/RE0bqtRl/YTM
V64VlLiOdw0oVsXcx6hwzS9PdMiRzTjKC9h7k1zoCpwP2YMRsfClBsp1GjRk3IT3
AnqggRG0SFf0czFnItCCQsa8uqgBcihIFLea+hJDzibcNk68+L+kxjWNiNTGF2h6
HRh7u79IsKbJLrzikSwRukl4xfFlC8K2xLSDZ2ewsFdXISyoOf/VL5MiKlda/XHN
tnLhrJL2I6Ocb23twspWTCbArutkakw8eMSMlwtvCBLSdtbwDUcxjbn92VS16yV5
EgONKhYmuTPQ6mLqXnlf7rtYcc7alhFlr3RiUWqND7+smWAn9x5gBNIlfAEaKiTO
/DE598kqur52bGAwEt7H9TvqlbMkNsxdc8L1pSbT1XzxDisbbZJmlN2pVw8cuVjA
5Yfich6ath9Ieu/obNqZD2udIpJjvcB5Tgzx77r5RjaiM0r5JFXT8qZII7Hgm7u9
er/zVRhUxSE2FngxiV59Ue9ary4RaN0DvXMRCz40FPJUj9LS1RrfMfEFlNTWseXx
HQHcY3AGVPa8ffxLQrGZyXfybysQypcipb8+RssMaJX2ujxQUeU5qavFhZGYJojf
68GTBu0JrupK19P6O9oOO91RfY+MvwbvgOXKoU8bKFGlaSVrv+8hw9B0W39kecTC
B61ZvFBZuIpmaiKMYmp3
=sDt9
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Jun_2013_15_29_08_+1000_yvOexKNgI_U6co0W--
