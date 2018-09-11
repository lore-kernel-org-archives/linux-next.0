From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the usb tree
Date: Tue, 11 Sep 2018 12:47:43 +1000
Message-ID: <20180911124743.558e33dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D1pf8ILWweXZDQrFaO_cBaq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/D1pf8ILWweXZDQrFaO_cBaq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/usb/core/hcd.c: In function '__usb_hcd_giveback_urb':
drivers/usb/core/hcd.c:1741:16: warning: unused variable 'flags' [-Wunused-=
variable]
  unsigned long flags;
                ^~~~~

Introduced by commit

  ed194d136769 ("usb: core: remove local_irq_save() around ->complete() han=
dler")

--=20
Cheers,
Stephen Rothwell

--Sig_/D1pf8ILWweXZDQrFaO_cBaq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluXLM8ACgkQAVBC80lX
0GxIlgf/ekYZFA17PJk+ZyZuBXoKSpfWB+WuboRiecqivjf9ickArJHJ4sieVlL3
M9bwahP8+VYOIaTa/vYvjRyAdDWneUefF7FyCFIhQv2w9rC1pw62BDVzmLAf4M0o
wkP6NhiFFj9DGqxexvOLVOo3y7ydnsvYdctZCl2iN4ndftE+UWBpCoQJKyeO4JlR
1qW0xS7SdGVXK/PDASb1mmciPI+CeFxiYI1DT7LwEvDpaK+gDewCYPwS1yWlIxYi
V70aYaVSJn91Aycxbln1ukDcuzaGSqekqeibkPtmPAfkl7/raGgzkoN/KoX5TAIU
pG6NH0wVlKl9K4inNzRLiEhpzS7pNQ==
=0ARp
-----END PGP SIGNATURE-----

--Sig_/D1pf8ILWweXZDQrFaO_cBaq--
