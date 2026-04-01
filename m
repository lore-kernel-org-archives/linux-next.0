Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9378CC2FD;
	Wed,  1 Apr 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041266; cv=none; b=mZdSUtN4yjFcVvzfAmezZHDZ3tIzsxwWbdp9VLm7aNSPG3ujNLKOfhxcLVfJ63PHRvlOKecwDd7r41GfSH9zFZsHpb7AtUZQ5WviQ5k7N0nmsRpLfCJZ1gBJtfXPQ6AjbZijDMszbB9l6koGvfh151Y7RCr7PfJDt3LByQobo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041266; c=relaxed/simple;
	bh=0CDOI2eJCoNEnbrA0KkK7IgYz3OYddwXFGRDwAvNIq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNirO3K0mLJXd0PW7ZoXH7vR8FM6nfLFS8lgD017XjgSeJ+o1/tdP0JZI+HC/TxRBqm1IBNWYUblblEBPh0b4d2BrjZY7UgAsR8WOuHZWc3eKSyBU/js+rFLam/bc3Aq+LzqJ5xBPhlwZByxJ1VpKlt3z80GfOl1Gipp7z8yh5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RqXk2gRv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RqXk2gRv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9771692;
	Wed,  1 Apr 2026 04:00:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D63A63F915;
	Wed,  1 Apr 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775041265; bh=0CDOI2eJCoNEnbrA0KkK7IgYz3OYddwXFGRDwAvNIq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqXk2gRvHzPhXCFfzL+5VvuZAH/pEtHdAVcJGM5ZjhTzl+ukkuoKD+FUZzOZZZPlY
	 /G5Z74iz2WW9WCH5+XZfiILLVTxVcVfhTdVDVG6T7U+dcGtKmXEn1aeqZSCD8a+ZbR
	 bU1Pnmj0BHDUxKodujYt3fwdvlrxL5QBJf/7C3hk=
Date: Wed, 1 Apr 2026 12:01:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: Re: linux-next: manual merge of the arm64 tree with the kvm-arm tree
Message-ID: <acz67AZyiMZHyPKr@arm.com>
References: <acbQKqGV50jNaDBU@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbQKqGV50jNaDBU@sirena.co.uk>

On Fri, Mar 27, 2026 at 06:44:58PM +0000, Mark Brown wrote:
> diff --cc arch/arm64/kvm/at.c
> index a024d9a770dc74,1adf88a5732840..00000000000000
> --- a/arch/arm64/kvm/at.c
> +++ b/arch/arm64/kvm/at.c
> @@@ -1753,8 -1785,10 +1783,10 @@@ int __kvm_at_swap_desc(struct kvm *kvm
>   	if (!writable)
>   		return -EPERM;
>   
>  -	ptep = (u64 __user *)hva + offset;
>  +	ptep = (void __user *)hva + offset;
> - 	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
> + 	if (cpus_have_final_cap(ARM64_HAS_LSUI))
> + 		r = __lsui_swap_desc(ptep, old, new);
> + 	else if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
>   		r = __lse_swap_desc(ptep, old, new);
>   	else
>   		r = __llsc_swap_desc(ptep, old, new);

It looks fine. Thanks Mark.

-- 
Catalin
