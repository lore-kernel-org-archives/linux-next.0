Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896B38DF9;
	Mon, 26 Jan 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441018; cv=none; b=ghcmEuybuqg+PvF9qdJ8IGZSWxKhFmjRlSJPvEQYq5Vpx3/g9sNd//z2gH8QWO3+40xn0Ikylf7LMes8M4GvgAO6UobACsB8YqOLusoKF5Dgh5AspSbwUa5yCvFZbF1+wQMUVuLsCxS2gsB+yJUrRKCeLpDrBpsKdCUe/ctVvug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441018; c=relaxed/simple;
	bh=JMy4MT5jEMoG+ecywv179W5xYmGUpiWznA14EjEQTO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMbVf9CurOsfhBoRVdcMLWfmZA6MCmcNvKL6rBCvCkIMpabuOuvbxXfeeSckS2p6w51BmEPCFZDyx/alqxlgUS0bhf6rLdOpbSl3FdMlh2X0FWGjwcZKNpbtxTd+vxqoBHMrPl3EP3Hx9jRPkNPe4bY6Lg1IvN6U8/SGOnj95ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDXt6nL+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDXt6nL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAD0C116C6;
	Mon, 26 Jan 2026 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769441017;
	bh=JMy4MT5jEMoG+ecywv179W5xYmGUpiWznA14EjEQTO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDXt6nL+k0fnFUWVcwGtZUBfsspGzdO1nINC3Th2VS3DdFQuHV1LxrQk6bP7lNJvT
	 tYTcWZiD/Iea5BMdAeZi507UEbTGvmDPvG/GaBiCL8W+dqFjvU3J9DZd4f5hqrfYGx
	 WvNqXk4t506KTQNiE5RrbhXM7hdOlOEEViBYaJJejuqukOrtEcUGW8Q9izKeYVwNvu
	 hoNT/QqoHLsJJN4XdmhsGLDNZ3vXW1epGpRUJnLPhCpb5Z9Bh2DoSNOAxR4W9wwbHp
	 LuTzIkXMN5Ux5GzM693Ljn+gEw8eG8KV4m480lRHbH6+HQzIm/Lg0+WihoTSj+zNke
	 ewwkLrzzGNlIg==
Date: Mon, 26 Jan 2026 15:23:32 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>, maz@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <aXeG9FIIP_-hpCHm@willie-the-truck>
References: <aXeEH-iffNS9VIrA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeEH-iffNS9VIrA@sirena.org.uk>

On Mon, Jan 26, 2026 at 03:11:27PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/kvm/hyp/entry.S
> 
> between commit:
> 
>   86364832ba6f2 ("KVM: arm64: Don't blindly set set PSTATE.PAN on guest exit")
> 
> from the origin tree and commit:
> 
>   018a231b0260e ("arm64: Unconditionally enable PAN support")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> [Took the version from Linus' tree.]

Hmm, I suspect that's not quite right because CONFIG_ARM64_PAN doesn't
exist anymore in the arm64 tree and so the hunk in
arch/arm64/kvm/va_layout.c probably needs tweaking.

Marc -- how would you prefer to handle this? I could bring back
CONFIG_ARM64_PAN as a hidden Kconfig option =y and then we could clean
up the stragglers at -rc1?

Will
