From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: semaphore-removal build breakage
Date: Thu, 15 May 2008 14:23:42 +1000
Message-ID: <20080515142342.46426d33.sfr@canb.auug.org.au>
References: <20080428134609.9617eb8e.sfr@canb.auug.org.au>
	<20080515030510.1874c7b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_14_23_42_+1000_jj8s_tUk2Lwie+Kc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60996 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750987AbYEOEXy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 00:23:54 -0400
In-Reply-To: <20080515030510.1874c7b3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__15_May_2008_14_23_42_+1000_jj8s_tUk2Lwie+Kc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Thu, 15 May 2008 03:05:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In fact, it would be also fixed (or hidden) if you put the includes back
> in the order they were before that patch ....
>=20
> It would be good for this to be fixed - its been there too long now.

So, for now, I have reverted commit
2c77d192c68a95a188dd326db1315b3492487c41 ("9p: Convert from semaphore to
spinlock") instead of applying the patch that added apinlock.h to idr.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_14_23_42_+1000_jj8s_tUk2Lwie+Kc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIK7rTTgG2atn1QN8RAnN9AKCBwJ3XcOhLgi8vmOldaJbYgoJSCACfS8ez
Q/d0kNbnHUkX+PS/Xnm+zOU=
=YxRC
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_14_23_42_+1000_jj8s_tUk2Lwie+Kc--
