From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: build failure after merge of the clockevents tree
Date: Tue, 4 Jun 2019 07:56:45 +0200
Message-ID: <6592f64c-79c1-7ac4-dfa5-499362539319@linaro.org>
References: <20190603121350.653cacce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NrJx8NTzwLwIiQQR8J2rTXucbgAU2hrW5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603121350.653cacce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NrJx8NTzwLwIiQQR8J2rTXucbgAU2hrW5
Content-Type: multipart/mixed; boundary="lhrNJrKFPsbnxvHxyPMMfXzt6lrMJuyEZ";
 protected-headers="v1"
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <6592f64c-79c1-7ac4-dfa5-499362539319@linaro.org>
Subject: Re: linux-next: build failure after merge of the clockevents tree
References: <20190603121350.653cacce@canb.auug.org.au>
In-Reply-To: <20190603121350.653cacce@canb.auug.org.au>

--lhrNJrKFPsbnxvHxyPMMfXzt6lrMJuyEZ
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Stephen,

I dropped the patch from my tree.

Thanks

  -- Daniel

On 03/06/2019 04:13, Stephen Rothwell wrote:
> Hi Daniel,
>=20
> After merging the clockevents tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/clocksource/timer-atmel-tcb.c: In function 'tcb_clksrc_init':
> drivers/clocksource/timer-atmel-tcb.c:448:17: error: invalid use of und=
efined type 'struct delay_timer'
>    tc_delay_timer.read_current_timer =3D tc_delay_timer_read32;
>                  ^
> drivers/clocksource/timer-atmel-tcb.c:461:17: error: invalid use of und=
efined type 'struct delay_timer'
>    tc_delay_timer.read_current_timer =3D tc_delay_timer_read;
>                  ^
> drivers/clocksource/timer-atmel-tcb.c:476:16: error: invalid use of und=
efined type 'struct delay_timer'
>   tc_delay_timer.freq =3D divided_rate;
>                 ^
> drivers/clocksource/timer-atmel-tcb.c:477:2: error: implicit declaratio=
n of function 'register_current_timer_delay'; did you mean 'read_current_=
timer'? [-Werror=3Dimplicit-function-declaration]
>   register_current_timer_delay(&tc_delay_timer);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   read_current_timer
> drivers/clocksource/timer-atmel-tcb.c: At top level:
> drivers/clocksource/timer-atmel-tcb.c:129:27: error: storage size of 't=
c_delay_timer' isn't known
>  static struct delay_timer tc_delay_timer;
>                            ^~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   dd40f5020581 ("clocksource/drivers/tcb_clksrc: Register delay timer")=

>=20
> I have reverted that commit for today.
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--lhrNJrKFPsbnxvHxyPMMfXzt6lrMJuyEZ--

--NrJx8NTzwLwIiQQR8J2rTXucbgAU2hrW5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEGn3N4YVz0WNVyHskqDIjiipP6E8FAlz2CE0ACgkQqDIjiipP
6E9tgQgAo2dvX1ARK2lzEtylpEAmE8a+PEX7kSmXn0oApwkvIpPZUUEVr8BDiM0E
1Cg/ggAI+OWvTJSPzLeT3I6DJ3zPF6r9j0p2/Kx9q79sLErtu+xYGIS6M08kN+yk
YMlVwUPyCiCqwoEzDio7pWkSx9Bpuy8JQeUkR0/7Lk4pbDSEs3B5La8bVpKr2om8
AvRYU43k9Hshkd0jlkpSnG3MDEABcP+wM8R4AlKUhGu3dLJzDAqG+GapMiotNXmj
b1elfETgfYZb8KM00+ssBby07Rh19TIlHGm/LkvyGWuKUbIvZ3Ce7YLwLDkAPwJc
wIW/+/lKzjl9RTascpxq/HOn/WlZdA==
=hV81
-----END PGP SIGNATURE-----

--NrJx8NTzwLwIiQQR8J2rTXucbgAU2hrW5--
