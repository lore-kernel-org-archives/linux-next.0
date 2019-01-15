From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mali-dp tree
Date: Tue, 15 Jan 2019 21:47:25 +1100
Message-ID: <20190115214725.360798cf@canb.auug.org.au>
References: <20190115104619.516be4b9@canb.auug.org.au>
        <20190115101219.GP20661@e110455-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T7_6cW1XqiCljKlGz2FxoNA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115101219.GP20661@e110455-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/T7_6cW1XqiCljKlGz2FxoNA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Liviu,

On Tue, 15 Jan 2019 10:12:19 +0000 Liviu Dudau <Liviu.Dudau@arm.com> wrote:
>
> That looks like the right fix, thank you for that!

Thanks for your verification.

> I will roll your patch into my tree.

You can only do that when your tree is merged with the drm tree (and
it should be part of the merge resolution).

--=20
Cheers,
Stephen Rothwell

--Sig_/T7_6cW1XqiCljKlGz2FxoNA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw9uj0ACgkQAVBC80lX
0GyXXQgApL2KNh9KEe1FdPnWvHaZyEaW4r/Q6zvws49vD7KpY/I0I6tq8iOvZPnZ
O21GbwYda0Tf6EN/XqZs1AbdtClDCfMkKajd0YbF7OJj2HIhR0yigHlkYDlLZlaB
fO60kKP9E+1dVp9ZLfz6IOv0OiTKjYeTqYY5XRdZbtNbj/qqSbQyvnVfhzgoBRKR
V4xT2hGoQsAJciQKxDZ9O1dU0ZoRYIPl5l7O6829DC7Fn8QqXKJnI6deoMe853iz
T7XLBvCMkSS6JrKwIpRV3G6rliUvSssSd3Q0E6cabSVxO7AQIDNq8/s2V1rTGjCJ
/7os4Ldp0+gzptonHR19FO0tnel2QQ==
=wIrb
-----END PGP SIGNATURE-----

--Sig_/T7_6cW1XqiCljKlGz2FxoNA--
