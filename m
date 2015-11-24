From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-panel tree
Date: Tue, 24 Nov 2015 18:07:23 +0100
Message-ID: <20151124170723.GA14090@ulmo.nvidia.com>
References: <20151124113816.3ed66bcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151124113816.3ed66bcc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Werner Johansson <werner.johansson@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-next.vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 11:38:16AM +1100, Stephen Rothwell wrote:
> Hi Thierry,
>=20
> After merging the drm-panel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_=
nt_panel_on':
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:65:8: error: implici=
t declaration of function 'mipi_dsi_turn_on_peripheral' [-Werror=3Dimplicit=
-function-declaration]
>   ret =3D mipi_dsi_turn_on_peripheral(dsi);
>         ^
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_=
nt_panel_disable':
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:79:2: error: implici=
t declaration of function 'mipi_dsi_shutdown_peripheral' [-Werror=3Dimplici=
t-function-declaration]
>   mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
>   ^
>=20
> Caused by commit
>=20
>   086ceb6b42ca ("drm/panel: Add Panasonic VVX10F034N00 MIPI DSI panel")
>=20
> I have used the version of the drm-panel tree from next-20151123 for toda=
y.

Okay, this should be fixed now in the drm/panel tree.

Thanks,
Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWVJlIAAoJEN0jrNd/PrOh7rsP/2wc7dx/td8fjUrl5K6tCCyE
Vvidzjpl1v73wVOoY7YLtdzflZ3E6+0/Nk+eWbYXse9fy4mKPLfltpJNOCKGqGCF
hQd0136z+RJwCKrJUdlA9iCy6Z1hExGDcIlDwUDGz3tJrTsg/rDyedYdW5ia312Z
s/EFvFk//f4d1yL8w9vElicsqpWd3MKppdRa2SsYKa2NOL7a39wUNMe5Ut6aKFjT
TXywP0ixTlnF9tZXUn0vwMzSZAfhi7Nfb4EUP5MF3q76aD1KpjPesnzNIHgE9DBr
uEQC1Ny04VyVQo83hsFEJfFSpIOJ0ZycpSA3Bhi2PBrfPwO9t74wuwq+xPdSRrA0
S134PtEun1XGb21MmPD9ub7leocU8bxn1AnEP8ZYW1HUDaSiJZ3HbTY2LTA3+5na
Q/h90wQH9mfp8gF4NIpf6WATf+FxI3ShdER9x4VXNNrPbmGCiLnut8fGcUMGPzXc
1aRr6/Oaak+g6izAdx1GJHCpL+eT2JyKgfgNZOYhMdWMF0X32/8GhVrB/qrBn3xp
vpsuoppIIza+jyd0jHeSYs/KJGlOhtBhvjppbAUSFT5d1CMzZDW2aOH/o11kUZuP
3JU2KRy6oNlamef5ieSUEx+P/q9Jytg5knGC5YRcBATTeu2qL6VRFX0Lr691JiYH
Eqs9X9VsoECMnFzQeIK+
=GYQO
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
