From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 21:50:57 +1100
Message-ID: <20090123215057.f5512e43.sfr@canb.auug.org.au>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
	<20090122.235612.256786187.davem@davemloft.net>
	<20090123190103.1420c62f.sfr@canb.auug.org.au>
	<20090123.001337.179440063.davem@davemloft.net>
	<20090123212128.16cd5698.sfr@canb.auug.org.au>
	<20090123213927.61beb5b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__23_Jan_2009_21_50_57_+1100_bs9+gFy3ul7PPncE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37982 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753420AbZAWKvD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 05:51:03 -0500
In-Reply-To: <20090123213927.61beb5b3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

--Signature=_Fri__23_Jan_2009_21_50_57_+1100_bs9+gFy3ul7PPncE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Jan 2009 21:39:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi again,
>=20
> On Fri, 23 Jan 2009 21:21:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > So, this could be a compiler bug?
>=20
> We pass -fno-common to gcc which seems to cause the (non-extern) const
> variable to end up in the bss.

       -fno-common
           In C, allocate even uninitialized global variables in the data
           section of the object file, rather than generating them as common
           blocks.  This has the effect that if the same variable is declar=
ed
           (without "extern") in two different compilations, you will get an
           error when you link them.  The only reason this might be useful =
is
           if you wish to verify that the program will work on other systems
           which always work this way.

I don't know why we use this, but it seems to basically make using
"extern" on variables in header files compulsory.  But it seems to be
moving the variable from *COM* to .bss rather than to .{ro}data as I would
expect from the description above.

Oh, well, easy to work around.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__23_Jan_2009_21_50_57_+1100_bs9+gFy3ul7PPncE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl5oREACgkQjjKRsyhoI8yMIACghOc2oq7rTU0a2T6UVQ2WHl6w
GDIAoL2YEVv3D2i8XJwC2ucM6XRcFpQQ
=95s+
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Jan_2009_21_50_57_+1100_bs9+gFy3ul7PPncE--
