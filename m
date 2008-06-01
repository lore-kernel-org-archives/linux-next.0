From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: m68k/semaphore build failure
Date: Sun, 1 Jun 2008 12:18:04 +1000
Message-ID: <20080601121804.bd9c4c53.sfr@canb.auug.org.au>
References: <20080527201038.d70e23d6.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0805271809520.4081@anakin>
	<20080528160406.4fceb036.sfr@canb.auug.org.au>
	<20080531172059.GF28074@parisc-linux.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__1_Jun_2008_12_18_04_+1000_x9epvOCi33vaFHcE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57269 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755288AbYFACSN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 31 May 2008 22:18:13 -0400
In-Reply-To: <20080531172059.GF28074@parisc-linux.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-next@vger.kernel.org

--Signature=_Sun__1_Jun_2008_12_18_04_+1000_x9epvOCi33vaFHcE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Sat, 31 May 2008 11:20:59 -0600 Matthew Wilcox <matthew@wil.cx> wrote:
>
> On Wed, May 28, 2008 at 04:04:06PM +1000, Stephen Rothwell wrote:
> > > I'd swear I reported this to Willy the first time it appeared, but ac=
cording
> > > to my mail logs, I never did...
>=20
> You did ... I was just slack.
>=20
> > I have added the following patch to linux-next for today, but I am
> > assuming the Willy will fix his semaphore tree shortly.
>=20
> Fixed now.  Thanks!

Great, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__1_Jun_2008_12_18_04_+1000_x9epvOCi33vaFHcE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIQgbiTgG2atn1QN8RAqohAJ4pWXs8NFnpfV6ohjmvwftlxY+hcQCghUK8
UZBG6JPQzsOUDQqUB1NHzLU=
=EIv8
-----END PGP SIGNATURE-----

--Signature=_Sun__1_Jun_2008_12_18_04_+1000_x9epvOCi33vaFHcE--
