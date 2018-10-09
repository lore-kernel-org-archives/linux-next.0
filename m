From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 9 Oct 2018 15:59:45 +1100
Message-ID: <20181009155945.1b66ee78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rW1RL+ZHGmb._dGidBpSDgv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/rW1RL+ZHGmb._dGidBpSDgv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/dgnc/dgnc_tty.c

between commits:

  b68166ef8fd9 ("dgnc: leave TIOC[GS]SOFTCAR to ldisc")
  e002c6f1ccb9 ("dgnc: don't bother with (empty) stub for TCXONC")
  79273fc94ee9 ("dgnc: break-related ioctls won't reach ->ioctl()")
  246d394c9cc5 ("dgnc: TIOCM... won't reach ->ioctl()")

from the vfs tree and commit:

  3268357865d6 ("staging: dgnc: delete the driver")

from the staging tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rW1RL+ZHGmb._dGidBpSDgv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu8NcEACgkQAVBC80lX
0GztIAf8DRmuJi7tmXbQdDwLaR0QARuSHLOCWY/oRHzCYx3Z1SLvORVZHjsk31us
ZSUwFo0nJgastQZaR0JzNK6edEfw45kq8MbtzW/Z0IOpglx5obc8MgT5/e0FZZoM
HBOVpnTC4RCrxX4G9VkyVrQl6ZUjdNlFgm6o1giIol5mGJNx6FYOz7OMTsXHnOeC
gCFZfwq2DFFLMpyT9et/Fb1u/SKH8u4eHRwdcD4bMAM3JVPAXJ4W3fW3ki+mjJXm
eVifGKcLYwuo2zHLV9QySTJlWS0Uw4WREl4nHEzH2kIJ3HSjGsoM5eaaO/tTMyHK
VS31LjwpwBFLVy9MZOTO4XrCfuXgWQ==
=Kir6
-----END PGP SIGNATURE-----

--Sig_/rW1RL+ZHGmb._dGidBpSDgv--
