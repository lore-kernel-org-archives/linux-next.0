From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the imx-mxs tree
Date: Mon, 1 Jun 2015 22:35:37 +1000
Message-ID: <20150601223537.05b813c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iW78vVaVd_G=I=_paJAJBQd"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57206 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbbFAMfv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 08:35:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/iW78vVaVd_G=I=_paJAJBQd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

After merging the imx-mxs tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/clocksource/timer-imx-gpt.c: In function 'mxc_clocksource_init':
drivers/clocksource/timer-imx-gpt.c:173:2: error: invalid use of undefined =
type 'struct delay_timer'
  imx_delay_timer.read_current_timer =3D &imx_read_current_timer;
  ^
drivers/clocksource/timer-imx-gpt.c:174:2: error: invalid use of undefined =
type 'struct delay_timer'
  imx_delay_timer.freq =3D c;
  ^
drivers/clocksource/timer-imx-gpt.c:175:2: error: implicit declaration of f=
unction 'register_current_timer_delay' [-Werror=3Dimplicit-function-declara=
tion]
  register_current_timer_delay(&imx_delay_timer);
  ^
drivers/clocksource/timer-imx-gpt.c: In function 'mxc_timer_init':
drivers/clocksource/timer-imx-gpt.c:458:2: error: implicit declaration of f=
unction 'clk_get_sys' [-Werror=3Dimplicit-function-declaration]
  imxtm->clk_per =3D clk_get_sys("imx-gpt.0", "per");
  ^
drivers/clocksource/timer-imx-gpt.c:458:17: warning: assignment makes point=
er from integer without a cast
  imxtm->clk_per =3D clk_get_sys("imx-gpt.0", "per");
                 ^
drivers/clocksource/timer-imx-gpt.c:459:17: warning: assignment makes point=
er from integer without a cast
  imxtm->clk_ipg =3D clk_get_sys("imx-gpt.0", "ipg");
                 ^
drivers/clocksource/timer-imx-gpt.c:461:31: error: 'SZ_4K' undeclared (firs=
t use in this function)
  imxtm->base =3D ioremap(pbase, SZ_4K);
                               ^

I am not quite sure what caused this ... I have disabled the driver
again today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/iW78vVaVd_G=I=_paJAJBQd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVbFGkAAoJEMDTa8Ir7ZwVX10QAJB+Oc8XKJy3/ojf/4bvFsMt
dMpwymolphXQLVqDIf0uB5EOGJaPx404UOjIA85vqlgbfBVvK5KRCoDR6LvEdWKs
Z65vUpX3oogr8SnBuRmOwLyHsKjCeSE51zRWog4X5GpXHS4xHce8HEVuXkNsJDt2
avBldl0Xva15al7budGtM5mp77VHBnKsqI7z91607bL7owDSlG1ckjeLHTOxwdxJ
x6QRY8iFgmeXl+sRjlyTjQRXLlZ56cxRQyQWEXDS7p6BaKdxuubetumfzckuVEvR
gGDCUxcPkTDyBa0ujFJ1s+2b7iaGkygktY8DmQuI4Z8ZgZTbiU5UarGLaBg6f3Ys
5y24Wrkb7k+BhFrkg6hnaYA9qsPr5d+h55yNmpQ24f8WsumV5J1q0VnMOoaX3p5W
oarl92G/8DdNOUOBOu1n9aaZBssCTNjJGKL6Fhs71EhuUV8SWMpEEuCLYuFQFEDJ
LirbYCxRV8bhwaDEidZZG1ghpXlu4q0BHTcQl7hU2k8HoVl6rt44jIWNTj7fnZMc
Wf2MNr1LbkHq0+wSFnnEjMEojMBmGzhRUF0mHH25NuvLsfOEz1RLl34UBwXEQypz
lROLD781wGJWzlRXkZMMs4dsX2SgHNlo5rv4/hejWnEY6yr7T0YUarDLBriCMKKi
To0qvq44YEGNurY6gyl4
=l6oN
-----END PGP SIGNATURE-----

--Sig_/iW78vVaVd_G=I=_paJAJBQd--
