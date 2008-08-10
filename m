From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the creds tree
Date: Sun, 10 Aug 2008 23:23:31 +1000
Message-ID: <20080810232331.2dc97edb.sfr@canb.auug.org.au>
References: <20080808160844.796dfcc1.sfr@canb.auug.org.au>
	<alpine.LRH.1.10.0808081920110.25130@tundra.namei.org>
	<20080810225318.0a4b656f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__10_Aug_2008_23_23_31_+1000_0s0QPBi3_JC_XIGt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52512 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751005AbYHJNXj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Aug 2008 09:23:39 -0400
In-Reply-To: <20080810225318.0a4b656f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, David Chinner <dgc@sgi.com>, xfs-masters@oss.sgi.com

--Signature=_Sun__10_Aug_2008_23_23_31_+1000_0s0QPBi3_JC_XIGt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Sun, 10 Aug 2008 22:53:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 8 Aug 2008 19:23:11 +1000 (EST) James Morris <jmorris@namei.org> =
wrote:
> >
> > I'm not 100% clear on the new process.
> >=20
> > What happens with your fixup patch?  Is this something you maintain in=
=20
> > your tree from now until these trees are merged with Linus?  (At which=
=20
> > point we'll run into the same conflicts again ?)
>=20
> I redo the conflict fixup (well, "git rerere" usually does it for me)
> each day, and by the time the tree gets merged by Linus, he will either
> fix the conflict as well, or somewhere along the way it gets taken care
> of by the owner of one of the trees by doing a merge or rebase against
> Linus' tree after the other tree gets merged.
>=20
> Or sometimes we do a temporary form of an API change so that other trees
> can do the API change early and thus remove the conflict.
>=20
> There is nothing official about this procedure, I am just trying to make
> things easier by noticing possible problems early.

Of course build (and runtime) bugs are a different matter and should be
fixed as soon as possible.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__10_Aug_2008_23_23_31_+1000_0s0QPBi3_JC_XIGt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkie69MACgkQjjKRsyhoI8wOOACgs45XWB8U9Swau1Nl3nFIOMk/
7vIAn2d8+pJAmw+NnP5z+65A/hyGlLEk
=veql
-----END PGP SIGNATURE-----

--Signature=_Sun__10_Aug_2008_23_23_31_+1000_0s0QPBi3_JC_XIGt--
