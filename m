From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build failure
Date: Thu, 12 Mar 2009 11:26:05 +1100
Message-ID: <20090312112605.d22546b6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Mar_2009_11_26_05_+1100_+vuH1IV8Lx5yWS=Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49627 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752674AbZCLA0P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 20:26:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Ian Dall <ian@beware.dropbear.id.au>

--Signature=_Thu__12_Mar_2009_11_26_05_+1100_+vuH1IV8Lx5yWS=Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/built-in.o: In function `.nfs_get_client':
client.c:(.text+0x115010): undefined reference to `.__ipv6_addr_type'

# CONFIG_IPV6 is not set

Probably caused by commit d7371c41b0cda782256b1df759df4e8d4724584c ("Bug
11061, NFS mounts dropped").

I have used the nfs tree from next-20090311 instead of today's.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__12_Mar_2009_11_26_05_+1100_+vuH1IV8Lx5yWS=Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm4Vp0ACgkQjjKRsyhoI8yr4QCgvQ9zTCTIqk+xWj/vKM1LI2hG
nJgAmwQJrDHmVB74Ufh0GnelcxVz9h0g
=+kgO
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Mar_2009_11_26_05_+1100_+vuH1IV8Lx5yWS=Y--
