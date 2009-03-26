From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci tree build failure
Date: Thu, 26 Mar 2009 15:54:46 +1100
Message-ID: <20090326155446.26c7a4de.sfr@canb.auug.org.au>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
	<20090325122121.225a0ccb.sfr@canb.auug.org.au>
	<20090324183800.6ba50715@hobbes.virtuouswap>
	<20090325144117.9c54ae5a.sfr@canb.auug.org.au>
	<20090325043001.GF20264@linux.intel.com>
	<20090325085550.3788540b@hobbes.virtuouswap>
	<20090326140531.cde0be37.sfr@canb.auug.org.au>
	<20090325203711.5c8a6bc9@hobbes.virtuouswap>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Mar_2009_15_54_46_+1100_8btMEpqZn8E9yhxT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41766 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751789AbZCZEyy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 00:54:54 -0400
In-Reply-To: <20090325203711.5c8a6bc9@hobbes.virtuouswap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Matthew Wilcox <willy@linux.intel.com>, linux-next@vger.kernel.org

--Signature=_Thu__26_Mar_2009_15_54_46_+1100_8btMEpqZn8E9yhxT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Wed, 25 Mar 2009 20:37:11 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> =
wrote:
>
> Looked liked it used the PCI MSI capability ID offset though?  In that
> case it would really want at least pci_regs.h, but pci.h seems a little
> more complete in this case.

The patch that broke the build added that usage ... and introduced the
need for pci_regs.g to be included (or pci.h , as you say).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Mar_2009_15_54_46_+1100_8btMEpqZn8E9yhxT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknLCpYACgkQjjKRsyhoI8yd9ACdErRjA85MYh8jsjju5HuL2GRE
tEgAn3TEUfIRuAY5vhXX1L7rayZyy3ei
=sUbF
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Mar_2009_15_54_46_+1100_8btMEpqZn8E9yhxT--
