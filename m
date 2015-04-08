From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 8 Apr 2015 18:28:30 +1000
Message-ID: <20150408182830.367f29a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=OGDmHC8RAIFB7.JUN0bn7/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Xunlei Pang <pang.xunlei@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/=OGDmHC8RAIFB7.JUN0bn7/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
drivers/rtc/rtc-mc13xxx.c between commit 0307b0d77a08
("drivers/rtc/mc13xxx: Update driver to address y2038/y2106 issues")
from the tip tree and commit 219451fa4da4 ("drivers/rtc/rtc-mc13xxx.c:
fix obfuscated and wrong format string") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/rtc/rtc-mc13xxx.c
index 32df1d812367,c8e78a560de7..000000000000
--- a/drivers/rtc/rtc-mc13xxx.c
+++ b/drivers/rtc/rtc-mc13xxx.c
@@@ -214,10 -215,12 +214,10 @@@ static int mc13xxx_rtc_set_alarm(struc
  	if (unlikely(ret))
  		goto out;
 =20
 -	ret =3D rtc_tm_to_time(&alarm->time, &s1970);
 -	if (unlikely(ret))
 -		goto out;
 +	s1970 =3D rtc_tm_to_time64(&alarm->time);
 =20
- 	dev_dbg(dev, "%s: o%2.s %lld\n", __func__, alarm->enabled ? "n" : "ff",
 -	dev_dbg(dev, "%s: %s %lu\n", __func__, alarm->enabled ? "on" : "off",
 -			s1970);
++	dev_dbg(dev, "%s: %s %lld\n", __func__, alarm->enabled ? "on" : "off",
 +			(long long)s1970);
 =20
  	ret =3D mc13xxx_rtc_irq_enable_unlocked(dev, alarm->enabled,
  			MC13XXX_IRQ_TODA);

--Sig_/=OGDmHC8RAIFB7.JUN0bn7/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJOayAAoJEMDTa8Ir7ZwVD84QAIHlvoirKE9lGDDI78eMtbze
wn1dLfuLr5nNPlrN6WWrCgGFT1+kQQbsf2MFL5MTyi1In+ZBMaIsyHrGGfYldn3y
3iPrEHapHSOL30jFKYwqjiwWugHEFxtS+0ithfnjr/vxZclbTKp8j7CXlV30lNC3
rctQlm7ILBLHeCQPnmyunuKVmnDpDXksNUlPdI4GXh8qaNbGJbkQYyIerCrIcBLg
zjhxVo98B5d1rvYFYDXN7gTWP659E2B/2ilaAQfboT5iEUnmRvIgGQ0ew2QzaajD
klUB5fUwv+GLee10M/Mer3dyciFY6l1/S1rSCyORqoyEq+TSMUelhLvTIqzlNmmO
WkYvS+aVktAAsKC7cR2W5xk6GioJEIWCM0ZwPdIZWLwTVjyBM79frCE5xAG7yTfT
x12qU7JPLV0snO+lauNIXOB9AbDdkqzllFsC30j8J59L9Fw7NMwzsA9gbibW5Q13
yzT8SmKH5TRvf0q0w3nvu1zH0krs/GvFAzkKzV8BoczLChJUCoSdzxpTk9DkUHiQ
NTBqY4+EL95RTsC6j0UuwK/iq9yxT8YZZRv4KQwLgsh7ZHcbtaUvNxO46L7s6fgP
UYfnzjiDVLryI9HA3a0LQ3EXsfIajFw909x5ZhPXg0LmOoiPNzlU40SSEAq4GKqh
p1wY9U6B3TRKEFavnZbQ
=hez1
-----END PGP SIGNATURE-----

--Sig_/=OGDmHC8RAIFB7.JUN0bn7/--
