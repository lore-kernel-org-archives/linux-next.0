From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current
 tree
Date: Sat, 7 Feb 2009 11:07:46 +1100
Message-ID: <20090207110746.080dd5bc.sfr@canb.auug.org.au>
References: <20090206135041.fd7a8e7e.sfr@canb.auug.org.au>
	<200902060909.32549.jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__7_Feb_2009_11_07_46_+1100_MBRrXCCuVO4HJJVy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41121 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745AbZBGAHz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 19:07:55 -0500
In-Reply-To: <200902060909.32549.jbarnes@virtuousgeek.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Sat__7_Feb_2009_11_07_46_+1100_MBRrXCCuVO4HJJVy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Fri, 6 Feb 2009 09:09:31 -0800 Jesse Barnes <jbarnes@virtuousgeek.org> w=
rote:
>
> Oops yeah, thanks for bringing this up.  I didn't rebase my linux-next br=
anch=20
> on top of my for-linus branch with the last set of changes...  Will do.

You shouldn't need to rebase just for this. Just wait for Linus to merge
the pci-current tree and then merge either it or Linus' tree into the
pci-tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__7_Feb_2009_11_07_46_+1100_MBRrXCCuVO4HJJVy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmM0NIACgkQjjKRsyhoI8yawwCgjhzYWdETTDnF5ymYtQ6bDRZX
S/QAmwXG27hpAfsq13YlT8tPugXu7F5x
=ogu7
-----END PGP SIGNATURE-----

--Signature=_Sat__7_Feb_2009_11_07_46_+1100_MBRrXCCuVO4HJJVy--
