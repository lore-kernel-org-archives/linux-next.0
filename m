From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kvm tree build failure
Date: Tue, 19 Jan 2010 20:42:03 +1100
Message-ID: <20100119204203.d6df1874.sfr@canb.auug.org.au>
References: <20100119124259.e0d77b47.sfr@canb.auug.org.au>
	<4B5565F5.5030304@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Jan_2010_20_42_03_+1100_6Dc0bE2xDbikppFw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48448 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755173Ab0ASJmK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jan 2010 04:42:10 -0500
In-Reply-To: <4B5565F5.5030304@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gleb Natapov <gleb@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>

--Signature=_Tue__19_Jan_2010_20_42_03_+1100_6Dc0bE2xDbikppFw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

On Tue, 19 Jan 2010 09:57:41 +0200 Avi Kivity <avi@redhat.com> wrote:
>
> Doh, I noticed it and forgot to port the commit to linux-next.
>=20
> Marcelo, can you add 270d27e07d8 to the .34 queue?

OK, good.

> (Stephen, please copy Marcelo on all kvm issues, we share maintainership=
=20
> by switching tree ownership at semi random points in time so I can't=20
> always do anything about the breakage personally).

OK, I have added Marcelo to the contacts for the kvm tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Jan_2010_20_42_03_+1100_6Dc0bE2xDbikppFw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktVfmsACgkQjjKRsyhoI8w4kQCfZTmRYDZ647n5i0Xzy7UbO0Ip
/vIAnj30Z4AApxA8bUFFHt5wQCGSbkOX
=f63A
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Jan_2010_20_42_03_+1100_6Dc0bE2xDbikppFw--
