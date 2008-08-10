From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the creds tree
Date: Sun, 10 Aug 2008 22:53:18 +1000
Message-ID: <20080810225318.0a4b656f.sfr@canb.auug.org.au>
References: <20080808160844.796dfcc1.sfr@canb.auug.org.au>
	<alpine.LRH.1.10.0808081920110.25130@tundra.namei.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__10_Aug_2008_22_53_18_+1000_+lfB8I7D_wPqrt+7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54541 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753573AbYHJMx2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Aug 2008 08:53:28 -0400
In-Reply-To: <alpine.LRH.1.10.0808081920110.25130@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, David Chinner <dgc@sgi.com>, xfs-masters@oss.sgi.com

--Signature=_Sun__10_Aug_2008_22_53_18_+1000_+lfB8I7D_wPqrt+7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Fri, 8 Aug 2008 19:23:11 +1000 (EST) James Morris <jmorris@namei.org> wr=
ote:
>
> I'm not 100% clear on the new process.
>=20
> What happens with your fixup patch?  Is this something you maintain in=20
> your tree from now until these trees are merged with Linus?  (At which=20
> point we'll run into the same conflicts again ?)

I redo the conflict fixup (well, "git rerere" usually does it for me)
each day, and by the time the tree gets merged by Linus, he will either
fix the conflict as well, or somewhere along the way it gets taken care
of by the owner of one of the trees by doing a merge or rebase against
Linus' tree after the other tree gets merged.

Or sometimes we do a temporary form of an API change so that other trees
can do the API change early and thus remove the conflict.

There is nothing official about this procedure, I am just trying to make
things easier by noticing possible problems early.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__10_Aug_2008_22_53_18_+1000_+lfB8I7D_wPqrt+7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkie5L4ACgkQjjKRsyhoI8xFhQCghBtKJYYm8LRPCC1dF5jiPvoh
Dc8AoLuUxOcBpyVTvnASWz5xg84UqRF1
=tLLj
-----END PGP SIGNATURE-----

--Signature=_Sun__10_Aug_2008_22_53_18_+1000_+lfB8I7D_wPqrt+7--
