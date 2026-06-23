Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893F3D3008;
	Tue, 23 Jun 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213144; cv=none; b=MY2b+4CpqoagT0y0f8dHNOTrgR2VJj88P4HDvI8j/KjtU2jdnRHwSxFc2EWOtIvWiw1eyLlpTABgCq4TJ0ElZDD1JfEIILMO8dN58Un40K8/RGk8hb9hqVFI5uVschVicefh59Dhz09hDEdr46EN6sD4Uow7kUseI0QeiQQGMKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213144; c=relaxed/simple;
	bh=rNUGiOOeiokbILt8n397ZJ0NdAO4mDgY0bpAeEY3Cjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSvPE1LfcJdnkG1tnvkrSK0Z9yqUP82m0Brl0m+HcTDKHOrd7TjoH/2+HFo55fBMQN/eonqwJ04SDH4eGaKhhbXXMTi9UVEfTcjVj47Gh7bJljkvB5qA3iN6wmzv8CGbOBhSdPaPfsKjRwXU1o4pAISj0qYdBZ9eKVj/+6/Svpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKfjTZ/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKfjTZ/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9C91F000E9;
	Tue, 23 Jun 2026 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782213143;
	bh=IpE5hTQ3756y+L8/mqvOZ5Bbf5fNtlWgFgr/zGaWsQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKfjTZ/V6fU9lop3TKoyL0/DtYyOTKylJ4DiOm9N0gl4fG/tWB+X9LgqRvT7JArDD
	 0rBMq/p/VTvMpqd2+Vh4vzunuPgo+lWeJhHrmhDYw0o/4yr2x64plLMA7/nR/bwj50
	 Lwsh5EnUdF3ENw/lzdivJ+4GJI0i0wBzEE/rH4zP/PQTvFdu59OPQGTxRilfYhZAXY
	 t8vsYj6zJ8uLuDYd/3DTC0X2vTb2Rfc+gPghCLN8O90adXFcrMSxbUOmCL9bfxWqmv
	 Gs4dvmvSSbqATBjOcBG7BmLgcmEpXutlkbbuhsDGXE/oFHbj++2hDeu6EOcVI/PdBS
	 mhjPxmaQZqq8A==
Date: Tue, 23 Jun 2026 12:12:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: for next: ukleinek/linux.git:device-id-rework [Was: Re: [PATCH]
 mod_devicetable.h: Split into per subsystem headers]
Message-ID: <9a3344eb-cc9a-41fb-8c2a-15b60b214b66@sirena.org.uk>
References: <20260622210733.1743063-2-u.kleine-koenig@baylibre.com>
 <CAHk-=wgYL0xJ=RaT+t1FR6Cw8E+VZkRKZjhw5h7m3FAqqNU8Hg@mail.gmail.com>
 <ajondrElYavnW6Am@monoceros>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7QPlfeQ+xQJZ26b2"
Content-Disposition: inline
In-Reply-To: <ajondrElYavnW6Am@monoceros>
X-Cookie: To love is good, love being difficult.


--7QPlfeQ+xQJZ26b2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 08:40:30AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:

> I applied this patch on top of Linus's tree and pushed it to
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git devic=
e-id-rework

> . It's on top of a "random" development state, but the next older tagged
> tree (i.e. 7.1) doesn't contain 39d260d6bc7a ("firewire: Simplify
> storing pointers in device id struct") which modifies mod_devicetable.h.

> Mark, can you please add the above branch to next, to give it some
> exposure to build bots? I don't know the timing yet, but I'd like to get
> this in before the next merge window, ideally around 7.2-rc1, depending
> on how complicated and intrusive the follow up reworks are.

I have pulled that in at the end of the merge so we'll see how that
goes, though I do note Linus' comment about it being something that
might be a better fit for a script he can run.

--7QPlfeQ+xQJZ26b2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo6agwACgkQJNaLcl1U
h9DYxQf/bVcNLlrrNMtR7A+PqChACNPI1TQOY/mSZWOnKXKVLPWtHxhLWs6LIb5i
KdrjC0Fa1M6nuW7WhrHKvLczEj+18ReySYGDazm1lVmtmysUlXoqNbLTHX2EaJS1
EAnh2VVTDfZBonM52nEUBH0EvVrrBtEJ61Iv4yHQdJEHhACQkgz+3GkoWc64+MZb
O2QOXuhx3fniZeI4y7zQedei6tsN4DHgBphUFuodDYyVTI4FveJVScRfG7oCN2av
JtU9NPJH6erbGRep2MQ07/eSP1DWripbeloVdED/JFtY5Htl+IGwcnVQo1xcDm9V
WDebJq5rvhYABg8Xv4Wrd4kw+1Hg4A==
=rsE+
-----END PGP SIGNATURE-----

--7QPlfeQ+xQJZ26b2--
