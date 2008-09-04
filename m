From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for September 3
Date: Thu, 4 Sep 2008 14:57:44 +1000
Message-ID: <20080904145744.3f791ca7.sfr@canb.auug.org.au>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au>
	<20080903214634.ea17ff53.akpm@linux-foundation.org>
	<20080903215455.792c78a3.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Sep_2008_14_57_44_+1000_SXMWieTziobOvZ5w"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49023 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751165AbYIDE54 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Sep 2008 00:57:56 -0400
In-Reply-To: <20080903215455.792c78a3.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>

--Signature=_Thu__4_Sep_2008_14_57_44_+1000_SXMWieTziobOvZ5w
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 3 Sep 2008 21:54:55 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> On Wed, 3 Sep 2008 21:46:34 -0700 Andrew Morton <akpm@linux-foundation.or=
g> wrote:
>=20
> >  Apart from the lack of any
> > login prompt on the console (sshd works), but I suspect that was a
> > separate gift.
>=20
> And the very first damn bisection point goes:
>=20
> In file included from include/asm/statfs.h:11,
>                  from include/linux/statfs.h:6,
>                  from include/linux/vfs.h:4,
>                  from fs/open.c:22:
> include/asm-generic/statfs.h:20: error: expected '=3D', ',', ';', 'asm' o=
r '__attribute__' before '__u32'
>=20
> and that bisection breakage is going to get trotted into mainline
> for evermore.

No it isn't because it came from dwmw2's tree and that has already been
rewritten/rebased ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Sep_2008_14_57_44_+1000_SXMWieTziobOvZ5w
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki/asgACgkQjjKRsyhoI8zACgCgiZFCieVowmIdzt4DPrOnIjmr
5JYAnA6X26lSkPZJGh/hjaR6NG/bDNld
=PKIV
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Sep_2008_14_57_44_+1000_SXMWieTziobOvZ5w--
