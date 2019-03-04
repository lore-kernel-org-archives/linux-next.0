From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Mon, 4 Mar 2019 11:54:02 +1100
Message-ID: <20190304115402.223de52e@canb.auug.org.au>
References: <20190301132351.6f4e815f@canb.auug.org.au>
 <CADnq5_PXqjcQeH1vh9ftpPfoCzD5SfdcXQSqAh2BPgrs1V28LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0602343754=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CADnq5_PXqjcQeH1vh9ftpPfoCzD5SfdcXQSqAh2BPgrs1V28LQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@linux.ie>
Cc: David Francis <David.Francis@amd.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0602343754==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/r0Rs+tqKiKCUzr2xOLRXqYn"; protocol="application/pgp-signature"

--Sig_/r0Rs+tqKiKCUzr2xOLRXqYn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 1 Mar 2019 18:29:58 -0500 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> On Thu, Feb 28, 2019 at 9:24 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >
> > between commit:
> >
> >   d63716658ac1 ("drm/amd/display: Use vrr friendly pageflip throttling =
in DC.")
> >
> > from the drm-fixes tree and commits:
> >
> >   8a48b44cd00f ("drm/amd/display: Call into DC once per multiplane flip=
")
> >   bc7f670ee04c ("drm/amd/display: Perform plane updates only when neede=
d")
> >
> > from the drm tree.
> >
> > I had no idea how to resolve this, so I just effectively reverted the
> > drm-fixes commit.
> >
> > I fixed it up (see above) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> d63716658ac1 ("drm/amd/display: Use vrr friendly pageflip throttling
> in DC.") should be reverted and this should be applied instead for
> drm-next:
> https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Ddrm-next-5.2-wip&id=
=3D5d5f43c235d02e4d8e9d50d012f3b21f380486eb

Maybe you should merge the drm-fixes tree into the drm tree and apply
the above ...=20
--=20
Cheers,
Stephen Rothwell

--Sig_/r0Rs+tqKiKCUzr2xOLRXqYn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx8dyoACgkQAVBC80lX
0GwHKgf+MMoxME+moZkFUbI6XP7TWtwxqL646v3cBIvIP2NtYzdKEQgeP8QrFO0s
S0iQFKeDWGydbOrehG8nxkkN411MlsRQO6K9Uq5OCoUQhU+MnutgQ2GlsM4YW59z
C8gSRaMguBOD5Ppc0AWxnIpQXNJH4cPixA6kfDElADObpyMDie5UYVKDfi6rsu4u
E2fObc2x6MrWbURyXqGoPZ9nr841Su3ZeIsYL2M6uz4b8dOM0hyJRAG/fPIhAhuz
5D89TprjNXQgdPpE/VF5ULejd1Q8mTAgp580NKn/TLvtxAlJSHqEzHNvBmWiMxEY
xQbmuU9nlduR0AMpc4kFrKtkZ0RpIA==
=+dEB
-----END PGP SIGNATURE-----

--Sig_/r0Rs+tqKiKCUzr2xOLRXqYn--

--===============0602343754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0602343754==--
