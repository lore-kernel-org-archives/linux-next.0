From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the drm tree
Date: Thu, 19 Jul 2018 15:01:31 +1000
Message-ID: <20180719150131.2abf45b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232761936=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-next.vger.kernel.org

--===============1232761936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2rmEAujUj/4o0PLwFzYCzy="; protocol="application/pgp-signature"

--Sig_/2rmEAujUj/4o0PLwFzYCzy=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.h

between commit:

  ac213c1b45f7 ("drm/i915/icl: introduce tc_port")

from the drm tree and commit:

  9c229127aee2 ("drm/i915: hdmi: add CEC notifier to intel_hdmi")

from the mfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_display.h
index 9292001cdd14,1f176a71e081..000000000000
--- a/drivers/gpu/drm/i915/intel_display.h
+++ b/drivers/gpu/drm/i915/intel_display.h
@@@ -126,17 -126,30 +126,41 @@@ enum port=20
 =20
  #define port_name(p) ((p) + 'A')
 =20
+ /*
+  * Ports identifier referenced from other drivers.
+  * Expected to remain stable over time
+  */
+ static inline const char *port_identifier(enum port port)
+ {
+ 	switch (port) {
+ 	case PORT_A:
+ 		return "Port A";
+ 	case PORT_B:
+ 		return "Port B";
+ 	case PORT_C:
+ 		return "Port C";
+ 	case PORT_D:
+ 		return "Port D";
+ 	case PORT_E:
+ 		return "Port E";
+ 	case PORT_F:
+ 		return "Port F";
+ 	default:
+ 		return "<invalid>";
+ 	}
+ }
+=20
 +enum tc_port {
 +	PORT_TC_NONE =3D -1,
 +
 +	PORT_TC1 =3D 0,
 +	PORT_TC2,
 +	PORT_TC3,
 +	PORT_TC4,
 +
 +	I915_MAX_TC_PORTS
 +};
 +
  enum dpio_channel {
  	DPIO_CH0,
  	DPIO_CH1

--Sig_/2rmEAujUj/4o0PLwFzYCzy=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltQGysACgkQAVBC80lX
0GyWtwgAkfx7SoBcEja4BV+CoqMNFWVjwNxITqyRgkDRKUg9z5XsHItLdjCMX77T
URrgiVuLRaUV8G+6gKAboCzzdHUBhAMbUo0Uz/Q1yNDGesL4U4HbHkZWHZXzqKUB
yA3OFJVwOKJTMqGJJ8uQUV8RAbobxYK52apX5KgptUV7KVn4ZNfJ+DY6fg5NZLjr
lvlZd8w1pP4skDllrkP+jV7r0a50CEUEyjPEDrzcF3K3RYYhy/w05u9eiHHpEK6X
/X9ryM1eqA0u+lJI6ONC3WTvxWRcXYRPsmg/7jWB9C6xvwAZJm1InB3IzIQqw2CA
q20VuP2jtXQhCXr+MRP0s7LAyrxw2A==
=cmp4
-----END PGP SIGNATURE-----

--Sig_/2rmEAujUj/4o0PLwFzYCzy=--

--===============1232761936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1232761936==--
