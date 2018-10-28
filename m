From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 29 Oct 2018 10:14:01 +1100
Message-ID: <20181029101401.5687153e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/d9nsqprRH15JcB7tgCezAl2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/d9nsqprRH15JcB7tgCezAl2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  include/linux/platform_data/gpio-omap.h

between commit:

  b764a5863fd8 ("gpio: omap: Remove custom PM calls and use cpu_pm instead")

from Linus' tree and commit:

  26683316c92a ("ARM: OMAP1: ams-delta-fiq: Use <linux/platform_data/gpio-o=
map.h>")

from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/platform_data/gpio-omap.h
index 8485c6a9a383,ed071f76b642..000000000000
--- a/include/linux/platform_data/gpio-omap.h
+++ b/include/linux/platform_data/gpio-omap.h
@@@ -205,4 -206,18 +208,6 @@@ struct omap_gpio_platform_data=20
  	int (*get_context_loss_count)(struct device *dev);
  };
 =20
 -#if IS_BUILTIN(CONFIG_GPIO_OMAP)
 -extern void omap2_gpio_prepare_for_idle(int off_mode);
 -extern void omap2_gpio_resume_after_idle(void);
 -#else
 -static inline void omap2_gpio_prepare_for_idle(int off_mode)
 -{
 -}
 -
 -static inline void omap2_gpio_resume_after_idle(void)
 -{
 -}
 -#endif
+ #endif /* __ASSEMBLER__ */
+=20
  #endif

--Sig_/d9nsqprRH15JcB7tgCezAl2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWQrkACgkQAVBC80lX
0Gx+3wf+JWhRFq0AfMargiT/sYDUVLQj/oHH2GezYMG/YNaQ51kzFdZVoghK5RSu
vscPIRjTO8KepO4KyV+WXAff2EyaJshEL+tX821be/XLiVoNewqkXKLlW7A+zV67
ZjIJeD5ZNACNNBPPJJ8d/SG7yGyYIuoJMGE5SyGCkKALGyzoHXusPh+HacBHWbpU
OZRYXlaRXl1hJL72UYj4ERqxDtMk5hUyyQd/C0WwGuxY/OzbsqQIM/P2YB8POTrR
ytvwCWEspxgrKdWgdGVG/6haTMXax3iZrdgMPm/GYWWu1AwZA+KEmilo4OQ9PrKQ
PrEGM5eqeQhEPQZuH6Q93FIr5YaZ8A==
=fs1j
-----END PGP SIGNATURE-----

--Sig_/d9nsqprRH15JcB7tgCezAl2--
