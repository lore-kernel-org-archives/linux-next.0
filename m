From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build problem with nfs tree (Was: Re:
 [mmotm][PATCH] fix ia64 build error)
Date: Sat, 17 Jan 2009 09:49:03 +1100
Message-ID: <20090117094903.bc0c646d.sfr@canb.auug.org.au>
References: <20090115200315.EBE3.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20090115093514.f3f6b8ff.akpm@linux-foundation.org>
	<20090116124949.7828a559.sfr@canb.auug.org.au>
	<20090115175917.8e0ae536.akpm@linux-foundation.org>
	<20090116134930.68e783aa.sfr@canb.auug.org.au>
	<20090116153417.891297ca.sfr@canb.auug.org.au>
	<20090116141557.0a3eaaac.akpm@linux-foundation.org>
	<20090117094008.5a0ce562.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__17_Jan_2009_09_49_03_+1100_ijlhoFp_NJgNDsij"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48397 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753895AbZAPWtJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 17:49:09 -0500
In-Reply-To: <20090117094008.5a0ce562.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, prarit@redhat.com, dhowells@redhat.com, kosaki.motohiro@jp.fujitsu.com, linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org, sam@ravnborg.org, kyle@mcmartin.ca, tony.luck@intel.com, trond.myklebust@fys.uio.no

--Signature=_Sat__17_Jan_2009_09_49_03_+1100_ijlhoFp_NJgNDsij
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sat, 17 Jan 2009 09:40:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> > y:/usr/src/git26> who-committed.sh 2c3fb6b1b1a43ca089032e6523207f6687c9=
62c1
>=20
> And that is one I committed myself because Linus' tree is broken.

It also appears as commit d992c8403a72c4067587a32a7736bcc2af6c408f in the
mfd tree but has not made it into Linus' tree yet.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__17_Jan_2009_09_49_03_+1100_ijlhoFp_NJgNDsij
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklxDt8ACgkQjjKRsyhoI8xXqgCfcCHoLndb77ZH9yDTM71Z7IDh
6hoAoJ6H6uWGeBc1kMAXEdo80VUD/Lty
=gsda
-----END PGP SIGNATURE-----

--Signature=_Sat__17_Jan_2009_09_49_03_+1100_ijlhoFp_NJgNDsij--
