From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Wed, 18 Oct 2017 10:27:58 +0100
Message-ID: <20171018092758.7fc7xtaxp23yoy6s@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0521221596=="
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============0521221596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zhf2gdgbml7cpbyh"
Content-Disposition: inline


--zhf2gdgbml7cpbyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_evict.c

between commit:

  99b169d3c2052 ("drm/i915: Fix eviction when the GGTT is idle but full")

=66rom the drm-intel-fixes tree and commit:

  9c1477e83e629 ("drm/i915/selftests: Exercise adding requests to a full GG=
TT")

=66rom the drm-intel tree.

I fixed it up (null diff) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--zhf2gdgbml7cpbyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnHp0ACgkQJNaLcl1U
h9CxFAf+NbDDYgsg7eEoh4jFJGbTNiJu80rCXFI+1nsrakaUcjVyXXKIGELvJ72L
OnTet+jtCMjgzIvIUTo89lk/Ftd9HcquSRU/LJ3cMV1KaTNi+P3ZfAFbYvS5y6/B
adlGyQeT2NI8fCav+78axufwFFvuMLmeimzldhvr3FT0rs2iNOUu61ChPOLB99mY
wctgKBoLTXFXps/UNZ7LlXArPXIHTwtd4HM6zNmGZOQ0TMdvqSTy858Cdz3jYnho
6s5/BRV9eCToWEnGt36VwXH7SJbj6kXZV6QUT50JoSACVzpReNNtmCO0Ct/8dMQB
/Yl0cxEuTUdK/2//HVUUSg+W6EOLVw==
=dze2
-----END PGP SIGNATURE-----

--zhf2gdgbml7cpbyh--

--===============0521221596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0521221596==--
