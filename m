From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc/firmware build failure
Date: Tue, 28 Oct 2008 23:07:34 +1100
Message-ID: <20081028230734.7d2bba2f.sfr@canb.auug.org.au>
References: <20080901191019.5df57434.sfr@canb.auug.org.au>
	<20081028214559.c6715cc0.sfr@canb.auug.org.au>
	<1225194154.18031.185.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Oct_2008_23_07_34_+1100_RrmYxM1_/7+ckm/K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39300 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752716AbYJ1MHn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 08:07:43 -0400
In-Reply-To: <1225194154.18031.185.camel@macbook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, David Miller <davem@davemloft.net>

--Signature=_Tue__28_Oct_2008_23_07_34_+1100_RrmYxM1_/7+ckm/K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 28 Oct 2008 11:42:34 +0000 David Woodhouse <dwmw2@infradead.org> wr=
ote:
>
> On Tue, 2008-10-28 at 21:45 +1100, Stephen Rothwell wrote:
> > I have now been carrying this patch since September 1.  David (W), are
> > going to pick it up, please?  This should be put into the firmware tree
> > as part of the merge commit merging Linus' current tree.
>=20
> I'll merge it; thanks.

Thanks.

> > Incidentally, what is to be the fate of the rest of the firmware tree?
>=20
> We're planning to get the patches in for 2.6.29.=20

OK.

> I told Dave that I'd hold off on the network bits until the first round
> of patches had been shipped successfully -- so putting them into
> 2.6.28-rc within _days_ of the 2.6.27 release didn't seem to be the
> right thing to do.

Yeah.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Oct_2008_23_07_34_+1100_RrmYxM1_/7+ckm/K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkHAIYACgkQjjKRsyhoI8x34gCeNuw1Nj7bBE8z3J1MfB8ckVky
tcgAn1optekYeskYGlJQLxg7Xwr+u9i9
=SOWS
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Oct_2008_23_07_34_+1100_RrmYxM1_/7+ckm/K--
