From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc/firmware build failure
Date: Wed, 5 Nov 2008 17:02:56 +1100
Message-ID: <20081105170256.5fef7e93.sfr@canb.auug.org.au>
References: <20080901191019.5df57434.sfr@canb.auug.org.au>
	<20081028214559.c6715cc0.sfr@canb.auug.org.au>
	<1225194154.18031.185.camel@macbook.infradead.org>
	<20081103145542.498447c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_17_02_56_+1100_PW0Alp68l.87poPf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbYKEGDI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 01:03:08 -0500
In-Reply-To: <20081103145542.498447c6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>, David Miller <davem@davemloft.net>

--Signature=_Wed__5_Nov_2008_17_02_56_+1100_PW0Alp68l.87poPf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 3 Nov 2008 14:55:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 28 Oct 2008 11:42:34 +0000 David Woodhouse <dwmw2@infradead.org> =
wrote:
> >
> > On Tue, 2008-10-28 at 21:45 +1100, Stephen Rothwell wrote:
> > > I have now been carrying this patch since September 1.  David (W), are
> > > going to pick it up, please?  This should be put into the firmware tr=
ee
> > > as part of the merge commit merging Linus' current tree.
> >=20
> > I'll merge it; thanks.
>=20
> Still pending ...

I have reverted commit 229d9a03273684dc2175821be4104dbaa52f3ce0
("qlogicpti: use request_firmware") because the above build fix has not
been applied.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_17_02_56_+1100_PW0Alp68l.87poPf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRNxAACgkQjjKRsyhoI8yggACfUh53u33I4jZRThMJ4calRVfG
aE8AoKtWhFeybJKy/6cePaiQRtb1VFSe
=7H0C
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_17_02_56_+1100_PW0Alp68l.87poPf--
