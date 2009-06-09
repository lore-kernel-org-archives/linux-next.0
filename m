From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Tue, 9 Jun 2009 19:45:15 +1000
Message-ID: <20090609194515.7a1adebd.sfr@canb.auug.org.au>
References: <1244477423.4079.228.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Jun_2009_19_45_15_+1000_8SGz4ayxH3B7Ntao"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59672 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758590AbZFIJpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 05:45:18 -0400
In-Reply-To: <1244477423.4079.228.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__9_Jun_2009_19_45_15_+1000_8SGz4ayxH3B7Ntao
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Mon, 08 Jun 2009 11:10:23 -0500 James Bottomley <James.Bottomley@HansenP=
artnership.com> wrote:
>
> Could you add this (as a postmerge tree) somewhere after the x86 trees,
> please (it depends on the auto-x86-next branch).
>=20
> I'll be sending the pull request for it to Linus somewhere in the next
> merge window (probably towards the end) and if he takes it, linux-next
> inclusion for a small number of patches it contains will probably be a
> recurring feature.
>=20
> The tree is at:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/jejb/voyager-2.6.git#master

I added it near the end for today (but see my other emails for the
results).  I will move it up just after the x86 tree tomorrow and hope
for better results.

(You have seen the following before, this is just for "form")

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Jun_2009_19_45_15_+1000_8SGz4ayxH3B7Ntao
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkouLysACgkQjjKRsyhoI8x63gCfRf7iB4DrmNxldUerfDQkZ1RU
IDIAoIVmP1eTMYlxVrcr2fG/K2mQErhh
=6dI1
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Jun_2009_19_45_15_+1000_8SGz4ayxH3B7Ntao--
