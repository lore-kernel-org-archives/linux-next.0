From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: driver-core/pci merge failure
Date: Tue, 20 May 2008 15:31:23 +1000
Message-ID: <20080520153123.3e55528c.sfr@canb.auug.org.au>
References: <20080519120328.40aa6d5d.sfr@canb.auug.org.au>
	<200805191625.02966.rjw@sisk.pl>
	<20080519152243.GB7620@kroah.com>
	<200805200039.59938.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__20_May_2008_15_31_23_+1000_AaCS_8DY0J2zM1ED"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47433 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753519AbYETFbc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 May 2008 01:31:32 -0400
In-Reply-To: <200805200039.59938.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Greg KH <greg@kroah.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, Shaohua Li <shaohua.li@intel.com>

--Signature=_Tue__20_May_2008_15_31_23_+1000_AaCS_8DY0J2zM1ED
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael, Greg,

On Tue, 20 May 2008 00:39:59 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
>
> On Monday, 19 of May 2008, Greg KH wrote:
> > On Mon, May 19, 2008 at 04:25:02PM +0200, Rafael J. Wysocki wrote:
> >=20
> > > Please revert "PM: New suspend and hibernation callbacks for PCI bus =
type"
> > > until we fix that up.
> >=20
> > Do you want me to drop this from my tree?
>=20
> Yes, please.  I'll send the updated patch to Jesse, if he doesn't object,=
 as I
> said in the other thread.

I have reverted that patch in linux-next today.  Let me know when things
change.

(I reverted in the import of the quilt tree, so it appears in
quilt-import.log not merge.log.)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__20_May_2008_15_31_23_+1000_AaCS_8DY0J2zM1ED
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMmIvTgG2atn1QN8RAgE9AJsGSlHf1lcZTNmuosc2VvUXxjjHgQCdEpwA
zz4D6oe3Zor1ks3csW3/WYU=
=l6j9
-----END PGP SIGNATURE-----

--Signature=_Tue__20_May_2008_15_31_23_+1000_AaCS_8DY0J2zM1ED--
