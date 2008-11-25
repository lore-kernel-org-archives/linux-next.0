From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: userns tree ready
Date: Tue, 25 Nov 2008 11:58:55 +1100
Message-ID: <20081125115855.5e688ff1.sfr@canb.auug.org.au>
References: <20081125001651.GA10661@us.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_11_58_55_+1100_Zif4.3M3njC94c/6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60390 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755931AbYKYA7K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 19:59:10 -0500
In-Reply-To: <20081125001651.GA10661@us.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org

--Signature=_Tue__25_Nov_2008_11_58_55_+1100_Zif4.3M3njC94c/6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Serge,

On Mon, 24 Nov 2008 18:16:51 -0600 "Serge E. Hallyn" <serue@us.ibm.com> wro=
te:
>
> I've created a new userns tree - although the patches are completely
> unchanged from before they were pulled along with David's patches.
> They apply fine either right after James' security-next tree or at
> the end of linux-next.  The tree is at
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/userns-2.6#next
>=20
> like before, and is based on James's security-next tree.

Thanks for that, I will merge it in today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_11_58_55_+1100_Zif4.3M3njC94c/6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrTc8ACgkQjjKRsyhoI8zscwCcDYn95E7yVEolzA7T+ma9a19z
CWMAoIvJCFvCXiLzJYoxNrVNG+JBsegL
=I+AJ
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_11_58_55_+1100_Zif4.3M3njC94c/6--
