From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build warning
Date: Thu, 31 Dec 2009 11:01:32 +1100
Message-ID: <20091231110132.d96153fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__31_Dec_2009_11_01_32_+1100_clJNzRO8MOLXSqa4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33026 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751571AbZLaABi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2009 19:01:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

--Signature=_Thu__31_Dec_2009_11_01_32_+1100_clJNzRO8MOLXSqa4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (i386 defconfig) produced this warning:

net/sunrpc/auth_gss/auth_gss.c: In function 'gss_pipe_downcall':
net/sunrpc/auth_gss/auth_gss.c:660: warning: format '%ld' expects type 'lon=
g int', but argument 3 has type 'ssize_t

Introduced by commit 486bad2e40e938cd68fd853b7a9fa3115a9d3a4a ("sunrpc:
on successful gss error pipe write, don't return error").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__31_Dec_2009_11_01_32_+1100_clJNzRO8MOLXSqa4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAks76dwACgkQjjKRsyhoI8zk7gCfTE5bz9yM7xUc/+9ugDc7qXRl
zwwAniJy4+Co1g8+xo90dxlkgIr0Hnul
=b4lt
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Dec_2009_11_01_32_+1100_clJNzRO8MOLXSqa4--
