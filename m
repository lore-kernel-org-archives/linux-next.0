Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5E42AFB2;
	Tue,  4 Aug 2026 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830059; cv=none; b=q4zk8L4cgDVKGSKWg8OnIKjDetsQIQUMk6nBtM8sjZj2KgZGV3ymt0revGkhXFjwirHLGfNawDCqhWkMV+a+1gfDaM3t3HZfDMO3SRKO7vE96fy/b5ajptuY5hKo/1OhwkNDtKFdag0i3l7PTAbhASrXRKZK4ftv8CbvFL3j0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830059; c=relaxed/simple;
	bh=fXKYIxu9fpPFG40i9Z7Q5GCojILroEmR1dCdl8c5WUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtbehjtMaQXnqJbtTuuMTojHdnp3RMe232n5U/04GAtxIJRX1h2o2kiGaOcs4mbSDSGbhbVZMskJp0R8dpbDFvURgno/xwDZXTG+4zgh+6ha5iE+HawxFdS+61a5mScKIICJRy70d4CzE7cBHLlyigtpSi0XEm9uN734F8ri31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZiatGVv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZiatGVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957FC1F000E9;
	Tue,  4 Aug 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830050;
	bh=AIcnRWDW6/ZJlDvh5c8MaxaT736mT4eMT2UuJ35krhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZiatGVv6OxNoIurxAMTShT/S2fI7AkNn/YVQJqgTGWZ5/bbvPtoq0P57JR21wiNL
	 f68R+5ic5E6GO70HLp9l1RdZysoT9Oew2PFFFGdMFBIUUFEP5rkamjo+2XbY7F/xow
	 oJ+3pHDYbE93g0RS3QBWCYIcopDa5e4LDGR9N4Fw69KMGBjg8ETjU+nqFCpq9du9kO
	 eDwMUgjcrxdfuKggbsNwHjGVZd5PBqfEdGilObhLynrEf/J09EncV991YJjz4zJ66k
	 wjyC3nCOpji4v7ko7VMcXA5O4s2IomAHzor/ntHJGquBoLJ/p/snHN41jDmypqOtvz
	 NKsmEdvtkAKEA==
Date: Tue, 4 Aug 2026 09:54:04 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <kees@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
 <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
 <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqsolpvqv3zhyveu"
Content-Disposition: inline
In-Reply-To: <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>


--iqsolpvqv3zhyveu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 09:36:38AM +0200, Joel Granados wrote:
> On Tue, Jul 28, 2026 at 01:47:55PM -0700, Andrew Morton wrote:
> > On Tue, 28 Jul 2026 18:39:51 +0100 Mark Brown <broonie@kernel.org> wrot=
e:
> >=20
> > > Today's linux-next merge of the sysctl tree got a conflict in:
> > >=20
> > >   kernel/time/jiffies.c
> > >=20
> > > between commit:
> > >=20
> > >   842912dea6d51 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors =
CONFIG_SYSCTL")
> > >=20
> > > from the mm-nonmm-unstable tree and commit:
> > >=20
> > >   a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_=
proc_dotypevec macro")
> > >=20
> > > from the sysctl tree.
> >=20
> > Luis, can you please grab both
> I can put these into sysctl next if needed. Do you still need both of
> them to be there?
>=20
> >=20
> > 	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table=
[]
> > 	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com
> I do **not** see this one in next-20260803. I'll just add this to the
> sysctl-next.

This one might cause another conflict in linux next. To solve it just
replace CONFIG_PROC_SYSCTL with CONFIG_SYSCTL.

>=20
> >=20
> > and
> >=20
> > 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> > 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
> I see that this one is already in next-20260803. probably went in
> through mm tree.
>=20
>   23a24c8a95c5 sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_=
SYSCTL  [Oleg Nesterov]

To avoid further conflicts in next I can also take this one into
sysctl-next and handle every thing in my PR to Linus.

Let me know what you decide.

Best

--=20

Joel Granados

--iqsolpvqv3zhyveu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmpxmpwACgkQupfNUreW
QU+zVwv+JPXu4te3+470yr1dGjccS+D9sdqsjYSQxRb2SfE8e1TrTpnDQBAGBgHg
JRrurCBWTWMuOEbwM8lpJP9sf2rNPGGmC3sQDkn9GXLuCj6GfPUrJImhsbPfBIym
AssumjBOeDw8V3jwEoEEgSaz/YVlvxwZN8seCf7aBtvor8GluurmpQhDbTUf0KQV
nUqNc4mLYbsLAJQV9zn9+mPf0p/0BMvWAqCK2AH8n4NFB2Ce3EjKM2dmeBrQnspi
ckwOd8x6UpTdElH7AdQpy576kPvXWfLHq7QBa8dAFy9TLdIi2KS91jmFzWUcLF2e
/MRzgBrrEr+iP/xcJmePxeVNSEtxWEPnEvlVmDj7G4njjf1FOO0DUAPQ6aeFjyUr
q5nnLoDQBc+FjtLluJAVRfqwK7MvSoWIZ2lGWp3nu2d6B8aoPgXSIyHWN0kq6a97
x+Tt1cVjMYqRHYtbhwS0wFrpgN2hQD7zAmlfhJRUMNrOR8UViAfMiCWxT9O9XH5z
dOPpBxlo
=8as0
-----END PGP SIGNATURE-----

--iqsolpvqv3zhyveu--
