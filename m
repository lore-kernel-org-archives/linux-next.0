From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Fri, 6 Jul 2018 09:56:33 +1000
Message-ID: <20180706095633.676b0229@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K9k_pTU7s0mPZXgVpOGNQM3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Moshe Shemesh <moshe@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/K9k_pTU7s0mPZXgVpOGNQM3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/net/dsa.h:24:0,
                 from include/linux/platform_data/b53.h:23,
                 from drivers/net/dsa/b53/b53_spi.c:25:
include/net/devlink.h: In function 'devlink_param_value_changed':
include/net/devlink.h:771:9: warning: 'return' with a value, in function re=
turning void
  return -EOPNOTSUPP;
         ^
include/net/devlink.h:769:1: note: declared here
 devlink_param_value_changed(struct devlink *devlink, u32 param_id)
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Lots of these ...

Introduced by commit

  ea601e170988 ("devlink: Add devlink notifications support for params")

--=20
Cheers,
Stephen Rothwell

--Sig_/K9k_pTU7s0mPZXgVpOGNQM3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls+sDEACgkQAVBC80lX
0GymwQf8DEsZzHSHyIO9VebCreLVFNdlT/01smaCGgxLrbnPuucMzZOMI7MQDiDD
VKinJZCquD58LAae4PhYKjm2KBQCVK0g0Hx+liDdLOeiMPydHZIFRXJdJKOrVEZu
TQkOBDC4/sq2Vxxv6h/zZkfB4OEObxrt4zitJGo5uM+bxwf2CLDqhfpuPB9CjYch
1TRRj3ag71TO4TbQDv3H+PsNmNShmto7SkEAYcDAjfJI8QhbtBsod4OjbJF+8O1X
cinhm8hS0Qn7WYTxKrZdNs2UnHg0AwEPyrXD/le2jjOw6a4REoiJPH1zwKDoKnoO
+c+v7Hh1kznfDKdxp8maJXLPvwI4bg==
=Qv6D
-----END PGP SIGNATURE-----

--Sig_/K9k_pTU7s0mPZXgVpOGNQM3--
