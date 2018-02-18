From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 19 Feb 2018 10:10:50 +1100
Message-ID: <20180219101050.0a1514e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238047540=="
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
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============1238047540==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P17WcQI3Tc.MVWsW1UimB00"; protocol="application/pgp-signature"

--Sig_/P17WcQI3Tc.MVWsW1UimB00
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_breadcrumbs.c

between commit:

  117172c8f9d4 ("drm/i915/breadcrumbs: Ignore unsubmitted signalers")

from Linus' tree and commit:

  b7a3f33bd5ab ("drm/i915/breadcrumbs: Drop request reference for the signa=
ler thread")

from the drm tree.

These are basically identical for the conflicting section except that
the former added a line:

	GEM_BUG_ON(!i915_gem_request_completed(request));

which I left in.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/P17WcQI3Tc.MVWsW1UimB00
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqKB/oACgkQAVBC80lX
0GxxNgf/ZUzIScORpShGKUS2sZtpz5ALI5/Si3ZkVsv5xBP89x1ELA5WjCvpa1ey
PigMK34/jMmXtewX8CB2IU0tQukEKRhOu7SKDT1tj9dUcHvk0iRPT5ENMCQnEFb5
5MX5G5WgJPl+i0TvxbTGSZCt0XDRaigCwmac/Gf6TR+4w6wG8SF+CYWafme9JPrD
t+UYUwj33kONOtb2FDqsWvB3IBblHMlwvbevP9o7f8GgBAKgsHOsP9Ketxpk7dmt
kVFyjtLXQYt3YGHJ1ujL7HaFlPmeBZCzcjPmwQAldet+YwWBDInbSZjdsRvMOvu5
k79R6qTl0WVP6vJAkhrimOg8O9lVhw==
=5lv5
-----END PGP SIGNATURE-----

--Sig_/P17WcQI3Tc.MVWsW1UimB00--

--===============1238047540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1238047540==--
