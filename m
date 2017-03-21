From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the drm-tegra tree with the drm tree
Date: Tue, 21 Mar 2017 15:10:31 +0100
Message-ID: <20170321141031.GG30407@ulmo.ba.sec>
References: <20170321114545.39fdd45a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35142 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757680AbdCUOKk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Mar 2017 10:10:40 -0400
Content-Disposition: inline
In-Reply-To: <20170321114545.39fdd45a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 11:45:45AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the drm-tegra tree got a conflict in:
>=20
>   drivers/gpu/drm/tegra/drm.c
>=20
> between commit:
>=20
>   10437d9b475e ("drm: tegra: use vblank hooks in struct drm_crtc_funcs")
>=20
> from the drm tree and commit:
>=20
>   3f2ea8cee24f ("drm/tegra: Don't leak kernel pointer to userspace")
>=20
> from the drm-tegra tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Stephen,

your resolution looks good to me.

Dave,

the conflict is fairly trivial to resolve, but if you prefer I can
rebase the Tegra tree onto your -next to avoid it.

Thierry

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljRNFcACgkQ3SOs138+
s6H6xQ/+Ofad123Ok7Qz2j0YZnp3T0J6DWy1S098bU15Xz/J/DLb1MG3SfcFRdNs
GzK8otUrH5jfTGnwIOOc8dt9WGXoojPOOpNVIzGVh835Um9K7YnKj2+U3wUPcFwL
qk/W+YHqtxXFm4dXnA6kK19NNDvnofs22QSTePFHHfTkRpeEtruiq1F57A+Xvaci
nY7SeNyjVdbv2A5CPbxdu619jyptkjWQeOga64UHpPk9Bv3kmzP+XLMWQFxDvnbT
CemAn4RptBqQrKI6ctIjDDMdnV4C4NVqM0+cY83SUayIOMXUPb9gZdQUtP5C2FKp
5H2q9+KgLV6A9JC9JTRrY5iB5AvED64Y9bIjCN1s4CAO+cvJdHjFyRXhvxpzz6LO
cqzFq3CFezL2jzV8PDIxSsLuajtmp5QXeLUsLSSFiTe3ForlprlIobYLBOkAZIzI
0kEJXih897LxJYY5hj49r5f0Zb0KLqNqHMQL0Kb8UREqwcr1W01gK2/FGbRbm29H
a6k61rt8r/8Y2CXaJTln77DD0K/CCa2Z9cF3dL10RLTOvfpf9qczY0tGdlDE3EnG
rzujHDm7axC6liFDmrfKIGhIMT/eqPNrXGnCa9/A0rqH3usFTyGRFGoLJe13x5aD
em8vS7cHq3uBjFpocVoLHOQgbzdld84sl4JqRL1Hqnub8/llKow=
=q5pN
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
