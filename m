From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb/sparc build failure
Date: Wed, 28 May 2008 09:25:47 +1000
Message-ID: <20080528092547.4c9d8434.sfr@canb.auug.org.au>
References: <20080527202630.6352736d.sfr@canb.auug.org.au>
	<483C47D3.2090705@csr.com>
	<20080527180236.GA23505@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_May_2008_09_25_47_+1000_ZDr.etIIUb_Vowrq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38504 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753011AbYE0X0P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 19:26:15 -0400
In-Reply-To: <20080527180236.GA23505@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Vrabel <david.vrabel@csr.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__28_May_2008_09_25_47_+1000_ZDr.etIIUb_Vowrq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 27 May 2008 11:02:36 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Tue, May 27, 2008 at 06:41:39PM +0100, David Vrabel wrote:
> >=20
> > How odd.  Looking at my local patch set this has been fixed but looking
> > at the patches Greg has and I see it's not.  Try this.
> >=20
> > I also note that some architectures (sparc amongst them) will BUG with
> > these drivers as the DMA API is only available to PCI devices. The
> > whc-rc and whci-hcd drivers use umc devices which are children of a PCI
> > device.
>=20
> Thanks, I've now merged this in with my patch series.

Thanks guys.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_May_2008_09_25_47_+1000_ZDr.etIIUb_Vowrq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPJiDTgG2atn1QN8RAozKAJ4jcHJzQTcxeBforMuawO4OSCbKOgCfbacV
J7MyznFxJtRpYmLsIgYzI64=
=aaXN
-----END PGP SIGNATURE-----

--Signature=_Wed__28_May_2008_09_25_47_+1000_ZDr.etIIUb_Vowrq--
