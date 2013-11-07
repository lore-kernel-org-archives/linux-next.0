From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Thu, 7 Nov 2013 13:37:51 +1100
Message-ID: <20131107133751.95ceeb3ddf512a0af6f78f2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0455333074=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Barnes <jbarnes@virtuousgeek.org>
List-Id: linux-next.vger.kernel.org

--===============0455333074==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__7_Nov_2013_13_37_51_+1100_cMYts=mQQgxRz=4R"

--Signature=_Thu__7_Nov_2013_13_37_51_+1100_cMYts=mQQgxRz=4R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/intel_panel.c between commit 5bdebb183c97
("drm/sysfs: sort out minor and connector device object lifetimes") from
the drm tree and commit 752aa88a1e78 ("drm/i915: make backlight functions
take a connector") from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_panel.c
index 09b2994c9b37,cad41ac330e8..000000000000
--- a/drivers/gpu/drm/i915/intel_panel.c
+++ b/drivers/gpu/drm/i915/intel_panel.c
@@@ -726,7 -802,8 +802,8 @@@ int intel_panel_setup_backlight(struct=20
  	}
  	dev_priv->backlight.device =3D
  		backlight_device_register("intel_backlight",
- 					  connector->kdev, dev,
 -					  &connector->kdev,
++					  connector->kdev,
+ 					  to_intel_connector(connector),
  					  &intel_panel_bl_ops, &props);
 =20
  	if (IS_ERR(dev_priv->backlight.device)) {

--Signature=_Thu__7_Nov_2013_13_37_51_+1100_cMYts=mQQgxRz=4R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSev0EAAoJEMDTa8Ir7ZwV38UP/iQx9XMRlFMmfJ4xEzWMhCbH
J+Lt7eRL0gQhTWTN5Pek5/eDe/Bj8QDg2O89JGERBddh8iVghxlV6SQIIfYN/XLY
R/I1Y399hb4/C1hNxCWt4L7guwL1yZGA/I83gl6LGf51O7Tx9Guuhi4sCUcJnWUk
nu3+vDw2eIBDwZTM0OYzSdbqDftqM2rRqia40jksBQ4as0iUfk+x0Tj8SW/F41zs
Kq2D8L68Huq8NtocZZsvO6Gq53nVicmfX3FpAVZ5nvdfcWozBQDvyY3PI/mppd10
J4C4PZ/bEqn8QFbaAlU7ToxP8XvRN0alqajeIpME7TgSyePk4IlFaL88yB/AZyTh
o4IXtnDz4zkEUMkkhMXBZ4PukGw1dvyngwlnC5pATHcCv7j9/w8/3XoVS14xRnUC
6MYVIxSyEoB9UHcc8qkZeGGxgrx0NdFLAhm0u6i2QpYuRLK2py0XarOVZIyUziUb
Syo1B4ud4mS0ucWgbJgKRtqlkpzBG9JRnRwrvrKOyXO9feC2tweTouJq5QJhPOfC
zB1xnRfSK2xKt+/QBK3OWtJsXJ03uJSHt8OuuphhOgXmbWbPExwDnE6l+gxpqbzf
WVlUckjO1CqNWXGqXGgiuvdQMJ98BAwxxvlY4b95UB5Zp/2Nn78vMB+Wd+a/yt0K
Fjq1LLceg0t/SEf6M7eV
=DQ8q
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Nov_2013_13_37_51_+1100_cMYts=mQQgxRz=4R--

--===============0455333074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0455333074==--
