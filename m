From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (sound-asoc
 tree related)
Date: Fri, 2 Dec 2011 14:38:45 +1100
Message-ID: <20111202143845.9d912c4378d42bcbfa44a8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__2_Dec_2011_14_38_45_+1100_wrdODFx3bQOm_cF/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:45151 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756485Ab1LBDi5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 22:38:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__2_Dec_2011_14_38_45_+1100_wrdODFx3bQOm_cF/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powwepc
allyesconfig) failed like this:

sound/soc/codecs/wm8994.c: In function 'wm8994_codec_probe':
sound/soc/codecs/wm8994.c:3511:4: error: label 'err' used but not defined

Caused by commit 7270cebef293 ("ASoC: Convert WM8994 to devm_kzalloc()").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__2_Dec_2011_14_38_45_+1100_wrdODFx3bQOm_cF/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO2EhFAAoJEECxmPOUX5FEAf8P/ROhLmMbqglPPA8xXTzTWcrF
L3s2x6a1JTAFW83Wy79Je0eAlzKMJaHpbZ0+vpUolnjcmN2sJEqGigBdYSyd+sEK
GLba2SjGJoiIYIvv5q/eDaU/mr88ytccspXcUbxTPCo2SNfJn6putLitv+yunQ+L
5S4ESapQHpMzRSnZPBup+7RETTKVe/npX3Q+Bvng/wUCJdY8fGw5OT1ZDS7zuj/+
Sj0XDLLYEhFK9BHp+BZm4gPNeQU+FxPHeVVgZahYCI0n/IQrjEF1o8ny79ur1j1/
6mXeZDKsKq+CZa88YZ1SBN0QkCWbjEA5ZRwun64ke3Jd9enybXAbaP3iqHX5BTEP
DYpyIhwMYKP0bMdHxn+5AvzPwJx1pVT8rNg6xCvFFYFwEB5GC7WJDg9YBi1JDjCM
0Ki/1oOjv3XHFOwTJ2NMqT9Wjn0CB+wOAf8+hZgJWSs2cXhSf0cG6WMPHB4vO297
KhV/s9lE6IjU6BAIJDRDtzmPb97iz/rvW20RSyBlWwxWETQUVoMApljsVqoPRsqc
Zvl7jjtwF0lUvgN9lp7N499od5cRApwP8JBnV9WW3OiBlJFMGWnU5qBv7wZFmhlH
YS/M+6Atx8GvqoqIcsAsyCkhSyyTgSxRYVqm8p3aKyauwXckuv4R1IQFSEjb3GHE
Ls3a1I6EozsRKPB11ykG
=8Lhr
-----END PGP SIGNATURE-----

--Signature=_Fri__2_Dec_2011_14_38_45_+1100_wrdODFx3bQOm_cF/--
