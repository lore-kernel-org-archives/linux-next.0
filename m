From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [ofa-general] Re: linux-next: origin tree build failure
Date: Wed, 31 Dec 2008 02:46:54 +1100
Message-ID: <20081231024654.a73f20df.sfr@canb.auug.org.au>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<adavdt2ru39.fsf@cisco.com>
	<20081230193048.db7ee462.sfr@canb.auug.org.au>
	<adaljtxsma7.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__31_Dec_2008_02_46_54_+1100_7/v/0p2lTcWQhHHY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56418 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752311AbYL3PrE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Dec 2008 10:47:04 -0500
In-Reply-To: <adaljtxsma7.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org

--Signature=_Wed__31_Dec_2008_02_46_54_+1100_7/v/0p2lTcWQhHHY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland,

On Tue, 30 Dec 2008 07:41:36 -0800 Roland Dreier <rdreier@cisco.com> wrote:
>
>  > I can drop the revert after your fix goes into Linus' tree (since that=
 is
>  > where the breakage is) ... looking forward to it, thanks.
>=20
> Shouldn't it work if the fix is in my for-next branch, since you pull
> that as part of the -next tree?  Or am I unclear on how -next works?

I also build the tree between merging most of the trees (including after
fetching Linus' latest tree).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Dec_2008_02_46_54_+1100_7/v/0p2lTcWQhHHY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklaQm4ACgkQjjKRsyhoI8ycTACeKE5Avp2C+0UmP+4VeuYb0yWp
ZeUAn04HvTvvYkRl8qQeRrXnRw0YZ2e+
=C6Vl
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Dec_2008_02_46_54_+1100_7/v/0p2lTcWQhHHY--
