From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 18:09:03 +1000
Message-ID: <20080512180903.c512397f.sfr@canb.auug.org.au>
References: <20080512154717.2d0947f0.sfr@canb.auug.org.au>
	<20080512.005454.31875425.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_18_09_03_+1000_=EYW6/nIbswt6Avr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34086 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753947AbYELIJK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 04:09:10 -0400
In-Reply-To: <20080512.005454.31875425.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: greg@kroah.com, linux-next@vger.kernel.org, kay.sievers@vrfy.org

--Signature=_Mon__12_May_2008_18_09_03_+1000_=EYW6/nIbswt6Avr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 12 May 2008 00:54:54 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> There is identical code in arch/powerpc/kernel/pci_64.c, it doesn't
> break the build there becuase powerpc doesn't use -Werror (yet) :-)

OK, I will look for your fix and copy it over, thanks.

> I'm getting a little tired of all of these breakages that occur when
> the core PCI probing under drivers/pci or related datastructures are
> modified but nobody even tests the build of powerpc or sparc's OF
> based PCI bus probing code.
>=20
> There have also been functional breakages due to core PCI changes
> because of this, an update goes into the drivers/pci/*.c code but
> doesn't get noticed for arch/{sparc64,powerpc}/'s PCI probing code
> until some poor arch maintainer or user tries to bootup on those
> platforms.

One of the reasons that we have linux-next, of course.  However, it would
be nice if Greg could find a couple of cross compilers for the major
architectures :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_18_09_03_+1000_=EYW6/nIbswt6Avr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIJ/skTgG2atn1QN8RArtdAJsEUeWk0tj1zcFxikcXQBduFr4lSQCgiJuX
RU9yLzBUNuVbf0/ejZtV8gM=
=gjEj
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_18_09_03_+1000_=EYW6/nIbswt6Avr--
