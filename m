From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the drm-intel tree with
 the drm-intel-fixes tree
Date: Tue, 17 Oct 2017 09:30:27 +0100
Message-ID: <20171017083027.fdzk3ujcgted3q5g@sirena.co.uk>
References: <20171016113529.ey35y6zwfyhdbvhe@sirena.co.uk>
 <CAK8P3a0bz3XzPsso0T-AfiBn7K_wRHauAckt5rB5dmNt4Fa-bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1371529664=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <CAK8P3a0bz3XzPsso0T-AfiBn7K_wRHauAckt5rB5dmNt4Fa-bw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Mika Kuoppala <mika.kuoppala@intel.com>
List-Id: linux-next.vger.kernel.org


--===============1371529664==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v54q5lmczlwx4kc3"
Content-Disposition: inline


--v54q5lmczlwx4kc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 10:11:53AM +0200, Arnd Bergmann wrote:

> This merge seems fine, but it seems there was another merge
> against the akpm tree that introduced a build error by reintroducing
> the spin_lock_irqsave() without restoring the local variable:

> drivers/gpu/drm/i915/i915_gem.c: In function 'nop_submit_request':
> drivers/gpu/drm/i915/i915_gem.c:3092:54: error: 'flags' undeclared
> (first use in this function); did you mean 'class'?

> I'll send my local build fix, which may or may not be the intended
> behavior but gets it to compile.

Bother, that was actually an automated merge git did.

--v54q5lmczlwx4kc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnlv6IACgkQJNaLcl1U
h9Dbpgf/eJBV7hjkXYitbMhKmxa4jTDVxh87t2u3mLQLFQCP1vvlVN9/suGHvyPT
AOAYkvmTunKvX0OdgBwXOYd+f4PdHd9zhkWLBbVfyxAAfuyN+5HETpitRnTW0n3B
vtxNdbZWfDu4TlTS2eSNsMAx1q3lQ1l+Z+pnpHPRDuQA4/L1kGL8ZNo63leyxPQM
fbm8lk7f4T27GY7ZqA+fjRDIwKixHAAjjmXTv5TJNiZIqZikAI8MQq5Z8R7/npIB
yAsxsVGgHcngmC1cXaSR1zN793+udBl6bctLgE807bvYIiITBXoKZHdZsuV6oDcy
F7Kd+wzrieCdBS4te6U1DaQB57cNug==
=EBRB
-----END PGP SIGNATURE-----

--v54q5lmczlwx4kc3--

--===============1371529664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1371529664==--
