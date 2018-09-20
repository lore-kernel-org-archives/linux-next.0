From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Sep 20
Date: Thu, 20 Sep 2018 21:17:55 +1000
Message-ID: <20180920211755.1fabd744@canb.auug.org.au>
References: <20180920151243.5524c6ca@canb.auug.org.au>
        <87d0t8jvym.fsf@concordia.ellerman.id.au>
        <20180920210711.4561abee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t4YctscrJcChV89uUiJm.9M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920210711.4561abee@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, robh@kernel.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/t4YctscrJcChV89uUiJm.9M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 20 Sep 2018 21:10:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 20 Sep 2018 20:37:37 +1000 Michael Ellerman <mpe@ellerman.id.au> =
wrote:
> >
> > Oodles of:
> >=20
> >   # < make -s -j 48 ARCH=3Darm64 O=3D/kisskb/build/linux-next_arm64-all=
noconfig_arm64 CROSS_COMPILE=3D/opt/cross/kisskb/br-aarch64-glibc-2016.08-6=
13-ge98b4dd/bin/aarch64-linux-  allnoconfig
> >   # make -s -j 48 ARCH=3Darm64 O=3D/kisskb/build/linux-next_arm64-allno=
config_arm64 CROSS_COMPILE=3D/opt/cross/kisskb/br-aarch64-glibc-2016.08-613=
-ge98b4dd/bin/aarch64-linux- =20
> >   /bin/sh: 1: pkg-config: not found
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        =20
> don't have it installed on my build machine either ...  do we have
> pkg-config installed in the build images?

Duh! ;-)

According to the commit message we gained a kconfig dependency on
pkg-config in 4.18.  I wonder what else depends on it.

Ah:

"pkg-config
----------

The build system, as of 4.18, requires pkg-config to check for installed
kconfig tools and to determine flags settings for use in
'make {g,x}config'.  Previously pkg-config was being used but not
verified or documented."

(from Documentation/process/changes.rst)
--=20
Cheers,
Stephen Rothwell

--Sig_/t4YctscrJcChV89uUiJm.9M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlujgeMACgkQAVBC80lX
0Gx2CAf/cJ0bt7I8hkCnLqIjschCrkFdf3Ik5nYOiE9027qSwJ2qTJ98WnUxYfNW
vqOObZ6swKIcSBaZB1SqmBcj8sR49ElZuWEm1/lzVX851Tr/yS78gbJ7arNrTbHt
ngcF/tirn5jKElFlz8Mbox19HojNClhdom8h5SAoMJLkRdZFd+YUOZ2K3fLBxNci
Ivr59zyr8FwBAI38ZtSRlrFUUhrskcdEyvSqajSUsojKh11MJz7u2wRTLcuyIyMs
JaxVXYGyHF1bvnFG9JixnSacS0ZzDzz7lYOLGKB4YuWICuhrps1MnUHv/2rNAXZ3
6UD7zVOoTqPKAUFk87GMcqEjra824Q==
=6ctV
-----END PGP SIGNATURE-----

--Sig_/t4YctscrJcChV89uUiJm.9M--
