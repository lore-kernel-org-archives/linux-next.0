From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: hang while trying to fetch the osd tree
Date: Mon, 1 Jun 2015 08:51:53 +1000
Message-ID: <20150601085153.125f982c@canb.auug.org.au>
References: <20150528104735.387bdb22@canb.auug.org.au>
	<5566D45E.5000000@electrozaur.com>
	<556AC9A6.7010300@plexistor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Em5I2yM2b0DuaMlnQmDHOeA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53716 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751232AbbEaWv7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 18:51:59 -0400
In-Reply-To: <556AC9A6.7010300@plexistor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <boaz@plexistor.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/Em5I2yM2b0DuaMlnQmDHOeA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boaz,

On Sun, 31 May 2015 11:43:18 +0300 Boaz Harrosh <boaz@plexistor.com> wrote:
>
> On 05/28/2015 11:39 AM, Boaz Harrosh wrote:
> > On 05/28/2015 03:47 AM, Stephen Rothwell wrote:
> >>
> >> Trying to fetch the osd tree
> >> (git://git.open-osd.org/linux-open-osd.git#linux-next) just hangs after
> >> connecting. :-(
> >>
> >=20
> > Yes I've seen that too.
> >=20
> > I will wait until Sunday (5/31) and if it does not come back up I will
> > switch to another tree on another domain.
> >=20
> > Please suspend the fetching for now And I will post you an email
> > on Sunday if to re-enable or if to switch to a new address.
> >=20
> > Sorry for the mess
> > Boaz
> >=20
>=20
> Hi Stephen
>=20
> So it looks like the service is back so we'll keep the same
> address for now.
>=20
> Apparently I still had ssh access to this server and all that
> was needed was a service restart to the gitd

Thanks, looks good from here.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Em5I2yM2b0DuaMlnQmDHOeA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa5CNAAoJEMDTa8Ir7ZwVsNkP/jqqfJjAEfYFyJwpBPPjdztA
srz8Zg3onKnli51mTgrlqZIrYSz/ySt9MDbsWuyE6M/Et4qxq4JiJ0XHcK9GsJ+A
9A6AxHrTpv5H07TdRt4vQv5jfdJP35doFgh303CRZ2PgBygRjFqeARnnTkA0a/PD
PWfgTDLmWulel/et5IIsiDtGMqsEl3T9JPHs1wvoVmqTYtG9NRHn91jeYDG1FUhe
Y9zHa7HOxsyEnfER+dHKbcAeqEFN9kA/fAVBkt0/K8/CgfsB11G/BFKXKfmQeZBp
B+bCAZyJoFj/pPq6/t2wjXfDd1d8yFDs3Q9sT9EdLNrZsfbC6EE7YkgTcryCKHhu
C1vqIBUrcyUV9PirdGaHYf/XThN68+CRho1pKrdpx5dJSqFetu1CUAuDtR5XHV8T
lrefCVYtvfRsrJPpO/0viZppi30xrViQdz+tEBytVkDQHcuLpEjgLDVZLtpN3yOA
ktgZuxPobwseO6fwP6d90FDAe5kp1q3UfPLrdpTKVH1DDNkJukhaV0xbAG4dGVZb
dZkO8sKkxrFW+aRsA+1KnAdFsWZOOXbVdrGTX5Fi9GqswzX5TijGFIVLuCBF/u7O
5DYbKT35Khn+w1HRgE31o/fedWHCGQXDjgE+mVxq4dQ+lOHvdoYjwtkCkQerir2n
D2ZMEck1pFpOpPHhinQ8
=qK2Z
-----END PGP SIGNATURE-----

--Sig_/Em5I2yM2b0DuaMlnQmDHOeA--
