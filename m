From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: Tree for Feb 19 (gpu/drm/pl111/)
Date: Tue, 20 Feb 2018 11:07:55 +0100
Message-ID: <20180220100755.GG23425@ulmo>
References: <20180219131426.14ecac87@canb.auug.org.au>
 <5a671632-f746-52d2-1a9c-1e72a7e2f42b@infradead.org>
 <b1028c02-9633-47bf-e930-a20926e14ca9@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0909142347=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <b1028c02-9633-47bf-e930-a20926e14ca9@infradead.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org


--===============0909142347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2018 at 10:30:06AM -0800, Randy Dunlap wrote:
> [add Eric + dri-devel]
>=20
> On 02/19/18 09:26, Randy Dunlap wrote:
> > On 02/18/18 18:14, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20180216:
> >>
> >> The nand tree gained a conflict against Linus' tree.
> >>
> >> The drm tree gained conflicts against Linus' tree.
> >=20
> > on i386 (randconfig):
> >=20
> > warning: (DRM_PL111) selects DRM_DUMB_VGA_DAC which has unmet direct de=
pendencies (HAS_IOMEM && DRM && DRM_BRIDGE && OF)

I think this is caused by the fact that DRM_PL111 has || COMPILE_TEST in
the architecture dependencies, which causes it to be unavailable on
systems other than ARM and ARM64 where OF may not be implied. Then the
DRM_PL111 selects DRM_DUMB_VGA_DAC that has a dependency on OF.

I think the best solution would be to remove the select DRM_DUMB_VGA_DAC
=66rom DRM_PL111. Also see the warning against selecting visible symbols
in Documentation/kbuild/kconfig-language.txt (line 127).

> > and then
> >=20
> > ../drivers/gpu/drm/bridge/dumb-vga-dac.c: In function 'dumb_vga_probe':
> > ../drivers/gpu/drm/bridge/dumb-vga-dac.c:207:13: error: 'struct drm_bri=
dge' has no member named 'of_node'
> >   vga->bridge.of_node =3D pdev->dev.of_node;
> >              ^

Irrespective of the above, I don't think it's very useful to have
of_node conditionally included in this structure. This used to be the
case for struct gpio_chip (and others) and used to cause lots of such
build failures because people tend not to build-test OF vs. !OF

Thierry

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqL83gACgkQ3SOs138+
s6HwkA/9Er6eoWKkfjrFSIO6yZITLmunvFv7Y8KWURJI7ty7D846CxhnTIchcAGL
WHRt4/yvxwez1BbfcPCtwVBzF39v3LXtA9qOhONvDP76MC6kiWrA32IRC7jey6yP
kpGe5/XsIJzJu+e+M2qPAkzOyiSjobTuR6vIvDVKxOM2oM1lcxckcU/p/CknOFvG
RsIQxA0C478iM8rbMp8e095S1O4ESDsUeV5YogqNsx8JYLR9e0Mxzd3pW2YXnBLB
KThQA3cQJsiuPfSw6K3eSLRMkgRwlKPaLY0qnHyh7cGFP4p3GeK15gl0Zwazxf+U
bJg4P0nS0cisw8ZVg9KRyFEp8JV1Bpl8ZoYMnkgsNGhoiOjXmdSfAqTrSKX+N3AL
BemAxPlA9loDeoBt4zYIrlW3HPuykgBqZQC9q140E/EDTFeXTEfa9zRoQGv3or0Y
I2YIgqamWrAq16va/OeFUv6MpUF6XwbAh59ihY2gCrHghTNybnTPp6Yy08zpayot
yviQInfL+A9xOtxc/OzgErp6EN45b17VGdFjan7o+F00XS545TAWcunADKAhzDuP
7IzkT/TDWwxRuye6X/apkbUEy6NDlfSx7cHvIpDzCAtsv2iso7kp8PR/TWMaOHah
RlqbI6ap5je73mLSupw6HYdWqp/PvPT8Iz1PLB1o0NpODFlgYjU=
=p7zH
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--

--===============0909142347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0909142347==--
