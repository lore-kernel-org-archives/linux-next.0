From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sparc64 build failure
Date: Fri, 30 May 2008 15:38:47 +1000
Message-ID: <20080530153847.a5f3fd35.sfr@canb.auug.org.au>
References: <20080529175332.a12ad65d.sfr@canb.auug.org.au>
	<20080529220158.GA3867@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_May_2008_15_38_47_+1000_WpB3tvd/zC4tzv0y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55057 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758944AbYE3Fi4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 May 2008 01:38:56 -0400
In-Reply-To: <20080529220158.GA3867@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Fri__30_May_2008_15_38_47_+1000_WpB3tvd/zC4tzv0y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 29 May 2008 15:01:58 -0700 Greg KH <greg@kroah.com> wrote:
>
> > -	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> > +	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> >  		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
>=20
> It's wierd that we broke the build like this, I'll work to merge this in
> so that it isn't broken.

It broke the build because arch/sparc64 is (mostly) built with -Werror.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_May_2008_15_38_47_+1000_WpB3tvd/zC4tzv0y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIP5LrTgG2atn1QN8RAgpvAJwI1LoqfHU/UWzXfB7mLvjZQ+CijwCfXX+8
cdpsZTvqqBFfZdQM46EhBe8=
=RQJm
-----END PGP SIGNATURE-----

--Signature=_Fri__30_May_2008_15_38_47_+1000_WpB3tvd/zC4tzv0y--
