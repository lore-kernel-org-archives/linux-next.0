From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clockevents tree
Date: Mon, 3 Jun 2019 12:13:50 +1000
Message-ID: <20190603121350.653cacce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uiNiVsT1gh9W9UsmKqw3sG."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-next.vger.kernel.org

--Sig_/uiNiVsT1gh9W9UsmKqw3sG.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

After merging the clockevents tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clocksource/timer-atmel-tcb.c: In function 'tcb_clksrc_init':
drivers/clocksource/timer-atmel-tcb.c:448:17: error: invalid use of undefin=
ed type 'struct delay_timer'
   tc_delay_timer.read_current_timer =3D tc_delay_timer_read32;
                 ^
drivers/clocksource/timer-atmel-tcb.c:461:17: error: invalid use of undefin=
ed type 'struct delay_timer'
   tc_delay_timer.read_current_timer =3D tc_delay_timer_read;
                 ^
drivers/clocksource/timer-atmel-tcb.c:476:16: error: invalid use of undefin=
ed type 'struct delay_timer'
  tc_delay_timer.freq =3D divided_rate;
                ^
drivers/clocksource/timer-atmel-tcb.c:477:2: error: implicit declaration of=
 function 'register_current_timer_delay'; did you mean 'read_current_timer'=
? [-Werror=3Dimplicit-function-declaration]
  register_current_timer_delay(&tc_delay_timer);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  read_current_timer
drivers/clocksource/timer-atmel-tcb.c: At top level:
drivers/clocksource/timer-atmel-tcb.c:129:27: error: storage size of 'tc_de=
lay_timer' isn't known
 static struct delay_timer tc_delay_timer;
                           ^~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Caused by commit

  dd40f5020581 ("clocksource/drivers/tcb_clksrc: Register delay timer")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uiNiVsT1gh9W9UsmKqw3sG.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0gl4ACgkQAVBC80lX
0GymIAf6Am/0TmqRiFkcEGVXjoVYebQ0q9Oufbjgztq39uLYcVx/l/k4lZigNAMG
RFHwh+Q9M4qZ7Zo/6E5Fo3LUqGMVQehgcd2oQRRCel4Sh3PrVCCvGWPiCoctQ7HQ
jftHQr1u89MPuv0kHkh/bcpQBJRj0d7JTvPnyzBvcWQGxL70eBtRMX1SyIoFtFus
z4GsO/sir6pY92ef0UWmhIiFOPm5HFtW5qu6zDOjhorLlaVwTfdz21U1++GyVydU
tgQoij4cNnUa5zPj7sVsifFpGucTRhejpIlq/mpWdGVmcrHyELCjLphjKuk+KuW+
IibTnBJbpeUaEJjcRr+1LMqY+RMhQQ==
=69wL
-----END PGP SIGNATURE-----

--Sig_/uiNiVsT1gh9W9UsmKqw3sG.--
