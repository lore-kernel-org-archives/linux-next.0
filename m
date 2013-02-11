From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the mfd tree
Date: Mon, 11 Feb 2013 17:06:16 +1100
Message-ID: <20130211170616.73fd9fd30bb10c27a698ad4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1183620097082998166=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Samuel Ortiz <sameo@linux.intel.com>, Paul Walmsley <paul@pwsan.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: linux-next.vger.kernel.org

--===============1183620097082998166==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__11_Feb_2013_17_06_16_+1100_NOUdNFXkTTLdAn0n"

--Signature=_Mon__11_Feb_2013_17_06_16_+1100_NOUdNFXkTTLdAn0n
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-omap2/usb-host.c between commit 8a89e93237e1 ("mfd:
omap-usb-host: Consolidate OMAP USB-HS platform data") from the mfd tree
and commit c1d1cd597fc7 ("ARM: OMAP2+: omap_device: remove obsolete
pm_lats and early_device code") from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-omap2/usb-host.c
index 940aad4,99f04de..0000000
--- a/arch/arm/mach-omap2/usb-host.c
+++ b/arch/arm/mach-omap2/usb-host.c
@@@ -37,14 -37,11 +37,6 @@@
  #define	USBHS_UHH_HWMODNAME	"usb_host_hs"
  #define USBHS_TLL_HWMODNAME	"usb_tll_hs"
 =20
- static struct omap_device_pm_latency omap_uhhtll_latency[] =3D {
- 	  {
- 		.deactivate_func =3D omap_device_idle_hwmods,
- 		.activate_func	 =3D omap_device_enable_hwmods,
- 		.flags =3D OMAP_DEVICE_LATENCY_AUTO_ADJUST,
- 	  },
- };
-=20
 -static struct usbhs_omap_platform_data		usbhs_data;
 -static struct usbtll_omap_platform_data		usbtll_data;
 -static struct ehci_hcd_omap_platform_data	ehci_data;
 -static struct ohci_hcd_omap_platform_data	ohci_data;
 -
  /* MUX settings for EHCI pins */
  /*
   * setup_ehci_io_mux - initialize IO pad mux for USBHOST
@@@ -511,9 -522,7 +503,7 @@@ void __init usbhs_init(struct usbhs_oma
  	}
 =20
  	pdev =3D omap_device_build(OMAP_USBTLL_DEVICE, bus_id, tll_hwm,
- 				pdata, sizeof(*pdata),
- 				omap_uhhtll_latency,
- 				ARRAY_SIZE(omap_uhhtll_latency), false);
 -				 &usbtll_data, sizeof(usbtll_data));
++				 pdata, sizeof(*pdata));
  	if (IS_ERR(pdev)) {
  		pr_err("Could not build hwmod device %s\n",
  		       USBHS_TLL_HWMODNAME);
@@@ -521,9 -530,7 +511,7 @@@
  	}
 =20
  	pdev =3D omap_device_build(OMAP_USBHS_DEVICE, bus_id, uhh_hwm,
- 				pdata, sizeof(*pdata),
- 				omap_uhhtll_latency,
- 				ARRAY_SIZE(omap_uhhtll_latency), false);
 -				&usbhs_data, sizeof(usbhs_data));
++				pdata, sizeof(*pdata));
  	if (IS_ERR(pdev)) {
  		pr_err("Could not build hwmod devices %s\n",
  		       USBHS_UHH_HWMODNAME);

--Signature=_Mon__11_Feb_2013_17_06_16_+1100_NOUdNFXkTTLdAn0n
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRGIpYAAoJEECxmPOUX5FEhfgP/0F1CfhtXHJTA+c+msOFLDtq
BZ8H052tkavO0eRFI4iExCc7hJKG727E7k9ZfzPeCAbX6mHiqOQNM4PZRDa0GmHq
0cgS4kitb7ciNV/y1mG24SdQiqZeU7bBoBl4tH3/N4Vu0L8u0LNfSH4zJjOAUv1d
HLPuMgCxjR+RChTT5M0PHwXFpxotRRJtxnb9fIXjzzE/G8QGEo5bWhyTZKWBblgF
cn8Bf7UJ0U/tOS5LWwn2bwed6whii+/3PU5W/YXnHzgbzyQRTtVgxFFuN2ufLZbu
WGGnNaF58Swfl2i9X+qP174WnPNO/m7bssxDoVvqaoejvTzN8ynrhIQmlpn5Pqt8
Ynn+DwHxCXjmv+3Dlr1J5zCEBUUiH24lZBz/k9E6uvEPD7+HyM6Rb8cbdqHanepH
Z4IVHmc+ssfb0w1+1XzuCDwi7qw6yoXh4WJhBeSrT4CN9yBCIyX5Pq3RQDBtfqKr
2ZjD9qaKZlUR0NV6n7J/zVHyKPWZFZ5SNeao0cptjpiVrglqocMiH6YebW5Pu/Rg
8Owq32G88tIlXMnhKuPH+kTNhvlkMd2jpsDbn2vFjRuYViyYQMyjSUIRQxZaDsGR
R+F3mn3cstohySqNcE0VDUTkU3I2toFO6vr8DePIEBhRfmJeEbT+73cjbFiJD8xR
2MAV2X1ygfqFEQdLu4pk
=3YHb
-----END PGP SIGNATURE-----

--Signature=_Mon__11_Feb_2013_17_06_16_+1100_NOUdNFXkTTLdAn0n--


--===============1183620097082998166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1183620097082998166==--
