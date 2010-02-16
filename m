From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Tue, 16 Feb 2010 11:38:14 +1100
Message-ID: <20100216113814.1b07698d.sfr@canb.auug.org.au>
References: <20100210123337.7a715aa0.sfr@canb.auug.org.au>
	<1265840176.2769.576.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Feb_2010_11_38_14_+1100_kGyWayk1Uzuxw=FR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35174 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932299Ab0BPAiU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2010 19:38:20 -0500
In-Reply-To: <1265840176.2769.576.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Smart <james.smart@emulex.com>

--Signature=_Tue__16_Feb_2010_11_38_14_+1100_kGyWayk1Uzuxw=FR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Wed, 10 Feb 2010 17:16:16 -0500 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> On Wed, 2010-02-10 at 12:33 +1100, Stephen Rothwell wrote:
> >=20
> > After merging the scsi tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > drivers/scsi/lpfc/lpfc_bsg.c: In function 'lpfc_bsg_diag_mode':
> > drivers/scsi/lpfc/lpfc_bsg.c:1496: error: implicit declaration of funct=
ion 'msleep'
> >=20
> > Caused by commit 3b5dd52aaffd291edea9f939ed46a960b240bb45 ("[SCSI] lpfc
> > 8.3.8: (BSG4) Add new vendor specific BSG Commands").
> >=20
> > Missing include of linux/delay.h?
>=20
> Looks to be exactly the problem.  delay.h gets pulled into some of the
> generic headers on x86, but not on ppc.
>=20
> Sorry, my powerstation isn't working (orange warning light) and I can't
> seem to get anyone to repair it, so I can't build for ppc anymore (which
> is why this didn't get spotted on commit).

This is still broken ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Feb_2010_11_38_14_+1100_kGyWayk1Uzuxw=FR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkt56PYACgkQjjKRsyhoI8zjRACeKM5h+a3bIK48wKFjoPuXUR7v
dnMAoLwxJ7kMwRJrY/xtnutBThcCi1yk
=Ozac
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Feb_2010_11_38_14_+1100_kGyWayk1Uzuxw=FR--
