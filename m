Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E518872A;
	Wed,  3 Jun 2026 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449476; cv=none; b=hRteKVOuiakuo6qwdJ/d5Sht7dGEWaehLpt9pAyiOlEu94Rf1LGUeg9K8MG2a1q8K5Jox5IBEgCSI0Kdr6VdOr7ocAx1OKuP7nH7O8ItizhPZfKK2MO2h7sVOgJ7SaYe5Uzl7ogl5SlOZwFeH3x/lbLu9SAQMOmIKYXTMjJcuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449476; c=relaxed/simple;
	bh=rQbTWzdTqB+xoQEjDxyc8mJb+7DQ8WCmktaxOn/jNEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCC1KhwcvG0y7lgNGsevxsk/OF8QLHQv30jzKikpwkB7UCdd/+ZwmPTUc687ByUXnr65hlGKLM5FTj35UGzLpfc/4zCD87iZ2je/vgi4Y/zsl1tS8+SDCObIrwr2UgBlgUA0Zra9C3BIfGXjeBODo/nDgt7eraoLZfJ8ynhDBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/A1a9EJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/A1a9EJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107DA1F00899;
	Wed,  3 Jun 2026 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780449475;
	bh=UstyGYfjjHyD7hDrQRQkEz/Xe4+QrzH5F4jlupesCQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S/A1a9EJwwMWMOEZUJ82IqXUqx7O4tUewgjdNHavOdAZQJ11Ofb/EuZ1kTNVNt8WM
	 wob6oiOBKt20z15xU8rGaJxNbkDK70tTa0dM+bNNM5YvPcquW2NL1uU6p/WZCecCgk
	 1S0KAQklmHV+U0KC2VJSnSeLv3BQmLGQ1oT/ov5n7pa2mKsewsWcF1sDQqcVUTpvpR
	 bLM3FYPaf2EYVOCF/kx0+jIZtXCVZP3spe4dduW2+CDCwbLB2gyjQXGIz0eHkiAaV5
	 VWQY1bdLieJ/5GM/Hc9SmEE3vqsMcvbtxtU2nQGxdplqae1pPG3Z0pF8af44s8gnVA
	 g0eDTUhVKj4nQ==
Date: Tue, 2 Jun 2026 18:17:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the jc_docs tree with the kbuild tree
Message-ID: <20260603011751.GB1940387@ax162>
References: <ah7hUGlwC-lBwDvc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah7hUGlwC-lBwDvc@sirena.org.uk>

On Tue, Jun 02, 2026 at 02:57:36PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/translations/pt_BR/process/changes.rst
> 
> between commit:
> 
>   ce3267a39a92b ("kbuild: Bump minimum version of LLVM for building the kernel to 17.0.1")
> 
> from the kbuild tree and commit:
> 
>   1af866584f7e6 ("docs: pt_BR: update minimal software requirements in changes.rst")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/translations/pt_BR/process/changes.rst
> index 6bbfe60fd9730,a105581dcf64e..0000000000000
> --- a/Documentation/translations/pt_BR/process/changes.rst
> +++ b/Documentation/translations/pt_BR/process/changes.rst
> @@@ -28,12 -29,12 +29,12 @@@ necessárias em todos os sistemas; obvi
>   PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautils.
>   
>   ====================== ===============  ========================================
> -         Programa        Versão mínima       Comando para verificar a versão
> + Programa               Versão mínima    Comando para verificar a versão
>   ====================== ===============  ========================================
>   GNU C                  8.1              gcc --version
>  -Clang/LLVM (optional)  15.0.0           clang --version
>  +Clang/LLVM (optional)  17.0.1           clang --version
> - Rust (optional)        1.78.0           rustc --version
> - bindgen (optional)     0.65.1           bindgen --version
> + Rust (optional)        1.85.0           rustc --version
> + bindgen (optional)     0.71.1           bindgen --version
>   GNU make               4.0              make --version
>   bash                   4.2              bash --version
>   binutils               2.30             ld -v

Thanks, looks good to me. Noted for my 7.2 pull request.

-- 
Cheers,
Nathan
