From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mfd tree with the drm-intel tree
Date: Thu, 26 Jul 2018 15:10:06 +1000
Message-ID: <20180726151006.345e8397@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OqOb2rGIAWkW6AeTXQUgwo2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OqOb2rGIAWkW6AeTXQUgwo2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.h

between commit:

  6075546f57f8 ("drm/i915/icl: store the port type for TC ports")

from the drm-intel tree and commit:

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
index 0a79a46d5805,1f176a71e081..000000000000
--- a/drivers/gpu/drm/i915/intel_display.h
+++ b/drivers/gpu/drm/i915/intel_display.h
@@@ -126,24 -126,30 +126,48 @@@ enum port=20
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
 +enum tc_port_type {
 +	TC_PORT_UNKNOWN =3D 0,
 +	TC_PORT_TYPEC,
 +	TC_PORT_TBT,
 +	TC_PORT_LEGACY,
 +};
 +
  enum dpio_channel {
  	DPIO_CH0,
  	DPIO_CH1

--Sig_/OqOb2rGIAWkW6AeTXQUgwo2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZV64ACgkQAVBC80lX
0GwIrQf9FKuAHEh5iVG/5WG74N9MyvB8r1NKU+QGUnStmOteX2RJqb5tbGHft0V6
YAN7W2L3PYzUZn922txaQw0Ri9MTVJp1KV2eXNTaTgWbNlhNYDRJ0SFTFgdZ6qWW
8zsKC8VTLLFDz7E64ybjqtQP47QIGI1JsaL2HlJ1uLmYwRAPtflcCryxApUXSwfp
8yTLCMIFpW/hDjNfEa+h7qzrDTffeF7bWUjH4F4di9gf/uaa7yk+X97mG64kFpJh
M8P+hmSN5laIVYRKH+GOH3zHgoQocA8ldd661mXT34ca/clFFYUqIvhbUS8Rnr3e
HsahuQFSd2Q8zcaUce+Im6+czrYBUg==
=R/4Z
-----END PGP SIGNATURE-----

--Sig_/OqOb2rGIAWkW6AeTXQUgwo2--
