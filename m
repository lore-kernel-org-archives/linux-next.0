From: "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Fri, 8 Sep 2017 08:53:54 +0300
Message-ID: <20170908055353.GA8820@altlinux.org>
References: <20170908092545.15179b18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170908092545.15179b18@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 08, 2017 at 09:25:45AM +1000, Stephen Rothwell wrote:
> Hi Al,
>=20
> After merging the vfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> kernel/signal.c: In function 'C_SYSC_rt_sigaction':
> kernel/signal.c:3405:19: warning: unused variable 'mask' [-Wunused-variab=
le]
>    compat_sigset_t mask;
>                    ^
>=20
> Introduced by commit
>=20
>   fc271087ebcb ("signal: replace sigset_to_compat() with put_compat_sigse=
t()")

Thanks.  The commit that made this variable unused is
  9b24ec57688a ("get_compat_sigset()")


--=20
ldv

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZsjBxAAoJEAVFT+BVnCUIlcsP/R4RC8IIdvLCWp+yvL9QkeNl
lUfAe71QUVEceRZqqv1sYoRak9ht6mZxZnEmgQw2o/Ys+xwx2FyLWqteWvhPvAzB
h8K3zTzNibxkEnNnRZQPPGbVisuQdJ97Il98YDpIyP7bsg6Jr+8Sfc2MDR3qVVSP
de08yiGZQ7S8Lt2jCEHsDIqeg+2vqz7JNhEML04daCaNs9OEVyWksgc7K5CU9lU7
oeO4vJD23Z0EsuDWiS2bBpZ9vr/Pc91oNj/Kd+TdBex6D6DJ1lJAQAtlQgl/2mUV
Fq4ksVuEP8JCM8uKwmm++3iLU67Ls8YudlrcYkHaOTL2vTfatO6ELXa5Awqp23qj
JQ1Cb2hPi54YB0rw34JcLxmTGfSzBp3vrL47fmvb+gIFzTGFDYvm5SPJ3wqN+XR+
6ZQn8Tm0rc+/HfnEjDJQd9aAYGVyTcV0ja4bCR5Rt74qyP/y21vsMeoEzOxDLplt
WIy94uTmTUH7Do6aHU78iJmoS32qnfABnE/V68NMRn6CSP/hORpoRogxVQBrr1mC
d/A57ogl81lmhZ1ZtJqRK0Pkbf1NB4JzfO6zdz0EOCU9VdzaYwdYbZJOudMLz3oZ
MaNKbn4aAgSN0b9wGaPInyk0MnYelSyoDpGm+m/Gw2h7awV0rCgKULHMLtWd9/jK
7mZt1lKjkhT1iI2CKRCB
=tDdm
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
