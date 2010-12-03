From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unsigned commit ...
Date: Fri, 3 Dec 2010 15:46:26 +1100
Message-ID: <20101203154626.43b4e247.sfr@canb.auug.org.au>
References: <20101203092928.367d45c0.sfr@canb.auug.org.au>
	<alpine.LRH.2.00.1012031146480.26585@tundra.namei.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Dec_2010_15_46_26_+1100_3qgItx9li/WC9ljg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53783 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758338Ab0LCEqe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Dec 2010 23:46:34 -0500
In-Reply-To: <alpine.LRH.2.00.1012031146480.26585@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

--Signature=_Fri__3_Dec_2010_15_46_26_+1100_3qgItx9li/WC9ljg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Fri, 3 Dec 2010 12:21:00 +1100 (EST) James Morris <jmorris@namei.org> wr=
ote:
>
> On Fri, 3 Dec 2010, Stephen Rothwell wrote:
>=20
> I noticed it and pointed it out to Casey, who is converting over to=20
> pushing git to me instead of posting patch sets.

OK, so learning, I guess.

> If I'm pulling from someone's repo, it means I trust them enough not to=20
> need to personally review each line of change.
>=20
> Can this be fixed with git-commit --amend ?

In Casey's tree it can.  But then you would need to remerge his tree into
yours.  That would leave us with both versions of the commit in your tree.

If, however, you first do a "git reset --hard HEAD^" on your tree
(assuming that the old merge is still at the top), then it will be like
the old merge was never done.   This, however will disrupt anyone who's
tree is built on top of yours and has merged your tree (or rebased on top
of it) while that old merge was there (just like if you rebased your
tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Dec_2010_15_46_26_+1100_3qgItx9li/WC9ljg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM+HYiAAoJEDMEi1NhKgbsaR0H/jmLsMVchX5UDA5wUFkvNA3p
6FnH0Wrdmkpni7fscsgxBn6x1OQk1uCz6gCX1d0S6k35ZxQdTKEbw4ihwvGdlw2T
ooRbfV+8u+knRE3PHAW5pspdyW5wsKi3UVTxkfOXfMHGyCqouon2JIiaLuzQ0I54
BFlDJP7cdY62dkI47cSNHQpE5ur8h8sdjPslglpDacGDOBDEMLb5ksSARqkZaJXo
UDbUXY+lscpAIJmmJB6gVd5RS8czOFrO3VPGB+SYVd8JecXN2YY0x94guoj+Ld5V
+rhs3nANKXLLf9or0gj/KuGE5qo9ginTs1s0uI05QDHULGYhEIhnstIlE8NSlQc=
=SNsC
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Dec_2010_15_46_26_+1100_3qgItx9li/WC9ljg--
