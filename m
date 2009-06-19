From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Fwd: [PULL] hardware latency detector]
Date: Sat, 20 Jun 2009 08:31:27 +1000
Message-ID: <20090620083127.dbf3103e.sfr@canb.auug.org.au>
References: <1245374831.14766.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__20_Jun_2009_08_31_27_+1000_8lJmNF.svmUVT9n5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53177 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758732AbZFSWb3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Jun 2009 18:31:29 -0400
In-Reply-To: <1245374831.14766.19.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: linux-next@vger.kernel.org

--Signature=_Sat__20_Jun_2009_08_31_27_+1000_8lJmNF.svmUVT9n5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, 18 Jun 2009 21:27:11 -0400 Jon Masters <jonathan@jonmasters.org> wr=
ote:
>
> I've posted this for merge, but plan to continue developing against the
> "master" branch of this tree and then push to "for-linus" before
> posting. Perhaps you'd like to add either branch to linux-next.

I'll add your for-linus branch to linux-next on Monday (the next tree I
will create).

What I tell everyone: all patches/commits in the tree/series must
have been:

	posted to a relevant mailing list
	reviewed
	unit tested
	destined for the next merge window (or the current release)

*before* they are included.  The linux-next tree is for integration
testing and to lower the impact of conflicts between subsystems in the
next merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

I'll switch to your master branch if all the above holds for it.  Some
people have three "public" branches: "bug fixes", "ready for linus" and
"development" (called various different things), and I generally stick
to the "ready for linus" stuff ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__20_Jun_2009_08_31_27_+1000_8lJmNF.svmUVT9n5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko8Eb8ACgkQjjKRsyhoI8ys0wCffTbl8rYJF6IG/001F+g26MCa
aXMAnRZuJReI3bwpduVbOz/SSjWxPLdb
=cTa5
-----END PGP SIGNATURE-----

--Signature=_Sat__20_Jun_2009_08_31_27_+1000_8lJmNF.svmUVT9n5--
