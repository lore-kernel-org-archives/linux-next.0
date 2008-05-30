From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci/driver-core merge conflicts
Date: Fri, 30 May 2008 10:55:09 +1000
Message-ID: <20080530105509.34faa639.sfr@canb.auug.org.au>
References: <20080529121847.fcc81e2f.sfr@canb.auug.org.au>
	<20080529025957.GA13909@kroah.com>
	<200805290857.16581.jbarnes@virtuousgeek.org>
	<20080529160221.GA9876@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_May_2008_10_55_09_+1000_FgsqEVd.xwr9j+0B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36287 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752468AbYE3Az1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 20:55:27 -0400
In-Reply-To: <20080529160221.GA9876@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Fri__30_May_2008_10_55_09_+1000_FgsqEVd.xwr9j+0B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 29 May 2008 09:02:21 -0700 Greg KH <greg@kroah.com> wrote:
>
> On Thu, May 29, 2008 at 08:57:16AM -0700, Jesse Barnes wrote:
> >=20
> > Hm, I knew this would cause problems eventually. :)  Should I put these=
 fixups=20
> > in my tree?  Or can you track them somehow, Stephen?
>=20
> Yes, I'll be breaking them up and sending them to you in a few days so
> Stephen doesn't have to handle all of this.  Right now it's in a single
> patch file that touches about 400+ files :)

Of course, it is even better when I don't have to track them at all :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_May_2008_10_55_09_+1000_FgsqEVd.xwr9j+0B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIP1BxTgG2atn1QN8RAkU8AKCJao7XRONCcfmKdFyIavWoyhbDPACfcRE/
fp/1xz8xdgRgXkfrLIQB1fI=
=DVha
-----END PGP SIGNATURE-----

--Signature=_Fri__30_May_2008_10_55_09_+1000_FgsqEVd.xwr9j+0B--
