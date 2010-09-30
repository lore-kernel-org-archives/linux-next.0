From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Vipin.Mehta@Atheros.com: [PATCH] staging: ath6kl: Fixing the
 driver to use modified mmc_host structure
Date: Thu, 30 Sep 2010 10:57:48 +1000
Message-ID: <20100930105748.5b049c44.sfr@canb.auug.org.au>
References: <20100930003419.GB5906@vmehta-desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Sep_2010_10_57_48_+1000_ccvSP7MNV7BNU=9B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50177 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751194Ab0I3A5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 20:57:53 -0400
In-Reply-To: <20100930003419.GB5906@vmehta-desktop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vipin Mehta <vmehta@atheros.com>
Cc: linux-next@vger.kernel.org, greg@kroah.com

--Signature=_Thu__30_Sep_2010_10_57_48_+1000_ccvSP7MNV7BNU=9B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vipin,

On Wed, 29 Sep 2010 17:34:19 -0700 Vipin Mehta <vmehta@atheros.com> wrote:
>
>     Can you pls help me apply the following patch to the linux-next=20
> tree. The patch fixes a compilation problem with ath6kl due to a
> change in the mmc_host structure. The driver compiles fine in the
> staging-next-2.6 tree which is where the changes for this driver=20
> actually go. However, the mmc stack in the linux-next tree and=20
> staging-next-2.6 is out of sync and so this patch is only applicable
> to linux-next.

I will carry it as a merge fixup patch for the staging-next tree.
Someone just needs to make sure that this patch gets applied (or sent to
Linus) at the right time.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Sep_2010_10_57_48_+1000_ccvSP7MNV7BNU=9B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMo+CMAAoJEDMEi1NhKgbs1T8H/iHR7F5SWDJVykOhnYAwoxkk
C9jsYpkE0gVOIw+Rmq1mbS5c5vXDlYG1DxRcaTtxjTiEHk777KpDgjbT1SIO9kC8
MheBhp7C8CmMGsNiq77r/ArLjbP1L3TF/iGM8819YVTDMPZ/TuNxpcGa5U2qghwC
fcPQyiHk4OXHUUXQEqp3+z/K+hR01BBD8RpAD9Va2/BNK5IM/JkreacNop+wu8f5
VUYdARUBxszCKAF8saRPto/3U9LOiL2r2FBIl9GUbvC2vGhXfPW82yA3BRg8tyNV
z8ABe0JyLwzx+ahKzJR3Ol/9AtGJuSC7pxmPyJp4FJPeKlGL0HBP3IzZ9EGRSf8=
=3z4l
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Sep_2010_10_57_48_+1000_ccvSP7MNV7BNU=9B--
