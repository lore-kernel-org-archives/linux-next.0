From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 14 Apr 2015 09:47:35 +1000
Message-ID: <20150414094735.7fea2b06@canb.auug.org.au>
References: <20150407111217.2b2cf440@canb.auug.org.au>
	<CABuKBe+iBfmxHat3Ezinpd-85CA5m1f2gYydk=uW4SwABQ-0Wg@mail.gmail.com>
	<CACRpkdZE0JB0xBENNPhi6g4Su5ZuZA0wf1mi8xzbLeKm3rOYjA@mail.gmail.com>
	<2111946.bc0NbpO0Gp@wuerfel>
	<CACRpkdYmnEsVkfw64ihMP6BHK3+R0eiYqzHbEM1-hBcau1Nwwg@mail.gmail.com>
	<CABuKBe+p-hW_8fW4ocq10KM5=CZunoQwJ8+mp4n1U04NBoOPtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sA42o_ry8nPKzmBz+ryDQhC"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33048 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbbDMXrm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 19:47:42 -0400
In-Reply-To: <CABuKBe+p-hW_8fW4ocq10KM5=CZunoQwJ8+mp4n1U04NBoOPtw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

--Sig_/sA42o_ry8nPKzmBz+ryDQhC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Apr 2015 16:59:49 +0200 Matthias Brugger <matthias.bgg@gmail.com>=
 wrote:
>
> 2015-04-08 16:49 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> > On Tue, Apr 7, 2015 at 2:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Tuesday 07 April 2015 11:28:22 Linus Walleij wrote:
> >>> On Tue, Apr 7, 2015 at 10:43 AM, Matthias Brugger
> >>> <matthias.bgg@gmail.com> wrote:
> >>> > 2015-04-07 3:12 GMT+02:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> >>> >> Hi all,
> >>> >>
> >>> >> After merging the arm-soc tree, today's linux-next build (arm
> >>> >> multi_v7_defconfig) failed like this:
> >>> >>
> >>> >> In file included from arch/arm/boot/dts/mt8135.dtsi:18:0,
> >>> >>                  from arch/arm/boot/dts/mt8135-evbp1.dts:16:
> >>> >> arch/arm/boot/dts/mt8135-pinfunc.h:18:40: fatal error: dt-bindings=
/pinctrl/mt65xx.h: No such file or directory
> >>> >>  #include <dt-bindings/pinctrl/mt65xx.h>
> >>> >>                                         ^
> >>> >>
> >>> >> Caused by commit e6f219b8ec5e ("ARM: dts: mt8135: Add pinctrl/GPIO=
/EINT
> >>> >> node for mt8135").
> >>> >
> >>> > This will be fixed as soon as Linus pinctrl for-next branch got mer=
ged [1].
> >>>
> >>> Hm that's unfortunate, we do not rely on merge orders.
> >>>
> >>> Either the ARM SoC tree needs to pull in the pinctrl commit
> >>> or I need to carry this patch in the pinctrl tree.
> >>>
> >>> Is this sufficiently stand-alone to be merged into my tree
> >>> or do you need to go by the former approach?
> >>
> >> Let's just delay this patch to another merge window. You can add the
> >> driver now, and we should just revert the DT node addition in arm-soc,
> >> and then we'll add it in 4.2, or come up with a better solution.
> >
> > OK. I'm not applying it then.
>=20
> @arnd: I will send the patch in the next merge window then. Do you
> want me to do anything else for this merge window (e.g. resend the
> pull request without the patch)?

I am still applying my reversion patch to the arm-soc tree merge ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/sA42o_ry8nPKzmBz+ryDQhC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLFWbAAoJEMDTa8Ir7ZwV76gP/1Cmdc6SVB7PQKu9utbL+rkb
ERRENI4+omRcUP7ia6d6bFrHkehEwNRWsX99vhyRmRM3FnvLZdzOVxyPeJ8KRX2z
8y0naK+wN8JKgc/F8XJ71s8M1X01w3R7B3aEG8ZxISRUD+mLyTQgVrEZV6EJ+o1O
3BNUkxV/DSqvVsQASIzsZzDKpEcaXYMJO7A60dr+vJkDZ2019cCREj9bZLUohhca
qNAg4c7ew35kIEdewFKOdXanxm2zKKrwbZIeFfRLUckDendKZFCVjI5xgoFSyyMK
H84bkxbp0iYUIQkqcLFBr4DT2hxEpMnXbIsG/HoULWYq3eAYD4090yuC8v9Y03Wi
7wnba7HMce2+YASez/dtXrfjCp0tDc2SgEKVbp52B0p/0smKb+LajD4sjj5QdZhp
KK/C8ZC9hSEFaDB1QejQYvNe5ycvZj43WAAZoo35+N7vgMJRivNqRQxSPPZfvCO8
UYYh+IoRqVwMdnokgumdJZgZxzzv8jzEuGslEW1DbpXyYDduHHGuQZHO6PjF0Fs+
QDvy5bHIWRPfFZcgCLcUC4mvFfBhWi+PjSD9+2xsMVV9rslCGjXFJhiGkoZa4lcJ
eAMgiphMN9SOgsgqvMKSKc4yPE5v8cQb3pdx/lzO4VaEhRxetzbBftHFq8NCtet+
H4XVKUv+315DgSNeLS7W
=0LIK
-----END PGP SIGNATURE-----

--Sig_/sA42o_ry8nPKzmBz+ryDQhC--
