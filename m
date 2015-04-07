From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 21:00:19 +1000
Message-ID: <20150407210019.570f7d35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A8td.iHEozsO68KxWwxjHU4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58223 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752037AbbDGLAa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 07:00:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Don Zickus <dzickus@redhat.com>

--Sig_/A8td.iHEozsO68KxWwxjHU4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
Documentation/sysctl/kernel.txt between commit e164ade07b21 ("watchdog:
add watchdog_exclude sysctl to assist nohz") from the tile tree and
commit 25909f748a50 ("watchdog: update documentation for kernel params
and sysctl") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc Documentation/sysctl/kernel.txt
index aad9f9ba347c,c831001c45f1..000000000000
--- a/Documentation/sysctl/kernel.txt
+++ b/Documentation/sysctl/kernel.txt
@@@ -858,15 -904,25 +904,34 @@@ example.  If a system hangs up, try pre
 =20
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
+ watchdog:
+=20
+ This parameter can be used to disable or enable the soft lockup detector
+ _and_ the NMI watchdog (i.e. the hard lockup detector) at the same time.
+=20
+    0 - disable both lockup detectors
+    1 - enable both lockup detectors
+=20
+ The soft lockup detector and the NMI watchdog can also be disabled or
+ enabled individually, using the soft_watchdog and nmi_watchdog parameters.
+ If the watchdog parameter is read, for example by executing
+=20
+    cat /proc/sys/kernel/watchdog
+=20
+ the output of this command (0 or 1) shows the logical OR of soft_watchdog
+ and nmi_watchdog.
+=20
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
 +watchdog_exclude:
 +
 +This value can be used to control on which cpus the watchdog is
 +prohibited from running.  The default exclude mask is empty, but if
 +NO_HZ_FULL is enabled in the kernel config, and cores are specified
 +with the nohz_full=3D boot argument, those cores are excluded by default.
 +
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +
  watchdog_thresh:
 =20
  This value can be used to control the frequency of hrtimer and NMI

--Sig_/A8td.iHEozsO68KxWwxjHU4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI7jLAAoJEMDTa8Ir7ZwVfOoP/jXF0Ne1E40m+zFYGBHb24Bt
JwrsCIHNGHHoqlOD0kxwLfGjCjPFzM/a/T2GvQ3P6SjgrZs8VcVczlrriHtiqS2r
lT3FCwZ7rw/6y9Fket7DNUKSflOhfvXrdfI+9yOumDOLtqkPwl2V27mGCBJj+2nR
pEDFMUydk2mD/4rMaqJW14/weXhOOQUGlOSdYn3D6xT585l6wLol5xLMiEaB4oku
Sl5P48/MElTmy5S2bQr6XCx36yZYLUuvqWe9/56Y6xHgoKlUTtze+X+1zTEo6tWl
O5cwUcYoJqTRc6TTIAQWYDeuGTnI8taT49kukRgcDNVltnVgebd6jnQMAak8mkBg
zonh4d57fkF2SBi6ikERnYqT9yAFNaz4YFL8GctwSX1jhazSro0ReYns/BesnC5f
4whB7745YXw0kvgZx72B2VxQHbCvAccNlfprEsPHHWrxQRnEdgqzyuQzGWMkaEG9
4CUb2T3r/BqiltfTDsiw6W+1rCGmS/Z0umDSOq8ltaC1ER9Yq9LdWmHsB0BwTBzR
OFtRRgMdU6q5TNQV+hEsjg5b814grQOtOcbhjjrDAKMXRgiLHw+cg7s3LxZA2kce
5OPVFRD8w2p/8ZjBrJSfLSses6cskA5vJ6KtrLJKuO6R3CPNQbKquM3hQz77yMG/
yHcqD6xQbPMBVhxqR02A
=j7Ay
-----END PGP SIGNATURE-----

--Sig_/A8td.iHEozsO68KxWwxjHU4--
