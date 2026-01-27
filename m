Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07C2877D4;
	Tue, 27 Jan 2026 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553400; cv=none; b=r0LHmhzlYNsrC09rOTTUBPy23IVb5skawCx6gDrBEPxHqrnm2bVUaUFV9OJvOZVgwUE8w5F7KoVsYk7PG2K8WgK0ChNvHg03ryP/UagdNcTJoqS4jzaCeqkBPmZO7aXCwWCRlzkhIZvhSqz1v+xP3Clf9/9iq7Sq7bVueziLeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553400; c=relaxed/simple;
	bh=ClkrLY+2z1lx59n2Fzln9GcveZZpxSsyB5x1slhAUFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nYjsbce36UqH9Fz4Z78v6/RGluM2o6PFPmBiUzAXxjFyh7l2/R18Xbg/mAtxZfDdq32x6ZGpazDx9JjEDe48yQ8YFD1/+kpQzZIMX3kkK4rMGTaFetpP/KhRAV3OqxKg/UFIi6ZGzuYieogHgxMUb1/St2yyP2X52TzYGsOnj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGP6aEae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGP6aEae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FCFC116C6;
	Tue, 27 Jan 2026 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769553399;
	bh=ClkrLY+2z1lx59n2Fzln9GcveZZpxSsyB5x1slhAUFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JGP6aEaeDRBFpnqImGGGSEQh1zg/6+mokqt3yhPljagbioR8dhp7B8bZrIzM41OHj
	 Al7YqvS2I9mnuUDJnZ7WtjvNB+KMh/ndSAiYrLSWnfwGwaX5x2JN7WgsqFXl+7H69u
	 vk/rbLkJkQEHv6HAhE3Yw482KIlG0EnLa07ALJMxg8x+smV2YKqgGVzhdwTrJnfdfL
	 9BkfqX5sqIj2nWbyFCmYZsi8pCytts0mEqlpXvH37bFz/YEhtG8rFU0BccxB5W18Jx
	 HUXNnkv/vKwByuzpZyDhRe2RZFpPTQsRmc8gJHE8hrJATde8ZvHFasylZCd/GXvob4
	 i8STRX1bXcRLw==
Date: Tue, 27 Jan 2026 16:36:38 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tag could use some work in the pci tree
Message-ID: <20260127223638.GA380682@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f09eaf3c-3df0-4cd3-9feb-b8ce9408f462@sirena.org.uk>

On Tue, Jan 27, 2026 at 11:11:03AM +0000, Mark Brown wrote:
> In commit
> 
>   a21a27a0e8933 ("PCI: Rewrite bridge window head alignment function")
> 
> Fixes tag
> 
>   Fixes: 5d0a8965aea9 ("[PATCH] 2.5.14: New PCI allocation code (alpha, arm, parisc) [2/2]")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist

Thanks, I changed that Fixes: tag to a Link: instead:

  Link: https://git.kernel.org/history/history/c/5d0a8965aea9 ("[PATCH] 2.5.14: New PCI allocation code (alpha, arm, parisc) [2/2]")
