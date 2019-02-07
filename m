From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tpmdd tree
Date: Thu, 7 Feb 2019 13:47:33 +1100
Message-ID: <20190207134733.05a8e55a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=d=+R=oonV4=cYeZD9ZjYxr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/=d=+R=oonV4=cYeZD9ZjYxr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

After merging the tpmdd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/tpm/tpm_i2c_nuvoton.c:45: warning: "TPM_RETRY" redefined
 #define TPM_RETRY      5
=20
In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:35:
drivers/char/tpm/tpm.h:43: note: this is the location of the previous defin=
ition
 #define TPM_RETRY  50
=20
drivers/char/tpm/tpm_i2c_infineon.c:30: warning: "TPM_BUFSIZE" redefined
 #define TPM_BUFSIZE 1260
=20
In file included from drivers/char/tpm/tpm_i2c_infineon.c:27:
drivers/char/tpm/tpm.h:41: note: this is the location of the previous defin=
ition
 #define TPM_BUFSIZE  4096
=20
In file included from drivers/char/tpm/st33zp24/i2c.c:30:
drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
 #define TPM_BUFSIZE                     2048
=20
In file included from drivers/char/tpm/st33zp24/i2c.c:29:
drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the pr=
evious definition
 #define TPM_BUFSIZE  4096
=20
In file included from drivers/char/tpm/st33zp24/spi.c:30:
drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
 #define TPM_BUFSIZE                     2048
=20
In file included from drivers/char/tpm/st33zp24/spi.c:29:
drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the pr=
evious definition
 #define TPM_BUFSIZE  4096
=20
In file included from drivers/char/tpm/st33zp24/st33zp24.c:34:
drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
 #define TPM_BUFSIZE                     2048
=20
In file included from drivers/char/tpm/st33zp24/st33zp24.c:33:
drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the pr=
evious definition
 #define TPM_BUFSIZE  4096
=20
In file included from drivers/char/tpm/st33zp24/st33zp24.c:34:
drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
 #define TPM_BUFSIZE                     2048
=20
In file included from drivers/char/tpm/st33zp24/st33zp24.c:33:
drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the pr=
evious definition
 #define TPM_BUFSIZE  4096
=20

Introduced by commit

  569c1057f9ac ("tpm: move tpm_chip definition to include/linux/tpm.h")

--=20
Cheers,
Stephen Rothwell

--Sig_/=d=+R=oonV4=cYeZD9ZjYxr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbnEUACgkQAVBC80lX
0Gw2Owf9HH8whEe0KGtfzMrkqlrYsRUgJ1suOxLPHzD4RA42Y7itmZz0aKiNrTp2
heNMNsEDQYTyGbO6Vgc5XNJgtV2eciv6CXMY6YdnM2TgrgwVXQNqXG5Httj2SqxB
aO1G/grEAnNSXlZPDYJUwwLfYuiIqUePeCWN3gG3qo6B3nqTSwF7l4JNtIr/XAZ2
QxDn43dbdG+hl0onQIVXHwMeFi9ApUTYU8WRfmRI4Pg+WrU/67ckjg5WRlrLrWOK
aVXOaNtjpz6XuDdafaRZHNtGLnOFjllDmoscUDLGrCvkPY28OvhoJBEpsMIMBllw
wYWv+IjwzObHE8aw3iFGml3QrTq6Xw==
=7kGl
-----END PGP SIGNATURE-----

--Sig_/=d=+R=oonV4=cYeZD9ZjYxr--
