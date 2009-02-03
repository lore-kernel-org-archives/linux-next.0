From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sound tree build failure
Date: Tue, 3 Feb 2009 14:10:11 +1100
Message-ID: <20090203141011.c72d35b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Feb_2009_14_10_11_+1100_4pGKVo9kyos_Nkey"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45092 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751295AbZBCDKW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 22:10:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Timur Tabi <timur@freescale.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Tue__3_Feb_2009_14_10_11_+1100_4pGKVo9kyos_Nkey
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Today's linux-next build (x86_64 allmodconfig) failed like this:

sound/soc/codecs/cs4270.c:152: error: expected identifier or '(' before '['=
 token
sound/soc/codecs/cs4270.c: In function 'cs4270_set_dai_sysclk':
sound/soc/codecs/cs4270.c:203: error: 'cs4270_mode_ratios' undeclared (firs=
t use in this function)
sound/soc/codecs/cs4270.c:203: error: (Each undeclared identifier is report=
ed only once
sound/soc/codecs/cs4270.c:203: error: for each function it appears in.)
sound/soc/codecs/cs4270.c:203: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:203: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:203: error: size of array 'type name' is negative
sound/soc/codecs/cs4270.c: In function 'cs4270_hw_params':
sound/soc/codecs/cs4270.c:387: error: 'cs4270_mode_ratios' undeclared (firs=
t use in this function)
sound/soc/codecs/cs4270.c:387: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:387: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:387: error: size of array 'type name' is negative
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: error: size of array 'type name' is negative
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: error: size of array 'type name' is negative
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: warning: type defaults to 'int' in declarati=
on of 'type name'
sound/soc/codecs/cs4270.c:392: error: size of array 'type name' is negative

Caused by commit ff7bf02f630ae93cad4feda0f6a5a19b25a5019a ("ASoC: fix
documentation in CS4270 codec driver") which does somewhat more than fix
documentation.  It clearly wasn't even build tested.

I have dropped the sound tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Feb_2009_14_10_11_+1100_4pGKVo9kyos_Nkey
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmHtZMACgkQjjKRsyhoI8xHMwCfT//cKXH7gV/B6reGd+9sZIuW
roUAoIqBDcBDND+qzQndeiG3hGKz+LmQ
=jIpl
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Feb_2009_14_10_11_+1100_4pGKVo9kyos_Nkey--
