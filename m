From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request inclusion of HYP mode cpu_resume fix into linux-next
Date: Wed, 28 May 2014 08:45:23 +1000
Message-ID: <20140528084523.534449a9@canb.auug.org.au>
References: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
	<20140527102732.GA18476@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_O3tIwdHifowyLXq_qwpI1X"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45151 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751344AbaE0Wp3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2014 18:45:29 -0400
In-Reply-To: <20140527102732.GA18476@e102568-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christoffer Dall <christoffer.dall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@arm.linux.org.uk>

--Sig_/_O3tIwdHifowyLXq_qwpI1X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Tue, 27 May 2014 11:27:32 +0100 Lorenzo Pieralisi <lorenzo.pieralisi@arm=
.com> wrote:
>
> On Thu, Mar 06, 2014 at 06:43:03PM +0000, Lorenzo Pieralisi wrote:
> > Hi Stephen,
> >=20
> > can I ask you please to include the following branch into linux-next:
> >=20
> > git://linux-arm.org/linux-2.6-lp.git arm-kvm-cpuresume
> >=20
> > It contains a patch touching ARM PM core code that requires wider testi=
ng
> > coverage before I request a pull. It has been already publicly posted,
> > reviewed and tested.
>=20
> Patch now queued for mainline, please drop the branch from -next, it
> will reappear soon through the ARM tree.

Removed from today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_O3tIwdHifowyLXq_qwpI1X
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJThRWHAAoJEMDTa8Ir7ZwVFGEQAItutW25Gzl4qGVZZf14em6Y
eaTIsTkzuNOorEon+GYKIup3Caxm9DISpq6gFSwQ60/bNZGxxuLNjvVQVxYo7sQa
tzUe7fVb31Ki39NCzmDZfpn7mG03qQHHPFHNQCIlaITW3a3je6hBkBbpS1XrXKrO
wgteV0e1CrkRs4fai62g2BjG+NzB42+oQdSSXlYzK6xmggjW+JvAIqLF7JXVTjuY
95Sy0ZhHQz8cR8WrwCDDCOzP8yAPuPLnXEqXHdCf0cJxiKK/zN0wrU7cN4vdrgcq
OIJlzmbDMzHdewtvo1yEdh6xpMdTNqbsp18WO/u3Kfho6igLXjXP0BANAH18BFs/
kHSIW2/rPjN7tISv/nfthctetm01yptHrCMrzkmaapvzfD9c9JEvrYfiFQUqc4MM
fc2kGw+s2ly/o7/1KnMESKGxeMgootmLV20ixrxifOPcirv60UX981kPWfW2pAcr
pvwPbn6mThzsdZQR98iVXYJCaeTXjW+8KiWaFFosEZTqc6dxtVCfVyel17OgQxE5
8IzYXjovhpNWpGDgeKaOAy+R8tiGq87XymhnMh/bZGhTxE02AgFKO10bobtn9Pa0
GlyT80NGDpjbWBRXlgGWoLwBm20UMn2U8KOXmMMSohdzFjqlL3U43/DGoxg1i2k1
0fjhhcLo2EaQ39Qdmo7w
=zaqp
-----END PGP SIGNATURE-----

--Sig_/_O3tIwdHifowyLXq_qwpI1X--
