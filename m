From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Fri, 26 Apr 2019 15:56:53 +1000
Message-ID: <20190426155653.2cdebc5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W0TbOCq_gCotvRMb7SYCEG5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Patrick Venture <venture@google.com>, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/W0TbOCq_gCotvRMb7SYCEG5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/misc/aspeed-p2a-ctrl.c: In function 'aspeed_p2a_mmap':
drivers/misc/aspeed-p2a-ctrl.c:110:2: warning: ISO C90 forbids mixed declar=
ations and code [-Wdeclaration-after-statement]
  pgprot_t prot =3D vma->vm_page_prot;
  ^~~~~~~~

Introduced by commit

  01c60dcea9f7 ("drivers/misc: Add Aspeed P2A control driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/W0TbOCq_gCotvRMb7SYCEG5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCnaUACgkQAVBC80lX
0GxQFQf9FUxeKzv+33s5DxgUQPRDlzuja9tnzazpJFYzBMUjou1nKBhMopYGe9B4
Cm8yhX1SG/REfplbsXUoxGF66Hz9a+ftPZAE6GB5vZcIvqYj0g5LAHB92RV1Xmyf
259iV/vcYcLh1Q81Q8NBWMctrS0Ev1jFm+9pM9+mYHe56pPxmcCjghn287CrX1nH
44LQgMwUkNFtNWck+j4nLvRWWUpbjy3Kv4RNEq++u9MsFpk1MIvY28LZC2BkYgKl
F4gJV6qTeRAI0QuW6mwZwT+WpiHOtNP8gyn+xBD9e9sKatbOYI8xEApytnoJe3fV
f8DvR33D8xrIacmzRKX7Cx5rn8DoyQ==
=+7Fz
-----END PGP SIGNATURE-----

--Sig_/W0TbOCq_gCotvRMb7SYCEG5--
