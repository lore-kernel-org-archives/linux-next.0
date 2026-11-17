Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959162;
	b=Z+DvIkFSfVTK1gt4W79y698prDRTuJudtkK1luZGrdQWpQMS88LHH1SSE2oFlJJf4hME
	 4tDmhJW9UsHFDCCX/Q8sAsqfe12ncK6feO4a2OLzJaU8dsJvhyR6HitiIdvpfYdX5BuLS
	 RNImQBb22tjZXZl+uWOU0GR9iyx4V/YHsNB0EN/PDaWugsA60x2gnLIJi2j7oOTJqcFfq
	 K47aldifjNGaJ8lOtq/MiB3zm0M1Cf85u6lVZ1vNI+aboSUSF2kn7qwVen1DE5flOJXf1
	 YrmDBsdcatvEYJ0HFLiZKaeseu34VI8iTZTGrjMsjF9AtUQwIILq7lV4v76ziINQ/RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959162;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=gX7qEVROjUcDmlUzDManhUB1ZqI+VFioq1CeSZUAUJ8=;
	b=Xoo5Hb+WsAZJ5w1U2bmhzA2F26alIBtbJRndDJwlejyafUC9tqSddjXuwN/mHLCxBd5K
	 M46Njn1ZQ9XSD2j+PMbDrORDn6ASPyAsmaFPNZ6kJ2KEllZOOLbtTv4W5gUPxsBH+ZnfA
	 o4bl4khd75UXNJkM+kw6XxOxQQlqdtVU2tvsY/8t21MNIwgWcVHah3Xb3Hj61lWO/SsqU
	 kTHlvCh0gnbg2Qz2H4MWUSyj3HU+0e9rfqjPeAAQDlNQjN+ON5t+/+9949NB1VsxBF3St
	 bB79M80loeEmTZcZBLhaZi1HKngntUyLtyZ2s4VDIF7JggXIjH/7YfQp2klfLm58feQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMnG1P5X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FBA606A32A;
	Tue, 17 Nov 2026 23:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMnG1P5X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3541F000C4;
	Tue, 17 Nov 2026 23:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959161;
	bh=gX7qEVROjUcDmlUzDManhUB1ZqI+VFioq1CeSZUAUJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMnG1P5XIFBivddYb3j/6mQWPxom7F0oKdlem301UNolyvgjCO5F2PkVSbjzW/ZB1
	 K8kUX8mS1GREi0jR09K4kcLFcd/OF8gAU96BG23GJsQKggEEAx/YhghOo5SOhVQKA9
	 92bxxj9S4eGKF2mn5eS1CJmFWYnq9t6UZbCbVYieYyHhPptMXlDf7iUKt32J0awaa+
	 4I1642cgF5GT5ZOuIDB2MuwP8GL683tuvJJ3SQe/0H5eJzB+Y8W6oVWSKJppFhqT8X
	 1jb57hZRaafiegzxLcDD/mVM2hUGrRVUlARNmQLQFDMBp/lhfwS5p0OscsWOngN4Yk
	 tUD4lnYIvOm6w==
Date: Tue, 17 Nov 2026 23:45:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Youling Tang <tangyouling@kylinos.cn>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat
 tree
Message-ID: <2d5bddc9-88ea-44b0-b3c0-6e0ca232e02e@sirena.org.uk>
References: <avxQNpa-V0yefH6d@sirena.org.uk>
 <20261117-unfreiwillig-flohen-detonieren-3a5a97837345@brauner>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+7RQjXaNbBWaBcje"
Content-Disposition: inline
In-Reply-To: <20261117-unfreiwillig-flohen-detonieren-3a5a97837345@brauner>
X-Cookie: Marriage, n.:


--+7RQjXaNbBWaBcje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 02:45:46PM +0100, Christian Brauner wrote:
> On Tue, Nov 17, 2026 at 01:01:42PM +0000, Mark Brown wrote:
> > from the vfs-brauner tree.  A bit unsure about this one, the actual
> > conflict is exfat_writepages().
>=20
> Thanks for fixing this up. Dropping the check from exfat_writepages() is
> right. There's a small fixup needed on top of your resolution:

I'll add that, thanks - it's applied as a final commit today.

--+7RQjXaNbBWaBcje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr85zUACgkQJNaLcl1U
h9AMPwf+OHVbDaSMM9vn2q3CJFyeU1wpChXH2p9mjVYN79lmzWG0eaC4SchM9rGG
R7PV5deNjtmW8FIopL1YFWE/XXEHBdMex2Y2gcSpxIYWnGitoayRk7uKNIiVve2v
VpvcZUyZADDfIopsM7hiLkEIVZAiEq2y+VRSzDD1tE1iSPOl2a05JQOb7c61XlX9
HsUJxGVxqDj5sRKXfAbpHXmWLlQzTYUpmL9IAOk23fkK0i7c6nBVyJIRrnwHEZIj
n7/HiKvwGUuAg0xysX8lIvagPJQZGjCOvbdzFvFMRT0Je7toVcSK3FyZl9kMNkz/
yK0Y8F6gN9hoVHl6QL72g7KFtb+8Dg==
=5Nh9
-----END PGP SIGNATURE-----

--+7RQjXaNbBWaBcje--
