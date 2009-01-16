From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tree build failure
Date: Fri, 16 Jan 2009 21:39:45 +1100
Message-ID: <20090116213945.59b9b67f.sfr@canb.auug.org.au>
References: <20090116163745.93f4e075.sfr@canb.auug.org.au>
	<1232090749.8870.85.camel@laptop>
	<20090116090355.GA4305@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_Jan_2009_21_39_45_+1100_k5UhYmGEfrxxg97a"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59032 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754875AbZAPKj4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Jan 2009 05:39:56 -0500
In-Reply-To: <20090116090355.GA4305@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Fri__16_Jan_2009_21_39_45_+1100_k5UhYmGEfrxxg97a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Jan 2009 10:03:55 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> > That smells like a bad merge somewhere, I just checked -tip and it look=
s=20
> > like so:
>=20
> yep. I zapped the auto-sched-next branch for now.

Glad to be of service.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Jan_2009_21_39_45_+1100_k5UhYmGEfrxxg97a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklwY/EACgkQjjKRsyhoI8xsOACgswSCpuZ7UPuNefiTUOfoBrbB
o7wAnArG8k5U2DCKh78YdxQsKcPw3AoG
=r3xE
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Jan_2009_21_39_45_+1100_k5UhYmGEfrxxg97a--
