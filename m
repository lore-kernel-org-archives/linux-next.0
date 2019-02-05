From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Tue, 5 Feb 2019 14:22:17 +1100
Message-ID: <20190205142217.0c9ecabf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EQ1.i=fuU3alADHDwrjr6wj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Duszynski <tduszyns@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/EQ1.i=fuU3alADHDwrjr6wj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

drivers/iio/chemical/sps30.c: In function 'sps30_read_raw':
drivers/iio/chemical/sps30.c:289:4: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    switch (chan->channel2) {
    ^~~~~~
drivers/iio/chemical/sps30.c:299:3: note: here
   default:
   ^~~~~~~
drivers/iio/chemical/sps30.c: In function 'sps30_do_cmd':
drivers/iio/chemical/sps30.c:120:10: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
   buf[1] =3D (u8)SPS30_AUTO_CLEANING_PERIOD;
          ^
drivers/iio/chemical/sps30.c:121:2: note: here
  case SPS30_READ_DATA_READY_FLAG:
  ^~~~

Introduced by commits

  232e0f6ddeae ("iio: chemical: add support for Sensirion SPS30 sensor")
  62129a0849d2 ("iio: chemical: sps30: allow changing self cleaning period")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/EQ1.i=fuU3alADHDwrjr6wj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxZAWkACgkQAVBC80lX
0GxotQgAjjtxzjNI5j2QdRHhEKudzsyMoPybYe7Q6cZ08k80wARqQwUWJZY1zRwL
W2MRlTp9RYnJCA8B7FS5pk6ifc1AvK2Wd+2d823ZT/1tS2K8m/YvNvP8YyBryeCP
C0YCWY+gZSsavK9CBVrCJ4R05v8e5N5IMRT8iKyaYBLggGQDd3dGGPR4+Q8a9Cia
Q0rx5vXM2cS0lfeJRgMKBbKDz5/8302fzUtQWSNMOSJ0amKAxZFoDGPucdCiYLSS
YRqF+iAYBpmU9ZcbDlYd1qX0eDwPWAeq+kFRQ6Le3YYahMGE07EUH/PrmEoGcptV
KlFkXCe8ZfTdyw1zENp2fCTfD/Yeog==
=p4Jf
-----END PGP SIGNATURE-----

--Sig_/EQ1.i=fuU3alADHDwrjr6wj--
