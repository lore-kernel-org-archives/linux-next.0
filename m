From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: scsi tree build failure
Date: Wed, 17 Dec 2008 23:20:49 +1100
Message-ID: <20081217232049.67b72448.sfr@canb.auug.org.au>
References: <20081216013704.2496da40.sfr@canb.auug.org.au>
	<1229352762.3293.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Dec_2008_23_20_49_+1100_A_7bUF3kSXSfZAlW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41892 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750944AbYLQMU7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 07:20:59 -0500
In-Reply-To: <1229352762.3293.1.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Robert Love <robert.w.love@intel.com>

--Signature=_Wed__17_Dec_2008_23_20_49_+1100_A_7bUF3kSXSfZAlW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Mon, 15 Dec 2008 08:52:42 -0600 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Tue, 2008-12-16 at 01:37 +1100, Stephen Rothwell wrote:
> >=20
> > Today's linux-next build (powerpc allyesconfig) failed like this:
>=20
> Heh, I really need to get this terrasoft system integrated into my
> builds
>=20
> > drivers/scsi/libfc/fc_fcp.c: In function 'fc_eh_host_reset':
> > drivers/scsi/libfc/fc_fcp.c:1987: error: implicit declaration of functi=
on 'msleep'
> >=20
> > That file needs to include <linux/delay.h>.
>=20
> Thanks, that's exactly the problem.
>=20
> Robert, please reroll the patches with this fix in ... I'll just
> exchange the new patches for the ones in my tree.
>=20
> > Introduced by commit 389571f347629d879f9044582bbbafb43e4fe00b ("[SCSI]
> > libfc: A modular Fibre Channel library") from the scsi tree.  I reverted
> > that commit and commit 7aba33c5cfc7a9c104cc7469558c7849f373c3da ("[SCSI]
> > fcoe: Fibre Channel over Ethernet") which depended on it.

I have dropped the scsi tree until this is fixed up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Dec_2008_23_20_49_+1100_A_7bUF3kSXSfZAlW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklI7qEACgkQjjKRsyhoI8xobACgp1uTt4TYu/YGIDAsjnpjAn+j
R5wAoKwwWbfZLrXRvsxp1SUJ7tXSsEeP
=jE0W
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Dec_2008_23_20_49_+1100_A_7bUF3kSXSfZAlW--
