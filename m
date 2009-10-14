From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build warnings
Date: Wed, 14 Oct 2009 15:20:00 +1100
Message-ID: <20091014152000.15312908.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__14_Oct_2009_15_20_00_+1100_KonpCOOA996HHN6Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51465 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750765AbZJNEUo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2009 00:20:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

--Signature=_Wed__14_Oct_2009_15_20_00_+1100_KonpCOOA996HHN6Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (powerpc ppc44x_defconfig) produced these
warnings:

In file included from net/socket.c:94:
include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside p=
arameter list
include/net/compat.h:45: warning: its scope is only this definition or decl=
aration, which is probably not what you want
In file included from net/core/scm.c:36:
include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside p=
arameter list
include/net/compat.h:45: warning: its scope is only this definition or decl=
aration, which is probably not what you want
In file included from net/ipv4/ip_sockglue.c:37:
include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside p=
arameter list
include/net/compat.h:45: warning: its scope is only this definition or decl=
aration, which is probably not what you want
In file included from net/ipv6/ipv6_sockglue.c:53:
include/net/compat.h:45: warning: 'struct compat_mmsghdr' declared inside p=
arameter list
include/net/compat.h:45: warning: its scope is only this definition or decl=
aration, which is probably not what you want

CONFIG_COMPAT is not set.

Caused by commit a2e2725541fad72416326798c2d7fa4dafb7d337 ("net:
Introduce recvmmsg socket syscall").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__14_Oct_2009_15_20_00_+1100_KonpCOOA996HHN6Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrVUXAACgkQjjKRsyhoI8yLAACfTxhMS1cfJWwFvR0t3AiL0fae
64YAn0quNkFMDkp8lnFoYIuZUJvODx8h
=S7QU
-----END PGP SIGNATURE-----

--Signature=_Wed__14_Oct_2009_15_20_00_+1100_KonpCOOA996HHN6Q--
