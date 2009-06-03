From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: IO BAR sizing warning
Date: Wed, 3 Jun 2009 16:49:54 +1000
Message-ID: <20090603164954.2a7aa3f4.sfr@canb.auug.org.au>
References: <20090506143007.c0ef2340.sfr@canb.auug.org.au>
	<4A013A70.30101@kernel.org>
	<20090506092418.3fffab6b@hobbes>
	<CAC4B8726E86A142B27A9E9A2F2F1247AB7A8255@rrsmsx505.amr.corp.intel.com>
	<20090506110034.3c7d6e67@hobbes>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Jun_2009_16_49_54_+1000_FFOWdhjW2XmBgd/5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39695 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619AbZFCGuF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 02:50:05 -0400
In-Reply-To: <20090506110034.3c7d6e67@hobbes>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>, Yinghai Lu <yinghai@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

--Signature=_Wed__3_Jun_2009_16_49_54_+1000_FFOWdhjW2XmBgd/5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 May 2009 11:00:34 -0700 Jesse Barnes <jbarnes@virtuousgeek.org> w=
rote:
>
> On Wed, 6 May 2009 11:41:12 -0600
> "Wilcox, Matthew R" <matthew.r.wilcox@intel.com> wrote:
>=20
> > I think PowerPC's IO_SPACE_LIMIT is defined incorrectly.
> >=20
> > On 64-bit, it's currently set to 0xffff'ffff'ffff'ffff.  This can't
> > possibly work, there's no way for the PCI bus to transmit 64-bit
> > IO-port addresses.  It should probably be defined to
> >=20
> > 0xffffffffU
>=20
> But yeah on a bus level it clearly needs to be limited to 32 bits, but
> ISTR that some arches use the high resource bits for tracking I/O
> resources on a systemwide basis (too lazy to look atm).
>=20
> So either we need to split the definition between bus & resource usage,
> or add a cast here...

I am still getting the original warning.  For reference, the following
architectures will probably have the same:

ia64:		0xffffffffffffff
powerpc:	~(0UL)
sparc64:	0xffffffffffffffffUL

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Jun_2009_16_49_54_+1000_FFOWdhjW2XmBgd/5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkomHRIACgkQjjKRsyhoI8yDWgCgpu7chvAgkoIca2MtsJxfMWYp
UCcAmQHgXPqnJGstD/ppI/NFg83GOvI8
=pZQC
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Jun_2009_16_49_54_+1000_FFOWdhjW2XmBgd/5--
