From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs build failure
Date: Wed, 18 Jun 2008 12:52:13 +1000
Message-ID: <20080618125213.30382b62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Jun_2008_12_52_13_+1000_kv89lXJFQWKx+8JS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35902 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756117AbYFRCw1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 22:52:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>

--Signature=_Wed__18_Jun_2008_12_52_13_+1000_kv89lXJFQWKx+8JS
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/built-in.o: In function `.nfs_parse_ip_address':
super.c:(.text+0xe2f08): undefined reference to `.__ipv6_addr_type'

Some CONFIG_IPV6 protections are needed ...

I reverted commit 09491a874d4f9a8676567bc58bce9dec9539740d ("NFS: handle
interface identifiers in incoming IPv6 addresses").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Jun_2008_12_52_13_+1000_kv89lXJFQWKx+8JS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhYeF0ACgkQTgG2atn1QN+acACgjLFaYKCpOEgl4qda4qw6jUW0
USIAoJhNuHPfezaKefhTj9hAv1Z3PMk7
=1SRz
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Jun_2008_12_52_13_+1000_kv89lXJFQWKx+8JS--
