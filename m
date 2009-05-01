From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build warning
Date: Fri, 1 May 2009 13:15:45 +1000
Message-ID: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_May_2009_13_15_45_+1000_xfGknlX8p/Q5w3=y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59808 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753664AbZEADPu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 23:15:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@umich.edu>

--Signature=_Fri__1_May_2009_13_15_45_+1000_xfGknlX8p/Q5w3=y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/nfs/nfs4proc.c: In function 'nfs4_proc_exchange_id':
fs/nfs/nfs4proc.c:4279: warning: the frame size of 2288 bytes is larger tha=
n 2048 bytes

Introduced by commit 63a93b4af49220c74757beb17b5617b72d912b6b ("nfs41:
exchange_id operation").  This commit has been around for a while.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_May_2009_13_15_45_+1000_xfGknlX8p/Q5w3=y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn6aWEACgkQjjKRsyhoI8x4SQCgsyw7BeikmtBgk3E538rwvYpQ
TEQAoIaVKZlpMjN4COXGos1JXMTb6hUr
=qGc3
-----END PGP SIGNATURE-----

--Signature=_Fri__1_May_2009_13_15_45_+1000_xfGknlX8p/Q5w3=y--
