From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 15:31:02 +1000
Message-ID: <20150520153102.3e70a45c@canb.auug.org.au>
References: <20150520130828.4fdacf54@canb.auug.org.au>
	<alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie>
	<20150520152538.15e7a1cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/okGZxX/bi92BunsLHOsXHKv"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44837 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750984AbbETFbJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 01:31:09 -0400
In-Reply-To: <20150520152538.15e7a1cc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>

--Sig_/okGZxX/bi92BunsLHOsXHKv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 20 May 2015 15:25:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 20 May 2015 05:41:46 +0100 (IST) Dave Airlie <airlied@linux.ie> w=
rote:
> >
> > > After merging the drm tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
> > >=20
> > > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'c=
reate_queue_cpsch':
> > > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:888:2: error: i=
mplicit declaration of function 'init_sdma_vm' [-Werror=3Dimplicit-function=
-declaration]
> > >   init_sdma_vm(dqm, q, qpd);
> > >   ^
> > >=20
> > > Caused by commit 3e3f6e1a90a8 ("drm/amdkfd: make the sdma vm init to =
be
> > > asic specific").
> > >=20
> > > I have used the drm tree from next-20150519 for today.
> >=20
> > Okay this looks like a silent conflict, I'll have to pull Linus tree in=
to
> > drm-next and fix it up there.
>=20
> Yep, against commit 79b066bd76d5 ("drm/amdkfd: Initialize sdma vm when
> creating sdma queue") which is in v4.1-rc3.

So you could, of course, just merge that commit instead of Linus'
tree ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/okGZxX/bi92BunsLHOsXHKv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXBwbAAoJEMDTa8Ir7ZwVsJMP/1B6+RKaZiG5FW5NIqCbloXR
nqLCVqFdaEdibKE+yngjV/ECliO85rKidc4inzRkldVFzJao8gJQn6uRIXrV41XD
DGWb6FflklawqS+i9/S5a9vPmzs8o+htHo8X+P5EMbon8jKa4RdSuNgwHr9EwWjC
X7emOVD6JkT4uINa98nd42QWQR2zEVs7MLZUfNfTxfioqyeGxlZgPLuBkLbe0Svh
Iyvpxj8sZz2h+LWyFRmAbeCUSqfwFlNazdrHNQPzE018X3x1uO3xlS8AzHfq4Lgk
HKsE9XIT2HLfdi+Mbd0ke9Rg4PfxuXjf5fkXPcexEGefW+5jIK2QeBR4snOQ5m0I
zR/XtOz+u8pvCFzbWtiP8qMJitK6Jknq7UJxF+vd/nSM7JvfpgaOy/6SDVnkYe/c
u1TDKnPULAGzS+7D0lK8pshSDfTI2v0qHAap8sdhJKKpY1bmyUBDABNx8J50a4em
X8578+kUWs1p6aixz4Y7cRLVwCh8GFOlnZvlNXdGOcQ7JaecDmJBbAWfe8afymkn
GvBAOLKLD5OdW+tCgihAsgDY8Whn+PUJaUdZ8Sw0pTuMfWMGivP3dXt5o/Mpfdmx
VIZbNHcqgqYzERr7qe2NRn0YB8chBICuUW/W7E04yUP3G7BIrvTm1S1eYb6+NIya
a5DJ+OZw17YgQUCfTkqz
=VA6k
-----END PGP SIGNATURE-----

--Sig_/okGZxX/bi92BunsLHOsXHKv--
