From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Fri, 15 Aug 2008 18:00:23 +1000
Message-ID: <20080815180023.e6f92a1a.sfr@canb.auug.org.au>
References: <20080815164909.3d8beb10.sfr@canb.auug.org.au>
	<19f34abd0808150004ma79af8ei9009a792b87a4c80@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_18_00_23_+1000_dN1uqCHNQYqv6EjK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55153 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752732AbYHOIAb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 04:00:31 -0400
In-Reply-To: <19f34abd0808150004ma79af8ei9009a792b87a4c80@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, "Gustavo F. Padovan" <gustavo@las.ic.unicamp.br>

--Signature=_Fri__15_Aug_2008_18_00_23_+1000_dN1uqCHNQYqv6EjK
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vegard,

On Fri, 15 Aug 2008 09:04:08 +0200 "Vegard Nossum" <vegard.nossum@gmail.com=
> wrote:
>
> Just out of curiosity: Do you have a script that produces these
> messages? How hard would it be to include the "merge patch" (conflict
> resolution) itself in this e-mail?

I do use a script, but I start the email before I figure out what the
actual conflict and resolution are so I can fill in the details as I find
them.

> I think that would be a very helpful addition (if it can be done with
> no hassle on your side), because it means that I could actually look
> over it and give a comment if it looks wrong (with no hassle on my
> side, looking up the merge commit, etc.).

I'll see what I can do.  It shouldn't be to hard.

> But if it can't be done easily, then don't bother. The issues are
> mostly trivial anyway. Thanks for doing this work!

The really trivial ones usually end up with nothing in the resolution
diff as I take the commit from one or other tree, so I will leave those
out.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_18_00_23_+1000_dN1uqCHNQYqv6EjK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkilN5cACgkQjjKRsyhoI8w6jwCfe1/rk8bLTgWZf/uaqcp6W4Sh
+c0AoJzxDVqFDtXA6C8Ls3G4ihMTDvkc
=pts8
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_18_00_23_+1000_dN1uqCHNQYqv6EjK--
