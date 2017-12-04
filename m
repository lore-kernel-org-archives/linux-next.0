From: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in
	the drm tree
Date: Mon, 4 Dec 2017 10:32:03 +0800
Message-ID: <20171204023203.boxnkfvlc37bb5pu@zhen-hp.sh.intel.com>
References: <20171204105735.433ba206@canb.auug.org.au>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0976010248=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20171204105735.433ba206@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-Id: linux-next.vger.kernel.org


--===============0976010248==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4llyxk7j427yzzhq"
Content-Disposition: inline


--4llyxk7j427yzzhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.12.04 10:57:35 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> There is a series of commits
>=20
>   54cff6479fd8 - c1802534e5a6
> (not all in that range)
>=20
> that are missing a Signed-off-by from their committer.
>=20

They were originally committed by Zhi himself, but I had to rebase
onto intel -next before they're sent for pull and missed my signed-off..
Really sorry for that! I think maybe we could still be able to fix that
before next kernel merge.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4llyxk7j427yzzhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCWiSzowAKCRCxBBozTXgY
J8FjAJ9+JX861XyHJRwT8+URFAPHntpMhACfWtyVBsr+SXBZCc1UCGygMmOK6D4=
=JSp4
-----END PGP SIGNATURE-----

--4llyxk7j427yzzhq--

--===============0976010248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0976010248==--
