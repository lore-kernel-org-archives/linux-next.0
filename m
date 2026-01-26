Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291946BF;
	Mon, 26 Jan 2026 22:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769467790; cv=none; b=H36U4lQGVgpdJLSI2P0a/HrimAEeVM0baBdDq+CWzrgdgh1+gmpE63//AftSHkISE9xw8WJGzonwg9e8dxhf/O58K59k2vS8NxnfS4ocUT5+Ptu38nvNcUYfF4YxXQaYfsDncVo3/ozoM8JX1YxTCJqRDp6BwjsZ6x1PPpt0c6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769467790; c=relaxed/simple;
	bh=+P/dl16MiFHyS0Gs3dEXR36hN+mrIl42x0I6KdhwJAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK2OIStfOkJ12/yDgEqqLFzuLVgwbAY6U6WB7W1zuKY/0yH6ykRkU0fZsPPyd7ALG+jv00FLu97axQnlHZVlhLWFg4NjHt2gyYswm1O+ltGxlJqEFmbNlDhY8s3VxPUAESO0UcbNvOJV+EOp4ORj/bwgn8X2oIbmtTLsLMYJ0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n49T/2c2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n49T/2c2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C079C116C6;
	Mon, 26 Jan 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769467789;
	bh=+P/dl16MiFHyS0Gs3dEXR36hN+mrIl42x0I6KdhwJAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n49T/2c2UUczHvAfb5chNPnFWGUaMa0bYUWx5ZKuAJNf4IGwWUIa6qVZsLv7HPoz2
	 Yr6wfzTIs3C/WMQUrNrRHfQ+NSyAAxjNowYb6jOwpkYAVnnEliiwJeqPTx5oq8TCAR
	 n6x1XaKghF9TZsHW0tDwXiVzhmK3r2Qbq/bAreMXInGttLYs10LslcqxQJPodUQefT
	 CcGh1xYdohx1m06+6817RxhEoLuK2qeZQ9oSQbBswDZ4orzx7vVTdWm12tDAIw8BZ5
	 g56PyAHMYZafr3gr5D7Y9zX8tNPAFN05HVVp48EWPi0IxWgDYgd6V2Fwk+DZfBVa0o
	 tWYNtcYy8F1DA==
Date: Mon, 26 Jan 2026 22:49:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <a8f3a715-6e24-4f79-8300-d8f89430bebe@sirena.org.uk>
References: <aXeEH-iffNS9VIrA@sirena.org.uk>
 <86ikcobcxw.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hIZWGSJGC0WRepkQ"
Content-Disposition: inline
In-Reply-To: <86ikcobcxw.wl-maz@kernel.org>
X-Cookie: Haste makes waste.


--hIZWGSJGC0WRepkQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 03:39:39PM +0000, Marc Zyngier wrote:

> Keeping the version from Linus' tree doesn't work, as
> kvm_pan_patch_el2_entry() references CONFIG_ARM64_PAN, which is
> removed by 018a231b0260e ("arm64: Unconditionally enable PAN
> support").

I was expecting some fixup to be required in there, yes - at a first
glance the VHE based decisions looked like they'd still want to be made,
though I didn't check in detail.

> So the arm64 version should be the correct one.

I've applied a fixup doing that.

--hIZWGSJGC0WRepkQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml374gACgkQJNaLcl1U
h9D3LAf/Yxv3xVWPx5i9nANNANKSAjM8F6Kov6Hxo+FnS+6fl99yCfbePvEZEzfq
c6+6lNQZMP9xikbKkXn6AQ0HJKfdV0/QwB/Y53730m71KL9maRHVO3Vv92v2aCkc
On2TDjlExLzMTtXiqU3gTZ5cjKtqoWcbKOVdzznHC+lJ3L0TGa3e/FxhVSrXeV1L
J5JWRMR0puRTEk+O5NyAR7lFNpZUr8dmxgo8yubbJSUfUT7St798d4K1m1Xu+ZaV
Y6GXOr5qUFM1pNs/FojGmeCDGwmvCtGEYvehsGJZQVplRhWb00oUlhSuS1/c3oYJ
D8tE7gUBTmg/wcKKCwDT1Kp5VscNhA==
=mlZz
-----END PGP SIGNATURE-----

--hIZWGSJGC0WRepkQ--
