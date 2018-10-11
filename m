From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the mac80211-next
 tree
Date: Thu, 11 Oct 2018 11:13:29 +1100
Message-ID: <20181011111329.253f0689@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1fU=n.jS28rW_6ieTXIoUMm"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, Johannes Berg <johannes@sipsolutions.net>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1fU=n.jS28rW_6ieTXIoUMm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got conflicts in:

  net/wireless/lib80211_crypt_tkip.c
  net/wireless/lib80211_crypt_wep.c

between commit:

  b802a5d6f345 ("lib80211: don't use skcipher")

from the mac80211-next tree and commit:

  db20f570e17a ("lib80211: Remove VLA usage of skcipher")

from the crypto tree.

I fixed it up (I just used the mac80211-next versions of these 2 files
for now) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1fU=n.jS28rW_6ieTXIoUMm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu+lakACgkQAVBC80lX
0GxdJQgAlKiwi2EZ37gu6hi9VDDMikpTOz/6GmWDkhFBa9RfHzAwfjBCFu26VKDS
pXF+/6rS9Hfmqi9HOMC58yuFbyZLzdhptUkjsutWIjK6mv8P9WPCvqAv8ykDaX8n
sORcqsB9NMJ/dmkjm47T8KDt/MuEbc6qEZeyyb2rGYGmDZcDajfrNJfpvxJpIUP1
NVFcMpSaa9lFftLzbBp/ljMRnMKXiV2vQLUoIo+mqCgnWWvkOgXQRKNRjLZV/wVN
1d9bIds3uNrOYUbm6hYr//38dPuY1iGCSz/U3cbWSV6pWvEDpJnMLIulA8MTwkFt
JzAUxhC5lLhVwRjytf9gIDLE/UpxMQ==
=cOtu
-----END PGP SIGNATURE-----

--Sig_/1fU=n.jS28rW_6ieTXIoUMm--
