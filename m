From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: status of the memblock tree
Date: Thu, 29 Aug 2013 10:37:32 +1000
Message-ID: <20130829103732.426fdfdeb3da0c3c209f132c@canb.auug.org.au>
References: <20130828163459.3eb7fc0d7ae531494f605831@canb.auug.org.au>
	<20130828122809.GC18348@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__29_Aug_2013_10_37_32_+1000_5HBviv_+ojst.wfV"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:35856 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab3H2Aho (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2013 20:37:44 -0400
In-Reply-To: <20130828122809.GC18348@mtj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__29_Aug_2013_10_37_32_+1000_5HBviv_+ojst.wfV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Wed, 28 Aug 2013 08:28:09 -0400 Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Aug 28, 2013 at 04:34:59PM +1000, Stephen Rothwell wrote:
> > I was wondering if the memblock tree needs to exist any more.  The last
> > commit to it was in December 2011 and was merged into Linus' tree during
> > the v3.3 merge window.
>=20
> After the rewrite was complete, the tree was never used.  I think it
> can be put to rest now.  Ingo is routing all memblock changes now.

I have removed it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Aug_2013_10_37_32_+1000_5HBviv_+ojst.wfV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSHpfRAAoJEECxmPOUX5FE62wQAKTozp+fUod8RvV+3AubaDjo
5OsyeD7mwV2Z0MMrA6DQc2MPPsGB0ZNMqMhqO6cNt4rroi4r/FZXGiRVZjF4AKwr
TH3I5zCVxa2E/dtia6BxXU28fmro8fJnm71BGXlIm7BQLoGAsaHR70fvWuLIsg8R
Us/3UFjum4m5pCZqzRYEDtnCgJKHepBAexoYXHmJmH4skoHlKvEipbahTzUE8M/V
SsPnB63Mxir/MB9Gxs43tsT64QJ1geW7dyKwRUOR670/b3P63C7wy/zzxRCLQXq7
Evqo0b2VL+i24kmbTsFPdLJ5PX1Wj5QPiRQ30/KHw5YqPI2rhDs4/aB8W1tJYxft
DnkopaY4YY7g66bQgW0O0r5M+O71o1zRUWRfPHNg2XXRcem8rHXdaBKSt5VeDYTR
Ma/AbEeW0WJ47sQ1mBkjCUVV3JdXn6QfBUq51tHZLHSw7tuxsNrwwZ+t0uL2V/2O
oyiKGLCClgvMYAWItwS/QyiDPCb/FUHu8UAOsxb48Sv7BLck8LTzpgOV1iHnZX9d
giNId7sE6tZmr2uKagOD2vOGQYbshxlo7bd9Y/m/ZKEJhxjXGeI17yRGD+JRrtVx
vmKHsFIgPrEbxVj2bi0H6b4VSJ820csCKW6TJf4D3XbqqV+5N11sVYhTnXGUpUkg
o4xtBX3R7eLBeZPArJt9
=IW8B
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Aug_2013_10_37_32_+1000_5HBviv_+ojst.wfV--
