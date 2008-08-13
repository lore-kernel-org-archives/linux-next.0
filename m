From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the slab tree
Date: Wed, 13 Aug 2008 17:11:16 +1000
Message-ID: <20080813171116.6cce0139.sfr@canb.auug.org.au>
References: <20080813145741.43da1fc8.sfr@canb.auug.org.au>
	<48A27CEF.3040708@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_17_11_16_+1000_QHfKQlJIqU88B_Mp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49408 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751722AbYHMHL0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 03:11:26 -0400
In-Reply-To: <48A27CEF.3040708@cs.helsinki.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>

--Signature=_Wed__13_Aug_2008_17_11_16_+1000_QHfKQlJIqU88B_Mp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Wed, 13 Aug 2008 09:19:27 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wr=
ote:
>
> Stephen Rothwell wrote:
> > Today's linux-next merge of the slab tree got a conflict in
> > lib/Kconfig.debug between commit 3794f3e812ef707a4f7931742274d1d0ca6597=
b4
> > ("docsrc: build Documentation/ sources") from Linus' tree and commit
> > 5db80305ad7ea891246aec24204630c2925e7b12 ("kmemtrace: Core
> > implementation") from the slab tree.
> >=20
> > Just a matter of overlapping additions.  I took both sets.
>=20
> Can I fix this up in my tree? Mine is based on Linus so should I rebase=20
> my 'for-next' branch on top of linux-next?

You should *never* base anything on linux-next if it is to be included in
linux-next.  What you should do is merge in Linus' latest tree (since
that is the other side of the conflict, in this case) and you will get the
same conflict and you can fix it in the merge that you do. Then tomorrow,
I won't see the conflict when I do my merge of your updated tree.

This is not urgent, though, as "git rerere" will redo the fixup for me
tomorrow if you haven't fixed it.

If I get conflicts between your tree and other trees in linus-next, there
is generally nothing you can do about it and I will just have to fix the
conflict each day.  This is as it should be.  :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_17_11_16_+1000_QHfKQlJIqU88B_Mp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiiiRQACgkQjjKRsyhoI8yfzwCeNxeaBnoel8IKT+ANdP7jI4pT
baMAn2jWwTCl22c0zt0K1uDqJ6UoSJBQ
=2nLU
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_17_11_16_+1000_QHfKQlJIqU88B_Mp--
