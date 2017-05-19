From: Eric Anholt <eric@anholt.net>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Fri, 19 May 2017 10:49:06 -0700
Message-ID: <87y3tsg2jx.fsf@eliezer.anholt.net>
References: <20170519120729.597f5a9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170519120729.597f5a9e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Dave,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
>
> drivers/gpu/drm/pl111/pl111_drv.c:81:12: warning: 'pl111_modeset_init' defined but not used [-Wunused-function]
>  static int pl111_modeset_init(struct drm_device *dev)
>             ^
> drivers/gpu/drm/pl111/pl111_drv.c:149:26: warning: 'pl111_drm_driver' defined but not used [-Wunused-variable]
>  static struct drm_driver pl111_drm_driver = {
>                           ^

Sorry about that -- I thought that kbuild test robot would give me
notification of new warnings.

Patch incoming.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkfMBIACgkQtdYpNtH8
nuihjA//RfUwZsfDlghSoe5cMDMIL4TTyiT/5kf8F5BdHwOog77XOv2xHbge3TGV
U0g8bTPVzQ131Se2fi2WErs7zTbohCWhVo2rFnz9cA727jYSno7dhsMrJXDhsr76
HS99VeW0h5CLk13V9simKX3kdL3edGDXNOHersj10FsJaR2hZHkm0toX5wwoAs4J
8MCQkTHO0ZLHOw6TbwoFZe90qiBUoMp7iQcIBmpeIZzwlO4O7H7gNyqZ7OAHIJ6M
HVSDc5vbRlp2WaIiJkh9IeMeTMS/ujFBWzEGAUxcQ0ZaO7V5/BbucqW6Nx1q5Jfb
LTPaeL871HxV6YqhVDCuaMDcbgMCw7LuzOdRBluLsjyLs7JN4J8erC1LGipWiaeT
7TX7M6C2uohzuFYFhxFJANNm07dyx24ty+5yQ/V8SECZ4cNZdSK7BC6q3kIglzOG
0aIeQNtyu2LgOKrYHHtRpUW/ZDr8HSBtqn81yZSCKDiCZtW7TyUXDZ3Y+leNjovP
Zs3c0QOrJw3e9nLvV9NkUT5z9GlNas1U15vnL2x7Dmt5D2cKQ7b/Kw+WSK6XRDiz
q0zaZyPfTCk9GtImpI7qu7oq77Z7zheiVaMfKIIeSGfCsKlQWkNLtY0fRa3Grn0b
k+IiYQ4s+OjKY+xKLcMerTa+xlzOahtha+PL5fLCRJ/Ia0u3/ZI=
=zH6m
-----END PGP SIGNATURE-----
--=-=-=--
