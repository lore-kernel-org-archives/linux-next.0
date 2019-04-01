From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the fbdev tree
Date: Tue, 2 Apr 2019 09:30:07 +1100
Message-ID: <20190402093007.0b03b02e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P/3Nxd.XblUEf2RjQpecfHe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yifeng Li <tomli@tomli.me>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/P/3Nxd.XblUEf2RjQpecfHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/video/fbdev/sm712fb.c: In function 'smtc_blank':
drivers/video/fbdev/sm712fb.c:900:4: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]
    smtc_seqw(0x6b, 0x02);
    ^~~~~~~~~~~~~~~~~~~~~
drivers/video/fbdev/sm712fb.c:901:3: note: here
   case 0x720:
   ^~~~

Introduced by commit

  f627caf55b8e ("fbdev: sm712fb: fix crashes and garbled display during DPM=
S modesetting")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/P/3Nxd.XblUEf2RjQpecfHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyikO8ACgkQAVBC80lX
0GzPiwf/RsxhnQrKYYUV4DYpBXGK70zlPEcW1Bdz8Wmom/nfLea2LnqUgbmPa3Yl
dXWMtEB7pN+ApkeNqDJYGRUQmgYg2TyKE03JuIaGGZiOMauIGsjxY77pcd9C8AHo
bN6KIKjYItL+K7uzjaq8nCSS9rfU+HXvp0/olGxjRt1fqZKxixWOVfWAL+V+xJRE
zO1p6x9+Us/17Ye8SYRp/RISWWpYeXOIW5C7ouhACj2pYYw2blgcxgkk8Ss/ga7f
qmlfRYb5ERNKdKGvzN9BWP2EipZH69rT2mV7v0NHdELj/lTLYsjaFkJPUb2KDVU2
yNLW5UsQ7I2qyRd/ESK702j+liouMQ==
=E5eg
-----END PGP SIGNATURE-----

--Sig_/P/3Nxd.XblUEf2RjQpecfHe--
