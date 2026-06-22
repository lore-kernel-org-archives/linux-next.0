Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285C379C23;
	Mon, 22 Jun 2026 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125691; cv=none; b=g6FQmVYiJVI202TUjZF3uY56kdMUkwW2TvBq7B+xBtNuXhWmUrE98o3ITaiyhleLtwsz/Pyg9qY12/KqNbmPTKvdwVmsbDkysKjt9aOEXVpg5ZIFMJlZ+nhu1IA3cW9RbZRV6VBAViL6UfDgc7OfCt9oFKblGD2X8U8IOv2GFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125691; c=relaxed/simple;
	bh=EZ2P/HT1do2Hi2AjNByNKW2Hv4p+jmwPM4Cm8eUmG+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL1lDtZjT+tz6LGuIMl8RNG7hBbzbWk19J8Fvl45m7KwiBikV0/H6r3rQW3TNr0mIUOs7XzaaX5Cq4tu02TVp6BNZKh1yXJhoZ0IOuDubTf7Cl/6gTTye1/s4nwpudRtBBCxSO8zzN0nLbZXeZm2Jvn1WRb4CUXnE3cwSacwg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRBIKotD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRBIKotD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015221F000E9;
	Mon, 22 Jun 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125690;
	bh=jY1alwjFSviYTzBWxaX6EH2GA2X4myt1Nd9wZdOUzqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRBIKotD6w5OethsDLhIhSM5OsMd5hR0GcQ1GFpF1104IwgcXUpNDZ69Qi6hwTA8C
	 lRtrBXM9GtCX/R76u5yr1CA8daU2QLoOCkLk1oeqOptGxBB8uMRHIx0E+r/TdH9sBp
	 MHs/yfsx3m7UujKlZJ0rerAxWlEFMts1EJpEM2JvbvXsA8itEUmZ1/q/HSw14gpcEX
	 ZO1WmJhxxH5QORDqda11fDCtxvIabdTdi8KSi0yNLo/tytOE8fXM1Hsx73fruP7ASI
	 xqKa3VnzHi4NVK+BH9PZWW+fosziksWHL3LlOS68xVsD1RfgHQnis0bK6IV2lLcLJd
	 5IQZRlnNM4sZA==
Date: Mon, 22 Jun 2026 11:54:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <8e90035c-d8f5-4efc-b20a-87b1695ec97f@sirena.org.uk>
References: <ajK3E_9sm1up6soi@sirena.org.uk>
 <61b096e6-39d1-4b61-80ee-31bda9978e86@sirena.org.uk>
 <14b1b663-56fc-4272-83a1-9fee21a9d098@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZTW7lGRuTOaCOnZU"
Content-Disposition: inline
In-Reply-To: <14b1b663-56fc-4272-83a1-9fee21a9d098@oracle.com>
X-Cookie: Now I am depressed ...


--ZTW7lGRuTOaCOnZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2026 at 11:37:10AM +0100, Alan Maguire wrote:

> thanks for catching this; I sent [1] which should resolve the failure.

Thanks, I also sent

  https://lore.kernel.org/r/20260617130038.34534-1-broonie@kernel.org

Arnaldo said he'd applied it but it's not in Linus' tree yet.

--ZTW7lGRuTOaCOnZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5FHUACgkQJNaLcl1U
h9A/Cgf/aPO0kDSpuYuHksPHhEbK9HyU6Es2rOLI0NpSWAd40xnhB+9+3OjoP+wj
qYXJYlnIK+GoLT00Dex1RZEbpyICaRqWodDCXTq8z6m7Zu7ljvNd54YwBZvxHLEj
uwgB0UnSUiqcbTlPp6SSvrKAjmc6TapxxeRN7QFj2Wp0Wc7Gr/wXcNJex1WPOvS5
3hYHtR4q2vmxsEa3DINdoNLl+qIOwHM/eBuZgAhu6QIseBCmiQ/bOCDTl8WuKlgE
ihoTmk5OEWQ80CKngnjpuR5Tmv5RinTqAgGV3UiP5TOTYkn4un/UiiXXHs1LJVvO
izS3leQ03G9pZgIcBiEjQIepRc4LYA==
=mCh8
-----END PGP SIGNATURE-----

--ZTW7lGRuTOaCOnZU--
