From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 15 Feb 2011 13:33:42 +1100
Message-ID: <20110215133342.daa93f5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__15_Feb_2011_13_33_42_+1100_sRknwcMrTRmfxe9A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42016 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620Ab1BOCdu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Feb 2011 21:33:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__15_Feb_2011_13_33_42_+1100_sRknwcMrTRmfxe9A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/codecs/wm8903.c:376: error: redefinition of 'wm8903_dcs_event'
sound/soc/codecs/wm8903.c:279: note: previous definition of 'wm8903_dcs_eve=
nt' was here
sound/soc/codecs/wm8903.c:398: error: redefinition of 'wm8903_seq_notifier'
sound/soc/codecs/wm8903.c:301: note: previous definition of 'wm8903_seq_not=
ifier' was here

It looks like commit "ASoC: Actively manage WM8903 DC servo
configuration" has been applied twice as commits c5b6a9feaeb0 and
8e715c3194e4.

I have used the version of the sound-asoc tree from next-20110214 for
today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__15_Feb_2011_13_33_42_+1100_sRknwcMrTRmfxe9A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNWeYGAAoJEDMEi1NhKgbst4MH/RwLNIYxY+9WdA7CPce1Z6Gj
d9y5D/pugA/tzAiD8HsuW9AIsvVF5gF4QNrx7T5ixXUGY1fI8Pz5u47uMoQZNpFm
DZ7K1qRtYkF1ZWby1Y0JGD0UUGps8K5xum82mvfBzJXJFff07o61JzYvJZtqHXX+
zXoGlIeOgctm6RHCvprpNwevffv9NfIwhyEl+4R2XZHFkQJkZN+ERQDCLJynaU6G
oyMS3jgq/XzpjVx0OJoZ6A4y1qYzoVKsPR1ES3TQWJ3WRw6ugh7TXNvMw86g2XZm
/6wryWwFYm+640IyApqyx/2/2Q3oKgHKreyfrFVsUaPW5CCgZW+kigDbbLUuz4g=
=Sa/K
-----END PGP SIGNATURE-----

--Signature=_Tue__15_Feb_2011_13_33_42_+1100_sRknwcMrTRmfxe9A--
