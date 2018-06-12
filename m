From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nfc-next tree
Date: Tue, 12 Jun 2018 10:19:54 +1000
Message-ID: <20180612101954.63eb9e60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//e3dZxhtjRKoFni_fnm7mO+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Pundir <amit.pundir@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_//e3dZxhtjRKoFni_fnm7mO+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

After merging the nfc-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/nfc/fdp/fdp.c: In function 'fdp_nci_open':
drivers/nfc/fdp/fdp.c:250:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_close':
drivers/nfc/fdp/fdp.c:260:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_send':
drivers/nfc/fdp/fdp.c:268:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_recv_frame':
drivers/nfc/fdp/fdp.c:279:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_core_reset_ntf_packet':
drivers/nfc/fdp/fdp.c:602:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_prop_patch_ntf_packet':
drivers/nfc/fdp/fdp.c:614:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~
drivers/nfc/fdp/fdp.c: In function 'fdp_nci_remove':
drivers/nfc/fdp/fdp.c:789:17: warning: unused variable 'dev' [-Wunused-vari=
able]
  struct device *dev =3D &info->phy->i2c_dev->dev;
                 ^~~

Introduced by commit

  7579d009c4a1 ("NFC: fdp: Remove __func__ from dev_dbg()")

--=20
Cheers,
Stephen Rothwell

--Sig_//e3dZxhtjRKoFni_fnm7mO+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsfEaoACgkQAVBC80lX
0GxXzwf/V+PcEUtg5JzbR3IKI9xp0HjSRSb9DgjrKtLVtK0hd6ExUtu5G2LUjyR9
EBvf3zxOdHqMP8s9WU6GYrrf555LIYKbgPdubuZaf7iYuy1y6/7xOHazXR0DRGYA
KZ9FuDTgzGoQXcXHblSdB3DThIDfPZNpFfVVryn3pwTrjsGTZGTnem0Y5kMpohVe
hrf+JB+uP6EKzv1VgvQ9nf5lm20blHJaXbDQFi76M6QmP14v6jqeVkBwd/rpOQeF
w53fzcEHzYJogdH5dP+zXi+lwk14rx2z2lt1xzD+ouI6/8deecxYBanrEmXpd5ON
0gi5mORQN8yh2Yrm8p1Rg4HELQoszg==
=XmbC
-----END PGP SIGNATURE-----

--Sig_//e3dZxhtjRKoFni_fnm7mO+--
