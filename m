From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 15:25:38 +1000
Message-ID: <20150520152538.15e7a1cc@canb.auug.org.au>
References: <20150520130828.4fdacf54@canb.auug.org.au>
	<alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NbWYnLSv1vL8pR4ZnaYm8KP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NbWYnLSv1vL8pR4ZnaYm8KP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 20 May 2015 05:41:46 +0100 (IST) Dave Airlie <airlied@linux.ie> wro=
te:
>
> > After merging the drm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'cre=
ate_queue_cpsch':
> > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:888:2: error: imp=
licit declaration of function 'init_sdma_vm' [-Werror=3Dimplicit-function-d=
eclaration]
> >   init_sdma_vm(dqm, q, qpd);
> >   ^
> >=20
> > Caused by commit 3e3f6e1a90a8 ("drm/amdkfd: make the sdma vm init to be
> > asic specific").
> >=20
> > I have used the drm tree from next-20150519 for today.
>=20
> Okay this looks like a silent conflict, I'll have to pull Linus tree into
> drm-next and fix it up there.

Yep, against commit 79b066bd76d5 ("drm/amdkfd: Initialize sdma vm when
creating sdma queue") which is in v4.1-rc3.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/NbWYnLSv1vL8pR4ZnaYm8KP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXBrXAAoJEMDTa8Ir7ZwVfX8P/i1vyrIDgj3dJy0sjv+DMHgH
DhF5MR7pPsQSWUlaQf8WSd3gHrpuqIU3q+O90Y+ZowKYKNn7/s/TPRut2H1nr6gT
0ghKE0iS1OcBF4WfMrt+O4erYghGo5uxuAriNX/AXAGvgd4xN1uPS+OQYzORQMhm
lxwUOeNBdLwJyBzcR3a5uS5zdYl/R1gyF5mw4aBlAH4oa8iDovENrG6s2Mj9ruOq
MfaiiGfNAT5P0yZQpwz/nssFf/8SATKtfvwOCKnMUDrM9zNDMR46bTIkg1SBQVLT
j+U9mL9wwdwUeyibx2sucbdDYx/oL8ISbmhw0FHNHxI3/92aSzH1/Y+K0wteqwor
qFfNJQVTPMFp3FzLFh8A82I+UcIS7KvMtE9PlM6SCAZ5/I6uHBIpsNrlQlF7ERhn
AOzATEGRQIvsC0HJEeVY/UmhNxVlNfjqX+mRIdFntpbUJxFvd7s/9UCI19DzBnrs
2Gduq+joLMxM1ywek1hpVrb4rzGeLVdfBvq3Atj/aAvS1FPyPS+hPnAgX7HJdWxQ
XwIJyG/Q3F3zYg3IA1Hz0lgwoXa+ad0+9spus9i/OTlU7dmAEuMNUv3tWrkkWmwf
j145UmmQHhtCWRDUMxi1BBbMzAgiW+ESPRCYHYAW2zSYERXGsoQkJmO4wZ/sV7mU
rNfND1ABFckxkQLn3ziI
=vwOr
-----END PGP SIGNATURE-----

--Sig_/NbWYnLSv1vL8pR4ZnaYm8KP--
