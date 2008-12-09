From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 10 Dec 2008 10:41:10 +1100
Message-ID: <20081210104110.31256648.sfr@canb.auug.org.au>
References: <20081209132136.c58c0ca5.sfr@canb.auug.org.au>
	<20081209221708.GH8596@fieldses.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__10_Dec_2008_10_41_10_+1100_PF90FcAJDEx7YXwu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54594 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752011AbYLIXlU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 18:41:20 -0500
In-Reply-To: <20081209221708.GH8596@fieldses.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Chuck Lever <chuck.lever@oracle.com>

--Signature=_Wed__10_Dec_2008_10_41_10_+1100_PF90FcAJDEx7YXwu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Tue, 9 Dec 2008 17:17:08 -0500 "J. Bruce Fields" <bfields@fieldses.org> =
wrote:
>
> I could rebase nfsd onto net in this case if that'd simplify your life.
> Assuming net never rebases that wouldn't cause additional conflicts for
> you.
>=20
> And that's more-or-less what we'll end up doing come the merge window
> anyway.
>=20
> (Or we could pull one of net or nfsd into the other.)

The net tree never rebases, so pulling it into your tree is fine and a
good solution.  That would move the conflict resolution from my tree to
yours (which is always better since you know your code better than I do).

The only thing to remember is that the net tree should be merged into
Linus' before the nfsd tree during the merge window.  (It doesn't really
matter, but is good form as then Dave will get blamed for any problems
introduced by his tree rather than you :-))

The only other downside is that if Dave's tree has a bug (in the part you
have merged) that causes me to drop it then I will have to drop your tree
as well.  However, that doesn't happen very often (right, Dave?  :-)).

The alternative of Dave merging your tree into his only works if you can
guarantee that you will never rebase your tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__10_Dec_2008_10_41_10_+1100_PF90FcAJDEx7YXwu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk/AhYACgkQjjKRsyhoI8yx4ACffWAHL33O7zaiYCPeEYT/ONK/
4dgAnR+QfJ+k3U6mQ4vS/6IfXyzIO7jl
=5C41
-----END PGP SIGNATURE-----

--Signature=_Wed__10_Dec_2008_10_41_10_+1100_PF90FcAJDEx7YXwu--
