Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2B283FEA;
	Mon, 26 Jan 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443694; cv=none; b=IGXO2IGW7jCPdIzUmmEvmw33GfM6roQc7+wRmsxAXCr16D6scj8myYhyk+E8nYQFuVTG7p4S1bB8E5i65lBTWMl/cL4arGYrN8uvoHKhuyTZ+t44uDwhIeTx0jzum/6SsNLhtlBUvJo3YnVB/rJkXi/4TGuSLAEIrGtlIVocPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443694; c=relaxed/simple;
	bh=qfZll0rizhG+zZ2fPLEbuNTjJdqLOrehIO+SRzebdbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsD2vHKV9pq46iybD3sU6+YVbX/H0JbugHEOaBYjgmN5vrfPVjo/bvpMda8Gf+bYLIWOXdRcwYQnij+Cg50Z6XlcG9VqHfOzV2GLsXWjq4xu4KrtJuTMIkwtxCD7+EBD8j55hNsMuVTcy1aNYne+75iuUUdMdcNQYhU3a2UnFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BY3jXWeH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BY3jXWeH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B089C19425;
	Mon, 26 Jan 2026 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769443694;
	bh=qfZll0rizhG+zZ2fPLEbuNTjJdqLOrehIO+SRzebdbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BY3jXWeH0+RuHXaARdZIySrrQgiq17pLfHc/5es9CauiAwHbpG0JV9rB2ZP1MsBNJ
	 6wqbWNCisj5BchZtpPy0atwXNaNOGMW3PYrRmfyioNOrnoOwWPj+GxNR00b/XyAGlM
	 SUcpf1JWWAJeIhVgKMb3Ipq+KCd+CPi2eHy0FJbFijERx4lDGEVmMVwyiDP7Q+Aznd
	 OmGCAmG5o1EK8e3m7MZmH7yNvFz/jcgTSmH9bIsVTHLgukSK5nFGm7AeO6BSlEWuyl
	 iOGdJARp3CPpDQ6IMrO51R7MzyXAepevyynWZsj3bGJYjlU4Z5zL+WphoexeMmHqLM
	 4D9SP0/ZyEbOg==
Date: Mon, 26 Jan 2026 16:08:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: maz@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <abb2c706-d599-43b5-8277-37d85efe96b5@sirena.org.uk>
References: <aXeEH-iffNS9VIrA@sirena.org.uk>
 <aXeG9FIIP_-hpCHm@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l7JQAMcj22smxuLI"
Content-Disposition: inline
In-Reply-To: <aXeG9FIIP_-hpCHm@willie-the-truck>
X-Cookie: Haste makes waste.


--l7JQAMcj22smxuLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 03:23:32PM +0000, Will Deacon wrote:
> On Mon, Jan 26, 2026 at 03:11:27PM +0000, Mark Brown wrote:

> > [Took the version from Linus' tree.]

> Hmm, I suspect that's not quite right because CONFIG_ARM64_PAN doesn't
> exist anymore in the arm64 tree and so the hunk in
> arch/arm64/kvm/va_layout.c probably needs tweaking.

Indeed - there's updates needed elsewhere.

> Marc -- how would you prefer to handle this? I could bring back
> CONFIG_ARM64_PAN as a hidden Kconfig option =y and then we could clean
> up the stragglers at -rc1?

I guess you could also merge up -rc7 given that this is in Linus' tree?

--l7JQAMcj22smxuLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3kWkACgkQJNaLcl1U
h9AZ+Af/Yb7Hfvf+CNgnMSRmfHbZpLMNp4RuVu7mjVjoqVpjuf3p+uoIuPULXo1w
wIXa4HAubWtIJKaKLnQ+AbDLw7WDj4cLmJ1wVAUpQN868si2hDM3g+w90R0kAoBE
mTxYL0+00yyoBN3gVc7HVyyUkgwemmeq5QLZpdKgAy7+cs6B1j6YE1yfQt5HXdG+
4jDgo3UuNDCqZcwJURYIkDK/O8GG+BMFZKHxgxJxqr0LKlwG2TqaNSm9hJ2MDjR8
JTDvmk7u20EVNHvTs3ndKeUc4nUbAnKPDXLZPLysWXriZThiXkJ/jTKZqnTqvT3C
ng0FB/gt6oZg9PnYDNIdBBc82km76Q==
=pDX6
-----END PGP SIGNATURE-----

--l7JQAMcj22smxuLI--
