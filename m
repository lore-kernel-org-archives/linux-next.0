From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Requirements and process
Date: Wed, 23 Jul 2008 14:28:59 +1000
Message-ID: <20080723142859.ab9f909d.sfr@canb.auug.org.au>
References: <20080503154542.18807e59.sfr@canb.auug.org.au>
	<20080503160724.6c3e0392.sfr@canb.auug.org.au>
	<20080722153114.e9d44210.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_14_28_59_+1000_ycQ+39eCxJs3HBNz"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753968AbYGWE3U@vger.kernel.org>
In-Reply-To: <20080722153114.e9d44210.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__23_Jul_2008_14_28_59_+1000_ycQ+39eCxJs3HBNz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Tue, 22 Jul 2008 15:31:14 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> > output from "git describe".  Alternatively, you can be based on another
> > tree in linux-next by using:
> >=20
> > # NEXT_BASE <name of a tree in linux-next>
>=20
> What do we use for BASE or NEXT_BASE if the base tree is linux-next?
> Just don't use these annotations?

The name from the Next/Trees file in any linux-next release.  You should
be very careful doing this if you don't control the other tree, though.
And you should let me know so that I can order the trees appropriately.

This was mainly added for Greg who has 4 quilt series in linux-next that
depend on each other.  If you depend on some random tree that changes day
to day your quilt series may no longer apply cleanly on top of it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_14_28_59_+1000_ycQ+39eCxJs3HBNz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGs4sACgkQjjKRsyhoI8xt1QCgkfudKjNFl0tUnrteGfP5Glu6
bSUAn0M9TZE5+bKememl99D1PeMaXhel
=yU8A
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_14_28_59_+1000_ycQ+39eCxJs3HBNz--
