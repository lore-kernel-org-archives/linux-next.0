From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree
Date: Wed, 16 Jul 2008 17:45:25 +1000
Message-ID: <20080716174525.310fb332.sfr@canb.auug.org.au>
References: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
	<1216191977.3394.5.camel@jaswinder.satnam>
	<20080716171336.1a470f75.sfr@canb.auug.org.au>
	<1216192808.3394.12.camel@jaswinder.satnam>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_45_25_+1000_0BOYWuUtRhzLSOt."
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35729 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752539AbYGPHpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:45:31 -0400
In-Reply-To: <1216192808.3394.12.camel@jaswinder.satnam>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Wed__16_Jul_2008_17_45_25_+1000_0BOYWuUtRhzLSOt.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jaswinder,

On Wed, 16 Jul 2008 12:50:08 +0530 Jaswinder Singh <jaswinder@infradead.org=
> wrote:
>
> On Wed, 2008-07-16 at 17:13 +1000, Stephen Rothwell wrote:
>=20
> > What needs to happen is that Alan's patch needs to be redone based on
> > Linus' tree of today.
> >=20
>=20
> My patch is smaller and simpler as compare to Alan patch.

However, your patch is already in Linus' tree and Greg's problem is
getting his tree (which contains Alan's patch) into Linus' tree.

> So can we follow this approach for linux-next tree:-
>=20
> 1. Remove my patch from Linus tree
> 2. Apply Alan patch first
> 3. Then I will give you firmware patch based upon yesterday tree which I
> installed here :-
> http://git.infradead.org/users/jaswinder/linux-next.git
> 4. Then you apply firmware patch

This is a lot more work for me (and I have limited time) and Alan's patch
still needs to be redone before it is merged into Linus' tree ...

The linus-next tree is not and end unto itself, it is merely a way to see
how things will end up in Linus' tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_45_25_+1000_0BOYWuUtRhzLSOt.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9pxUACgkQjjKRsyhoI8zTSACeO/NKEE/+fE0GOEsnPtvWusbb
iNAAnjZYOMsm6Cb7YNXXg8vG1rL8tgTd
=qi5F
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_45_25_+1000_0BOYWuUtRhzLSOt.--
