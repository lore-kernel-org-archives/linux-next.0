From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for March 16 (slob)
Date: Tue, 17 Mar 2009 11:11:29 +1100
Message-ID: <20090317111129.5bf04ae6.sfr@canb.auug.org.au>
References: <20090316220609.6f4a884c.sfr@canb.auug.org.au>
	<49BE9B20.70808@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_11_11_29_+1100_pPABkS/1CCQn=M.y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45666 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752924AbZCQALl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 20:11:41 -0400
In-Reply-To: <49BE9B20.70808@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Nick Piggin <npiggin@suse.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>

--Signature=_Tue__17_Mar_2009_11_11_29_+1100_pPABkS/1CCQn=M.y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Mar 2009 11:32:00 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> mm/slob.c:480: error: 'flags' undeclared (first use in this function)
>=20
> pseudo-patch:
>=20
> s/flags/gfp/

Caused by commit cf40bd16fdad42c053040bcd3988f5fdedbb6c57 ("lockdep:
annotate reclaim context (__GFP_NOFS)") from the tracing tree.

Now fixed in the tip tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_11_11_29_+1100_pPABkS/1CCQn=M.y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm+6rEACgkQjjKRsyhoI8yWWwCfRhvZnB8r0JPaSNZ5pzpiWyrS
mlIAn3biMAKg0hGicFTaPUUwHW4bWrS1
=zW46
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_11_11_29_+1100_pPABkS/1CCQn=M.y--
