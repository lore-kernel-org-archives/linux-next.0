From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Wed, 28 Nov 2012 15:02:18 +1100
Message-ID: <20121128150218.5d30531231f7b24e3b398643@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__28_Nov_2012_15_02_18_+1100_/cOITW4Ruec.VRt+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rajagopal Venkat <rajagopal.venkat@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__28_Nov_2012_15_02_18_+1100_/cOITW4Ruec.VRt+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "devfreq_monitor_resume" [drivers/devfreq/governor_simpleondemand.ko=
] undefined!
ERROR: "devfreq_monitor_suspend" [drivers/devfreq/governor_simpleondemand.k=
o] undefined!
ERROR: "devfreq_interval_update" [drivers/devfreq/governor_simpleondemand.k=
o] undefined!
ERROR: "devfreq_monitor_stop" [drivers/devfreq/governor_simpleondemand.ko] =
undefined!
ERROR: "devfreq_monitor_start" [drivers/devfreq/governor_simpleondemand.ko]=
 undefined!

Caused by commit 206c30cfeb7c ("PM / devfreq: Add suspend and resume apis").

I have used the pm tree from next-20121127 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__28_Nov_2012_15_02_18_+1100_/cOITW4Ruec.VRt+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQtYzKAAoJEECxmPOUX5FEa0UP/jHJ/ocBhnxQaV2He5vLqBop
UGTa/icp5YyU0JrIdc5znpMVIoQT2WTjjdeig8lmS8jFLI6yXqVyhmi1o8lQ8JGw
jCOtHLj76KPGBIGyhdwjk5BCpNid2lDv+8WyqYgTHDFX0ZkBKeypyRgJg/eY8zxc
OuJC17DUUll+kupPehzt75tYTvII63cZKU7+EzLtI5ten5r1HlV2B6bg2djroJfC
ZhZPQ5pAw8yrisLb1c3zRi4z2Y+TX4TtdF2iTdMn0Wvy/RJO0p9pjZ4uLSbMz5RH
dmK7QX2zt02S3yqecECku32bb7Gc7jNeJ3sCOVY0rBUq0SPxadhZ3ARS//eGEVNB
g0D34OvtmenLmHeDPAez0NMqtspcSboMtJhpeDYnDtoh6GQHevMMMB/Q8ZVnv7l6
/W5EbBbqATLJQizWr3t2sfu0/AlJ0sZniOA2A9SBCpsW0ZRduPgH1rKW4dE9z3I8
rTdLLZi0a1ZRebLcGehZjU26+5XpodGXg1IrIEQ5bnmCOMKbUkefTJWIMVU4tzVt
lWaMKaMJhhH1ZzEO7rAEcrFxXKOsqc3gLCbzYq+K2TquO0hFFmmYZ4XcBisxLb6p
gyuRY87EIFBK4KjnnptKvaV0AaaeeIA5G8tVZWVAKgRHV68KJuYyzcwZ2hboHI4k
JlZMkfXs53GIXbNXGu0K
=NxRG
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Nov_2012_15_02_18_+1100_/cOITW4Ruec.VRt+--
