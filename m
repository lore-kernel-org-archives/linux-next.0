From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the i2c tree
Date: Mon, 29 Oct 2018 13:09:25 +1100
Message-ID: <20181029130925.60ea7830@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Yi5UDAd5LU=QdOHo+ui7Syk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Yi5UDAd5LU=QdOHo+ui7Syk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next merge of the pm tree got conflicts in:

  drivers/i2c/busses/i2c-designware-baytrail.c
  drivers/i2c/busses/i2c-designware-core.h

between commit:

  9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C bus pm_disab=
led workaround")

from the i2c tree and commit:

  8afb46804dfa ("i2c: designware: Cleanup bus lock handling")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/i2c/busses/i2c-designware-baytrail.c
index 9ca1feaba98f,971b5cde7a93..000000000000
--- a/drivers/i2c/busses/i2c-designware-baytrail.c
+++ b/drivers/i2c/busses/i2c-designware-baytrail.c
@@@ -162,18 -36,9 +36,9 @@@ int i2c_dw_probe_lock_support(struct dw
  		return -EPROBE_DEFER;
 =20
  	dev_info(dev->dev, "I2C bus managed by PUNIT\n");
- 	dev->acquire_lock =3D baytrail_i2c_acquire;
- 	dev->release_lock =3D baytrail_i2c_release;
+ 	dev->acquire_lock =3D iosf_mbi_block_punit_i2c_access;
+ 	dev->release_lock =3D iosf_mbi_unblock_punit_i2c_access;
 -	dev->pm_disabled =3D true;
 +	dev->shared_with_punit =3D true;
 =20
- 	pm_qos_add_request(&dev->pm_qos, PM_QOS_CPU_DMA_LATENCY,
- 			   PM_QOS_DEFAULT_VALUE);
-=20
  	return 0;
  }
-=20
- void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
- {
- 	if (dev->acquire_lock)
- 		pm_qos_remove_request(&dev->pm_qos);
- }
diff --cc drivers/i2c/busses/i2c-designware-core.h
index 9ec8394f4787,152bf56d8404..000000000000
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@@ -209,10 -208,9 +208,9 @@@
   * @fp_lcnt: fast plus LCNT value
   * @hs_hcnt: high speed HCNT value
   * @hs_lcnt: high speed LCNT value
-  * @pm_qos: pm_qos_request used while holding a hardware lock on the bus
   * @acquire_lock: function to acquire a hardware lock on the bus
   * @release_lock: function to release a hardware lock on the bus
 - * @pm_disabled: true if power-management should be disabled for this i2c=
-bus
 + * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
   * @disable: function to disable the controller
   * @disable_int: function to disable all interrupts
   * @init: function to initialize the I2C hardware
@@@ -263,10 -260,9 +261,9 @@@ struct dw_i2c_dev=20
  	u16			fp_lcnt;
  	u16			hs_hcnt;
  	u16			hs_lcnt;
- 	struct pm_qos_request	pm_qos;
- 	int			(*acquire_lock)(struct dw_i2c_dev *dev);
- 	void			(*release_lock)(struct dw_i2c_dev *dev);
+ 	int			(*acquire_lock)(void);
+ 	void			(*release_lock)(void);
 -	bool			pm_disabled;
 +	bool			shared_with_punit;
  	void			(*disable)(struct dw_i2c_dev *dev);
  	void			(*disable_int)(struct dw_i2c_dev *dev);
  	int			(*init)(struct dw_i2c_dev *dev);

--Sig_/Yi5UDAd5LU=QdOHo+ui7Syk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWa9UACgkQAVBC80lX
0GzqbAf+K5guPngSpCLhyvZXPt3dSdtogNVF36+anUCLFVUTpr/vzkhOIpnRr4Sx
BSKuC4LsQTzbYMSZ6/sWilsoghByhW5Sck+PdVgrtsEVe+nkcpQw/ppQip4OEbPF
kIN8MrnG4VG+0Bb2Pec4RtBtoXgq5XUQJuO2CCoLNGPBwKjmdlNDc1UZlFhRdHH8
j6BD/QuKoxhJYupS00/5B2Rq+38QxhRJry5ii8j+Dz6crAvIEbF/hFdhPU8j7Wah
7SmrKMGPsFXvNFRT/slRjvq0SlIRtQzGIx4URTN+sGaKJwDZzjhXG3tvqgN5idb6
RXLv/sYh/8+I9oJ2qMNZTlq8YMkV6g==
=TbQX
-----END PGP SIGNATURE-----

--Sig_/Yi5UDAd5LU=QdOHo+ui7Syk--
