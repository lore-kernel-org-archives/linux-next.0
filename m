From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound tree
Date: Thu, 24 Jun 2010 13:03:41 +1000
Message-ID: <20100624130341.0ccf9102.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__24_Jun_2010_13_03_41_+1000_bWHMXGc_.j4QfxU="
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__24_Jun_2010_13_03_41_+1000_bWHMXGc_.j4QfxU=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/usb/mixer.c: In function 'get_ctl_value_v1':
sound/usb/mixer.c:308: error: 'struct usb_mixer_interface' has no member na=
med 'ctrlif'

Caused by commit 3d8d4dcfd423b01ef7ea7c3c97720764b7adb6df ("ALSA:
usb-audio: simplify control interface access").  Grep is your friend ...

I have used the sound tree from next-20100623 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__24_Jun_2010_13_03_41_+1000_bWHMXGc_.j4QfxU=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwiyw0ACgkQjjKRsyhoI8xDyACfaP/+jM6uNmUcXpyoyGddoHav
OZMAn0vIjIBnV5lH2qTzw2n06eW18Nbe
=qKdH
-----END PGP SIGNATURE-----

--Signature=_Thu__24_Jun_2010_13_03_41_+1000_bWHMXGc_.j4QfxU=--
