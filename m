From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: semaphore-removal build breakage
Date: Thu, 15 May 2008 03:05:10 +1000
Message-ID: <20080515030510.1874c7b3.sfr@canb.auug.org.au>
References: <20080428134609.9617eb8e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_03_05_10_+1000_R_KAy5Zf93NQXyh+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33053 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216AbYENRFV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 May 2008 13:05:21 -0400
In-Reply-To: <20080428134609.9617eb8e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__15_May_2008_03_05_10_+1000_R_KAy5Zf93NQXyh+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Mon, 28 Apr 2008 13:46:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) broke like this:
>=20
> In file included from net/9p/trans_virtio.c:34:
> include/linux/idr.h:60: error: syntax error before 'spinlock_t'
> include/linux/idr.h:60: warning: no semicolon at end of struct or union
> include/linux/idr.h:104: error: field 'idr' has incomplete type
>=20
> Caused by commit 2c77d192c68a95a188dd326db1315b3492487c41 ("9p: Convert
> from semaphore to spinlock") in the semaphore-removal tree.  The
> following patch fixes it but may well not be correct.

In fact, it would be also fixed (or hidden) if you put the includes back
in the order they were before that patch ....

It would be good for this to be fixed - its been there too long now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_03_05_10_+1000_R_KAy5Zf93NQXyh+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIKxvLTgG2atn1QN8RAteNAJ9eJWYeyNjczBE5iZsbVYYen2MUfQCcDHyc
cjW/azQGfG3TqNwJRYeKrqc=
=N2QX
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_03_05_10_+1000_R_KAy5Zf93NQXyh+--
