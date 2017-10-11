From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the
	drm-intel-fixes tree
Date: Wed, 11 Oct 2017 09:51:06 +0100
Message-ID: <20171011085106.cusi65s2du3n537y@sirena.co.uk>
References: <20171010070300.6fsdy52752resxqn@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1849655819=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20171010070300.6fsdy52752resxqn@sirena.co.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--===============1849655819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6xi2arjyvwyiyavk"
Content-Disposition: inline


--6xi2arjyvwyiyavk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 08:03:00AM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build
> (x86_allmodconfig) failed like this:
>=20
>   CC [M]  drivers/gpu/drm/i915/i915_gem_evict.o
> drivers/gpu/drm/i915/i915_gem_evict.c: In function =E2=80=98i915_gem_evic=
t_for_node=E2=80=99:
> drivers/gpu/drm/i915/i915_gem_evict.c:318:31: error: implicit declaration=
 of function =E2=80=98i915_vma_has_userfault=E2=80=99; did you mean =E2=80=
=98i915_vma_pin_count=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    if (flags & PIN_NONFAULT && i915_vma_has_userfault(vma)) {
>                                ^~~~~~~~~~~~~~~~~~~~~~
>                                i915_vma_pin_count
>=20
> Caused by commit
>=20
>   72872c99b6dbc ("drm/i915: Check PIN_NONFAULT overlaps in evict_for_node=
")
>=20
> in the drm-intel-fixes tree.  I've used the tree from yesterday.

This is still present today.

--6xi2arjyvwyiyavk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnd23kACgkQJNaLcl1U
h9DTRAf/Wc/hdGZEi+BUeYKkRYibSSGh5HoTIvzj5nz2I5nRfG/R2NvIuNOKm0ZF
CNoH+TyvK5qFqb0MpR+q/+vBTQVoEYiQGrukG72dDwXeQV6wPgC8nE+TIekXAWuV
B+V+vaQAS9LfoWwe7ewjGUeaB1P+U3MUumYknw48IFWZEQ5lMTpLjPLeQ0ub3HBs
rw4pm9cfyKPLvxN/RqY5SlBR4SLjuO7EjamRqY9Gy7++R2FQ0zlLiHxYJRHQKbrK
0sUz1GLZbBbudBxCpcTHL9Oin0c1k+6W6QROdHKFwiR7eh1WAz3/nL6um0DnwNJR
NIgzCY1cRmCDw1062Arf7q+uDZHegg==
=mmXw
-----END PGP SIGNATURE-----

--6xi2arjyvwyiyavk--

--===============1849655819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1849655819==--
