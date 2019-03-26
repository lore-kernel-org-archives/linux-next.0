From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 27 Mar 2019 10:03:36 +1100
Message-ID: <20190327100336.142b4b08@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//EM.dT8f7SAzbtk7pXQ6So."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viorel Suman <viorel.suman@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_//EM.dT8f7SAzbtk7pXQ6So.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/printk.h:330,
                 from include/linux/kernel.h:15,
                 from include/linux/clk.h:16,
                 from sound/soc/fsl/fsl_audmix.c:8:
sound/soc/fsl/fsl_audmix.c: In function 'fsl_audmix_state_trans':
include/linux/dynamic_debug.h:80:13: error: initializer element is not cons=
tant
   .format =3D (fmt),    \
             ^
include/linux/dynamic_debug.h:116:2: note: in expansion of macro 'DEFINE_DY=
NAMIC_DEBUG_METADATA'
  DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:136:2: note: in expansion of macro '__dynamic=
_func_call'
  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:150:2: note: in expansion of macro '_dynamic_=
func_call'
  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
  ^~~~~~~~~~~~~~~~~~
include/linux/device.h:1493:2: note: in expansion of macro 'dynamic_dev_dbg'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~
sound/soc/fsl/fsl_audmix.c:93:3: note: in expansion of macro 'dev_dbg'
   dev_dbg(comp->dev, prm.msg);
   ^~~~~~~
include/linux/dynamic_debug.h:80:13: note: (near initialization for '__UNIQ=
UE_ID_ddebug374.format')
   .format =3D (fmt),    \
             ^
include/linux/dynamic_debug.h:116:2: note: in expansion of macro 'DEFINE_DY=
NAMIC_DEBUG_METADATA'
  DEFINE_DYNAMIC_DEBUG_METADATA(id, fmt);  \
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:136:2: note: in expansion of macro '__dynamic=
_func_call'
  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/dynamic_debug.h:150:2: note: in expansion of macro '_dynamic_=
func_call'
  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
  ^~~~~~~~~~~~~~~~~~
include/linux/device.h:1493:2: note: in expansion of macro 'dynamic_dev_dbg'
  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
  ^~~~~~~~~~~~~~~
sound/soc/fsl/fsl_audmix.c:93:3: note: in expansion of macro 'dev_dbg'
   dev_dbg(comp->dev, prm.msg);
   ^~~~~~~

Caused by commit

  be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")

I have reverted that commit (and its 2 following ones) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//EM.dT8f7SAzbtk7pXQ6So.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyar8gACgkQAVBC80lX
0Gzdagf+MnbpcBCIjxnTzv+8wKtN4YYichCECj4pWIRt+6p32ZIk6dlSWYo0yCOt
JPR5mGvfdab1zOImVg/WNIkrauf5rRMo5lhNEKPrtEyIreMpD0l67IUQSSbpcf12
5paAmJKOM4nrUc+XwPlSyhQsTGDPCUxum15fL3eSYQlDMc+TbER2pZ0KR3GbVKgH
p2gvWtvUB1c6s7QsoD07rCJv1OI03cW0fYEnRBuDM3cDGMVeT5Y9igxCcMHGR2Uk
YkktxhMXY9LaiK9GR4BuAfcVyfHYhqBK1Ia1W477I6wMHRRKQ7D9wEKpeaxzWBwE
zqaNOC9LkT59vZh4Yfe4dKBsTPU/CA==
=KLYT
-----END PGP SIGNATURE-----

--Sig_//EM.dT8f7SAzbtk7pXQ6So.--
