From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 25 Mar 2009 14:41:17 +1100
Message-ID: <20090325144117.9c54ae5a.sfr@canb.auug.org.au>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
	<20090325122121.225a0ccb.sfr@canb.auug.org.au>
	<20090324183800.6ba50715@hobbes.virtuouswap>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Mar_2009_14_41_17_+1100_Sgnyz40xD7Dyl8CY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43690 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754050AbZCYDlZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2009 23:41:25 -0400
In-Reply-To: <20090324183800.6ba50715@hobbes.virtuouswap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

--Signature=_Wed__25_Mar_2009_14_41_17_+1100_Sgnyz40xD7Dyl8CY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Tue, 24 Mar 2009 18:38:00 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> =
wrote:
>
> On Wed, 25 Mar 2009 12:21:21 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > On Mon, 23 Mar 2009 12:49:48 +1100 Stephen Rothwell
> > <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > >=20
> > > arch/powerpc/kernel/msi.c: In function 'arch_msi_check_device':
> > > arch/powerpc/kernel/msi.c:23: error: 'PCI_CAP_ID_MSI' undeclared
> > > (first use in this function)
> > >=20
> > > Caused by commit 1c8d7b0a562da06d3ebe83f01b1ed553205d1ae4 ("PCI
> > > MSI: Add support for multiple MSI").  PCI_CAP_ID_MSI is defined in
> > > linux/pci_regs.h which is included by linux/pci.h, but neither is
> > > included by arch/powerpc/kernel/msi.c.
> > >=20
> > > I have used the version of the pci tree from next-20090320 for
> > > today.
> >=20
> > This is still happening ...
>=20
> Does this fix it?  Some header file changes must be to blame...

Yeah, that patch fixes it, but so does just reverting the commit above,
so I guess that powerpc file did not need any of the pci.h infrastructure
before.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Mar_2009_14_41_17_+1100_Sgnyz40xD7Dyl8CY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknJp90ACgkQjjKRsyhoI8z0vACgi5A7nW4yYxNrWJmSE7RjV348
B2oAnR9LG/3AlLDnc32XwN2qiQQHi+pc
=xbL7
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Mar_2009_14_41_17_+1100_Sgnyz40xD7Dyl8CY--
