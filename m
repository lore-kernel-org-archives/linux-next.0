From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: UWB: A new subsystem tree
Date: Thu, 18 Sep 2008 04:33:41 +1000
Message-ID: <20080918043341.710eb66b.sfr@canb.auug.org.au>
References: <48D11B0B.3040804@csr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Sep_2008_04_33_41_+1000_0/A=pyEe6l.Mko1Y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59916 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754588AbYIQSdy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 14:33:54 -0400
In-Reply-To: <48D11B0B.3040804@csr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__18_Sep_2008_04_33_41_+1000_0/A=pyEe6l.Mko1Y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, 17 Sep 2008 15:58:19 +0100 David Vrabel <david.vrabel@csr.com> wrot=
e:
>
> There's a new tree for the UWB, WUSB and WLP subsystems.  Can it be
> added to the set of trees in linux-next?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/dvrabel/uwb.git
>=20
> You'll want the 'for-upstream' branch.

I have added that for today's linux-next.

Usual speech I give everybody: changes must be posted somewhere relevant,
reviewed, unit tested and destined for the next merge window (or the
current release).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Sep_2008_04_33_41_+1000_0/A=pyEe6l.Mko1Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjRTYUACgkQjjKRsyhoI8x5dwCeO3DubP9eoUJMmDsFndPPYiil
RLcAnAmDtp99JJ/baG6oztW1kexcRMTx
=oyd9
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Sep_2008_04_33_41_+1000_0/A=pyEe6l.Mko1Y--
