From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: revert of "debug: add notifier chain debugging"
Date: Tue, 2 Sep 2008 18:33:28 +1000
Message-ID: <20080902183328.571911ca.sfr@canb.auug.org.au>
References: <20080901182619.cb799b52.sfr@canb.auug.org.au>
	<48BBFAFE.7030808@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Sep_2008_18_33_28_+1000_YvnnVvzIcJ5MACCl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37125 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbYIBIdm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 04:33:42 -0400
In-Reply-To: <48BBFAFE.7030808@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__2_Sep_2008_18_33_28_+1000_YvnnVvzIcJ5MACCl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arjan,

On Mon, 01 Sep 2008 07:23:58 -0700 Arjan van de Ven <arjan@linux.intel.com>=
 wrote:
>
> well it's a pretty bad bug since there are many places that depend on the=
 kernel text stuff to work.
> (backtracing, lockdep, some of the security checks etc). PPC needs to be =
fixed rather urgently.
> but yeah the system kept plodding on.
> David also sent a patch to fix it fwiw.
>=20
> I'm a bit sad to see a debug patch get reverted just because it caught bu=
gs ;-)
> at least I assume this is very temporary.

Today I still reverted the patch, but I applied the new version as well
as applying the simple powerpc fix patch, so we shall see ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Sep_2008_18_33_28_+1000_YvnnVvzIcJ5MACCl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki8+lgACgkQjjKRsyhoI8yJiACePw6uwvyBXejdpNiIqa7KmOeZ
bVgAn3vRiOOw6/5eIPmqRl5k/ZWXYt4g
=VDqb
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Sep_2008_18_33_28_+1000_YvnnVvzIcJ5MACCl--
