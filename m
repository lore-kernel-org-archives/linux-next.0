From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree
Date: Wed, 16 Jul 2008 17:13:36 +1000
Message-ID: <20080716171336.1a470f75.sfr@canb.auug.org.au>
References: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
	<1216191977.3394.5.camel@jaswinder.satnam>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_13_36_+1000_.fGe+lERSDB.ajRV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43271 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752259AbYGPHNm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:13:42 -0400
In-Reply-To: <1216191977.3394.5.camel@jaswinder.satnam>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Wed__16_Jul_2008_17_13_36_+1000_.fGe+lERSDB.ajRV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jaswinder,

On Wed, 16 Jul 2008 12:36:17 +0530 Jaswinder Singh <jaswinder@infradead.org=
> wrote:
>
> On Wed, 2008-07-16 at 12:02 +1000, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the usb tree got a conflict in
> > drivers/usb/serial/io_ti.c between commit
> > d12b219a228efe92f0778ed3af21305e65fbb052 ("edgeport-ti: use
> > request_firmware()") from Linus' tree and commit
> > 1f023570c8d00d3511799ccad21dc3525a6160e1 ("USB: io_ti: FIrst cut at a b=
ig
> > clean up") from the usb tree.
> >=20
> > This conflict used to be in the firmware tree and my solution then was =
to
> > remove the commit now in Linus' tree because the fixup was going to take
> > to long.  Now my solution is to remove the commit from the usb tree.
>=20
> I am checking linux-next tree :
> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

That is yesterday's linux-next tree, you will need to wait a few hours
before today's tree is available.  Since yesterday, the firmware tree
(include your patch) has been merged into Linus' tree and today's
linux-next is based on that newer version of Linus' tree.

> So I am going to check alan patch manually.
> And after confirmation that alan patch is fully installed then I will
> install firmware patch and send to all of you.

What needs to happen is that Alan's patch needs to be redone based on
Linus' tree of today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_13_36_+1000_.fGe+lERSDB.ajRV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9n6AACgkQjjKRsyhoI8wGnACfbpVVjZXD6/J7mqtQ+nKEdoy1
DQkAoK368L5C6FFLbNcn6VV0eTNsInvV
=Njws
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_13_36_+1000_.fGe+lERSDB.ajRV--
