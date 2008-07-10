From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mfd tree
Date: Thu, 10 Jul 2008 10:42:27 +1000
Message-ID: <20080710104227.5f5a6a12.sfr@canb.auug.org.au>
References: <20080708171103.f9c9a3ce.sfr@canb.auug.org.au>
	<20080710001059.GA2637@sortiz.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_10_42_27_+1000__WFiHmvBqs+52Q1l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752345AbYGJAmh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 20:42:37 -0400
In-Reply-To: <20080710001059.GA2637@sortiz.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__10_Jul_2008_10_42_27_+1000__WFiHmvBqs+52Q1l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Thu, 10 Jul 2008 02:11:00 +0200 Samuel Ortiz <sameo@openedhand.com> wrot=
e:
>=20
> On Tue, Jul 08, 2008 at 05:11:03PM +1000, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the mfd tree got a conflict in MAINTAINERS
> > between commit 4e0d13cbb71de2b1baf71ddd3c14f7ba8da810e5 ("MFD
> > maintainer") from Linus' tree and commit
> > 52554ec1473a5334ffe589053268d7dd89007afa ("MFD maintainer") from the mfd
> > tree.
> >
> > Same commit - different white space. I used Linus' version.
> Yep, I removed this commit from my for-next branch. Your merge should go
> fine now.

Thanks for that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_10_42_27_+1000__WFiHmvBqs+52Q1l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh1WvMACgkQjjKRsyhoI8wAxQCcC4e6g5PjjqOHQRvDnsKrBCPD
ZuoAmwd7+yGS6jrXsw0o3c1Pb8AsnrLI
=A3HM
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_10_42_27_+1000__WFiHmvBqs+52Q1l--
