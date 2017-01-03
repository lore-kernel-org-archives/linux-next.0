From: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the
	drm-intel-fixes tree
Date: Tue, 3 Jan 2017 17:23:17 +0800
Message-ID: <20170103092317.slzmtrdzzrjzbypw@zhen-hp.sh.intel.com>
References: <20170103104239.67dd95ba@canb.auug.org.au>
 <20170103025929.35gp5n27uc7iszra@zhen-hp.sh.intel.com>
 <20170102214857.6ad8f2eb@t450s.home>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576086518=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20170102214857.6ad8f2eb@t450s.home>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Alex Williamson <alex.williamson@redhat.com>, Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============0576086518==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w4gswvv4j7ry4hg5"
Content-Disposition: inline


--w4gswvv4j7ry4hg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.01.02 21:48:57 -0700, Alex Williamson wrote:
> > Alex, I liked to have kvmgt related mdev interface change be merged thr=
ough
> > vfio tree, but wasn't awared one of Jike's fix had conflict. Could you =
apply
> > below fix in your tree? I think in general for possible interface chang=
e in
> > future we still need a pull request for i915 to resolve dependence earl=
ier.
>=20
> Hi Zhenyu,
>=20
> Hopefully this abstraction will help to isolate vendor drivers from
> mdev API changes in the future.  I can certainly roll this patch into
> the original to maintain bisectability.  I want to get these changes in
> for rc3, will a pull request for the i915 changes be sent this week?

Send to Jani who is managing i915 fixes pull.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--w4gswvv4j7ry4hg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlhrbYQACgkQsQQaM014GCdQPgCfcxsMcDrspzblPj+45DWrFM6t
OIMAn34ydJi4vzj+qkQ8QiASebEyaNm7
=uzty
-----END PGP SIGNATURE-----

--w4gswvv4j7ry4hg5--

--===============0576086518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0576086518==--
