From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Sep 20
Date: Thu, 20 Sep 2018 21:10:08 +1000
Message-ID: <20180920210711.4561abee@canb.auug.org.au>
References: <20180920151243.5524c6ca@canb.auug.org.au>
        <87d0t8jvym.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fqB1TWcNoApRYmxO2qH.b0N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d0t8jvym.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, robh@kernel.org
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/fqB1TWcNoApRYmxO2qH.b0N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 20 Sep 2018 20:37:37 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Oodles of:
>=20
>   # < make -s -j 48 ARCH=3Darm64 O=3D/kisskb/build/linux-next_arm64-allno=
config_arm64 CROSS_COMPILE=3D/opt/cross/kisskb/br-aarch64-glibc-2016.08-613=
-ge98b4dd/bin/aarch64-linux-  allnoconfig
>   # make -s -j 48 ARCH=3Darm64 O=3D/kisskb/build/linux-next_arm64-allnoco=
nfig_arm64 CROSS_COMPILE=3D/opt/cross/kisskb/br-aarch64-glibc-2016.08-613-g=
e98b4dd/bin/aarch64-linux- =20
>   /bin/sh: 1: pkg-config: not found
>   make[3]: pkg-config: Command not found
>   /kisskb/src/scripts/dtc/yamltree.c:23:10: fatal error: yaml.h: No such =
file or directory
>    #include <yaml.h>
>             ^~~~~~~~
>   compilation terminated.
>   make[3]: *** [scripts/Makefile.host:107: scripts/dtc/yamltree.o] Error 1
>   make[3]: *** Waiting for unfinished jobs....
>   make[2]: *** [/kisskb/src/scripts/Makefile.build:536: scripts/dtc] Erro=
r 2
>   make[2]: *** Waiting for unfinished jobs....
>   make[1]: *** [/kisskb/src/Makefile:1067: scripts] Error 2
>   make: *** [Makefile:146: sub-make] Error 2
>=20
> http://kisskb.ellerman.id.au/kisskb/head/a0cb0cabe4bbeacf5ed9e81a41abcbae=
47ba925a/
>=20
>=20
> I guess we've got a yaml dependency now?

Yeah, but it is tested for and worked for my builds during the day (I
don't have it installed on my build machine either ...  do we have
pkg-config installed in the build images?

Anyway, it is (presuambly) caused by commit

  52786e7517a2 ("scripts/dtc: Update to upstream version v1.4.7-14-gc86da84=
d30e4")

from the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fqB1TWcNoApRYmxO2qH.b0N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlujgBAACgkQAVBC80lX
0Gw1qQf/e+2+cE7SAGP2TO0AitY5bEECuk7I8gjnytxwcD/+nRVoXrH8dU/wSS9l
iAdgsoi2uYefca4+h8IOgzgrIbhfRcBR6mFJ0jgzH0bSyXgoxQXYUquY/xhiznIe
0l2xXEoOF7I1YHWWssMLvAtmWqFIjiWn3gNBDP9eC6ULRUFl8wG+RErqfDGYlS4d
FlEp5N1vtQ2tmLboM45zToUocjsXxPhat8mprbThnSuLfGgQBHNefD5L5x/qA4sy
2TIxQwnA0AHqKjZFCE2pwdmVgLStJkppxKkhu7zLbjp5twYR4SMMbKHIxdDu4lGC
9A4VuClZI0atGcM44tCDlERo77omaw==
=brwp
-----END PGP SIGNATURE-----

--Sig_/fqB1TWcNoApRYmxO2qH.b0N--
