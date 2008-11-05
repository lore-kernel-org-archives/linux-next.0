From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the semaphore-removal tree
Date: Wed, 5 Nov 2008 14:31:10 +1100
Message-ID: <20081105143110.c6e410d6.sfr@canb.auug.org.au>
References: <20081015182615.a9089a9f.sfr@canb.auug.org.au>
	<20081103144124.701d33f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Nov_2008_14_31_10_+1100_9EVRXJn+GUxN9Nit"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35022 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754307AbYKEDbT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 22:31:19 -0500
In-Reply-To: <20081103144124.701d33f7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>

--Signature=_Wed__5_Nov_2008_14_31_10_+1100_9EVRXJn+GUxN9Nit
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

On Mon, 3 Nov 2008 14:41:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 15 Oct 2008 18:26:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the semaphore-removal tree got a conflict in
> > net/9p/trans_virtio.c between commits
> > 5c1f7a7bf4c0baea08f6f3e913dd67cb17e78c20 ("9p: move request management =
to
> > client code") and 6a29d78c78b9cc4178997695f8d518d0506a87a9 ("9p:
> > consolidate transport structure") from the v9fs tree and commit
> > 2a0e26c90de6245213ac53390b1f125c749ebba9 ("9p: Convert from mutex to
> > spinlock") from the semaphore-removal tree.
> >=20
> > The context was changed by the v9fs changes.  I fixed it up (see below).
>=20
> These changes from the v9fs tree are now in Linus' tree (since
> 2.6.28-rc1) and the conflict persists, so I am dropping the
> semaphore-removal tree for today.

And again today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Nov_2008_14_31_10_+1100_9EVRXJn+GUxN9Nit
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkRE34ACgkQjjKRsyhoI8yqigCcC683yzR7AmqI77UK9HF4ZyOd
nIMAoImPkB1qkzlBAWw2GKts0fuLuyYl
=kE/A
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2008_14_31_10_+1100_9EVRXJn+GUxN9Nit--
