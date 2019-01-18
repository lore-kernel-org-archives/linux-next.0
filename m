From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mali-dp tree
Date: Fri, 18 Jan 2019 11:28:11 +1100
Message-ID: <20190118112811.091dd962@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/y5n=y4k.rTJ_O8JbIxNz+FQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/y5n=y4k.rTJ_O8JbIxNz+FQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Liviu,

After merging the mali-dp tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_parse_=
dt':
drivers/gpu/drm/arm/display/komeda/komeda_dev.c:52:26: warning: unused vari=
able 'pdev' [-Wunused-variable]
  struct platform_device *pdev =3D to_platform_device(dev);
                          ^~~~

Introduced by commit

  7e8d4fcf8daf ("drm: arm/komeda: Remove IRQ parsing from initial series")

--=20
Cheers,
Stephen Rothwell

--Sig_/y5n=y4k.rTJ_O8JbIxNz+FQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxBHZsACgkQAVBC80lX
0Gx8swf/dvkNQMtG8rfbpcC2vcjVpzsJrcseJODeV8Q2kNhpleTL3fejs9L8F04U
1DASaIuhGql3ytdr3JTHmaA9d5jT2RPQVh20WPOnvzDI5fW0HYo4lWHWjNgd+hvf
WApklWjLNad2qc5HM5RkCqTg1UsC3Sbo7AatA5O9tAkO6g+pxEqlb4vE2doq6XWq
J0a/rhs9sHB+rIpz6RKEf3/Oc1s8vGNNlC4wtYjvDxzHxzi4ad82j2I9RR4V2ZZ7
MTvk61amyNdau5RDzofy7XCq3lcf+h6zVExIr6joa6mZc5UOqvBKswXmXD7zf0ll
+y1B98F846mKWw4VSCFjk1WXD38OOg==
=t0sJ
-----END PGP SIGNATURE-----

--Sig_/y5n=y4k.rTJ_O8JbIxNz+FQ--
