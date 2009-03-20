From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the staging tree with the drm tree
Date: Fri, 20 Mar 2009 16:42:14 +1100
Message-ID: <20090320164214.c625a4c6.sfr@canb.auug.org.au>
References: <20090320153826.e6f1d760.sfr@canb.auug.org.au>
	<20090320051501.GB3698@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Mar_2009_16_42_14_+1100_QN1JraQhBgg3y2Z0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44022 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750836AbZCTFmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2009 01:42:24 -0400
In-Reply-To: <20090320051501.GB3698@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Thomas Hellstrom <thellstrom@vmware.com>, Richard Purdie <rpurdie@linux.intel.com>, Ben Gamari <bgamari@gmail.com>, Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@linux.ie>

--Signature=_Fri__20_Mar_2009_16_42_14_+1100_QN1JraQhBgg3y2Z0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 19 Mar 2009 22:15:01 -0700 Greg KH <greg@kroah.com> wrote:
>
> > However, I do need to wonder why changes to drivers/gpu are appearing in
> > the staging tree - I assumed that its updates would be restricted to the
> > drivers/staging directory (as much as possible).
>=20
> There is a driver in the staging directory that needs these drm core
> changes.  I've posted these to David and the drm list and lkml, and we
> are currently discussing their future.  If David ends up rejecting them,
> I'll drop them from my tree.

Right.  I need more time to read LKML :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Mar_2009_16_42_14_+1100_QN1JraQhBgg3y2Z0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknDLLYACgkQjjKRsyhoI8zJ+ACgj1zFldYxs/g7cTPv5MZLwChj
Ji8AoLUzRsSPAJL6j7lfCPN+hRRcoRWj
=4upE
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Mar_2009_16_42_14_+1100_QN1JraQhBgg3y2Z0--
