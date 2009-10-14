From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 14 Oct 2009 15:34:50 +1100
Message-ID: <20091014153450.3110e34c.sfr@canb.auug.org.au>
References: <20091014152000.15312908.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Oct_2009_15_34_50_+1100_qD_BqPXM5SSBP9k8"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751791AbZJNEfh@vger.kernel.org>
In-Reply-To: <20091014152000.15312908.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__14_Oct_2009_15_34_50_+1100_qD_BqPXM5SSBP9k8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 14 Oct 2009 15:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc44x_defconfig) produced these
> warnings:
>=20
> In file included from net/socket.c:94:
> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside=
 parameter list
> include/net/compat.h:45: warning: its scope is only this definition or de=
claration, which is probably not what you want
> In file included from net/core/scm.c:36:
> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside=
 parameter list
> include/net/compat.h:45: warning: its scope is only this definition or de=
claration, which is probably not what you want
> In file included from net/ipv4/ip_sockglue.c:37:
> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside=
 parameter list
> include/net/compat.h:45: warning: its scope is only this definition or de=
claration, which is probably not what you want
> In file included from net/ipv6/ipv6_sockglue.c:53:
> include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside=
 parameter list
> include/net/compat.h:45: warning: its scope is only this definition or de=
claration, which is probably not what you want
>=20
> CONFIG_COMPAT is not set.
>=20
> Caused by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
> Introduce recvmmsg socket syscall").

I also get these for i386 and sparc32 defconfig builds.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Oct_2009_15_34_50_+1100_qD_BqPXM5SSBP9k8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrVVOoACgkQjjKRsyhoI8zJZwCgo8rTBijcTHA/OsvPrnalcL+F
vyUAoIc3lZTKth1pjYoeofLqgtY5GZca
=etJO
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Oct_2009_15_34_50_+1100_qD_BqPXM5SSBP9k8--
