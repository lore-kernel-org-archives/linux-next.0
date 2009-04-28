From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Tue, 28 Apr 2009 14:42:56 +1000
Message-ID: <20090428144256.f7870238.sfr@canb.auug.org.au>
References: <20090422133821.804bf9d6.sfr@canb.auug.org.au>
	<Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org>
	<20090422173009.4b6e684e@lxorguk.ukuu.org.uk>
	<20090422163857.GA19484@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_14_42_56_+1000_tI.1/QZX.p3C8_SM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46132 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750971AbZD1EnL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 00:43:11 -0400
In-Reply-To: <20090422163857.GA19484@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Alan Stern <stern@rowland.harvard.edu>, linux-next@vger.kernel.org

--Signature=_Tue__28_Apr_2009_14_42_56_+1000_tI.1/QZX.p3C8_SM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 22 Apr 2009 09:38:57 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Wed, Apr 22, 2009 at 05:30:09PM +0100, Alan Cox wrote:
> > > I'll be happy to help, although no doubt Alan Cox is quite capable of=
=20
> > > resolving the conflicts on his own.
> >=20
> > Greg - can you send me the diff you applied in the end, then we can move
> > the patch from the USB tree into the tty tree otherwise its not going to
> > be possible to keep the two trees based on Linus base otherwise. Better
> > yet forcefeed it to Linus instead as its quite a icky bug and wants fix=
ing
> > ASAP IMHO.
>=20
> Ok, I'll send it to Linus today, and we can handle the merge after that.

Any ETA?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_14_42_56_+1000_tI.1/QZX.p3C8_SM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2iVAACgkQjjKRsyhoI8ysZQCfZiJ4fxc6B4DYzHV2pTi15iqF
njUAoJ7AFPeF0OUh4Wr6ULYRSNJplJ8H
=9USL
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_14_42_56_+1000_tI.1/QZX.p3C8_SM--
