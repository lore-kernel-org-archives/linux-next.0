From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the sound-asoc tree
 with the drm-misc tree
Date: Wed, 18 Oct 2017 15:52:45 +0100
Message-ID: <20171018145245.abldlx2e5to3gsfs@sirena.co.uk>
References: <20171018095733.2ffvg6ty6kn2lfdf@sirena.co.uk>
 <BN6PR12MB16527C9DCEEA4D46EEF1AA90F74D0@BN6PR12MB1652.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0319941127=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <BN6PR12MB16527C9DCEEA4D46EEF1AA90F74D0@BN6PR12MB1652.namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Liam Girdwood <lgirdwood@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Zhu, Rex" <Rex.Zhu@amd.com>
List-Id: linux-next.vger.kernel.org


--===============0319941127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yxif5v3te6abevwt"
Content-Disposition: inline


--yxif5v3te6abevwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2017 at 02:30:50PM +0000, Deucher, Alexander wrote:

> The patch below effectively reverts 1e4448648333a.  If you drop the patch below, you should be fine.

As I said in my followup mail I've dropped all these patches due to
build failures, please resend both the pull request and the patches with
any required fixups.

--yxif5v3te6abevwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnarwACgkQJNaLcl1U
h9CJIQf/SbcYITzIznC585ZPeALQk+UX6bmctMLX1BSqqf3oy5zPku9qAQsb2KBw
n6vWJ1ltJRMvmp/x1UDj4gKSaRn3faem/09xXdejWF8lzyMrTjwVOVWE8wYlcsRq
lkEJrn8jDuOdGSFi+4c7ls4egsSb4vJwID+K87aA4TX1zygg84EZ8GyHebUvIdXj
6eOQyq0YVH3Q7aBWy8eMYIUU7wVr98c5Cotgqmq4r+Z0bXOvqpmw9wE3X1J5wwKc
smCLQf1C1U9MUXygsjWcXUd1citrF3MpeNx4LCHcT4waFz8uWaGRCVH8J+YAIJg0
z5jPwfyU4i8mR9Hrqd+c2N3hnwUONg==
=RvOy
-----END PGP SIGNATURE-----

--yxif5v3te6abevwt--

--===============0319941127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0319941127==--
