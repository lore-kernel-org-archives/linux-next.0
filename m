Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0820435E930;
	Mon,  1 Jun 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318414; cv=none; b=I96L5fcX+8aa+fJC594wR/1+r83jGddyUvR0YewrI/gRH3zw0vKyF/vDKF5RG5Vvvz8NyB2mr/EEPyb87cFup0dEo28qGREDzRdD22Ng3EO475AYq4IngvqS/6YcFzqPF79aLd4nRiV7O1SFhyiNBli6TzQ/0bvJsjuL6tikVps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318414; c=relaxed/simple;
	bh=QfAA3qEK2/fDcPn620xl50zhEpiGDvHcXMUo5uiu5yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePZVBmsADVdNmRRhp5tlG2qByaz9NGeiSls+ldxJtgJUxArWDlhOyfoLeayz8PJmxMe/IR+JMyoakBExkx6Gjj2F+GTgqtlmMTU0jy/iZiNLP2cEbPoNrzcrf0pqupz4FQ5Br9Jp38xPPugCiwc4aQtg3YRgDeiiElviCP2Tu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6g0j9Ys; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6g0j9Ys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4C81F00893;
	Mon,  1 Jun 2026 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318413;
	bh=QfAA3qEK2/fDcPn620xl50zhEpiGDvHcXMUo5uiu5yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6g0j9YsUxu8hZaKbYPeul+0t5qtkBL0CwR4AxJRrcrMpboc1PFoJUaFdliVnQwBJ
	 h7v+1FOdUjcvJuTZ2wXYitO7BqIcY0/b8XPzLjM8BoDNvHMEERpso+Bj87tZjxUx+T
	 p/VnzhE65MIGJgRbsKd+pE/Yz1YymVyLc8Q1vQN1iqBN6ppOqiN1OJf0El30jmAhaf
	 oqrj+bOZ3vy5NT623no6VbNbX1BL89Bx+X7x8mByKwheiZYjIDX7TfIwiaDpARDJ4g
	 XdmpAUXTklamsYhSEgDVHAGJx046yX45G82MCG9rpb5ntfg9iweEYkG976FEk/OIrl
	 BFvgmUGiDkEKQ==
Date: Mon, 1 Jun 2026 13:53:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Message-ID: <7abb1dba-d4b4-4779-b9b1-01ec312aaa84@sirena.org.uk>
References: <ahRHShZFjI8AsT8G@sirena.org.uk>
 <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>
 <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1TXllMujz8I2n3rT"
Content-Disposition: inline
In-Reply-To: <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner>
X-Cookie: Have a nice day!


--1TXllMujz8I2n3rT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 10:30:07AM +0200, Christian Brauner wrote:
> On Mon, May 25, 2026 at 02:08:44PM +0100, Mark Brown wrote:

> > Unsurprisingly the vfs-brauner tree also acquired the same build failure
> > so I also held it back at next-20260522.

> @Miklos, I'm switching this back to jhash() otherwise we have to
> default-select xxhash. See appended patch.

This issue is still present today.

--1TXllMujz8I2n3rT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodgMkACgkQJNaLcl1U
h9BZeQf+L68lOHDbfs30ZoiwVq13aU7YzZJ0PG3L0ojyZapkC9FMk8T6CO3BlQty
ME/GkE2xY30vKxYT5pERzzmBYDlYFF0CyEGdJWnmKu5BVdOQBoWQDOOn+6W10OJe
n4W+o5yDsYsnMcNBPBTJQ66wqwNgr/Mofe2w9vNLusocGCc3iVCpda54yFFbMS7q
Lx6MpeSNWf6NzOUaDhntRs2o1tfOikdhpt/ScnRA2cCMsxKFOzTbSth8JD/aIUCu
bfMNTCy24w5TjmXdND8ITU0NeFPHCnnz8n9Uhlaznh/Ons5EJOQuzUntj8sfUvkv
QraICyixXLL9LVVuTcRh3IRQrPmM5Q==
=vBtE
-----END PGP SIGNATURE-----

--1TXllMujz8I2n3rT--
