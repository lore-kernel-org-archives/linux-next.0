Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70373BE643;
	Mon, 17 Aug 2026 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999213; cv=none; b=G0LTEWE3fQ1BOEKrpb86TniIav23jB+SdWy+K4CSTLHIYwVN2lZUyM3o/OMncJ+ckvVTQf1HvkKSuOxAo9KxOitPt/Edp3DdAk02TbC6u8wDOm3OaXeQdNfPp6H6QZkn6EN0lE+WrGrDlr304pR8jHvWx29NZH5bgn/QQIZL7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999213; c=relaxed/simple;
	bh=iNrQ54slKpCf27fXiEq6ovZTE5rJm0vherUrPoZt84w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/Lss1TINReHNI0tzgBoDpXiIL9NM1Gx5eFScW/7VVHDuwT9QRcanXE71AP1Q/pwJmE9eb9BU2f0WbCsU0wVmahBUb7BWYxoxon85ey4XQiC1lvuw2Si5yoZPCnvEeZ8viGBQOtaVIN2orXA3CNYBVcMuK9MaNBLLpyWFgzqeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFSg5Kou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFSg5Kou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B056C1F000E9;
	Mon, 17 Aug 2026 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786999211;
	bh=qysXCZSKRcI5Apaz043BozAlrStyYM9d5YjsDw2pKdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BFSg5KoueaoHjCuNftLO4+6q0TAR1yI4uJAjRSUFOQvYGFE9wlq4oba8HHI7cH/zQ
	 fb1jQ+8sWSsBA5V9s+wOVllnBwCmvcJnmv50MJ6Qu7seAw+7fij4M18GPVMswW+6El
	 tK6L8Gpp4RzsepK6OHb02YcMC+UMsiVHbP3YNbclCV7sj+cdNvet9C0MlLw2i50+49
	 mtVs/9ogjyz2NGm0iC+5vHUsaDBcIxvK5llXs37c3bfFywSQqqKwF/UraRFD8Xsq+B
	 OStBCwl7jyKphLqH5+WQmkYGZbEI8fs70JNHMscUkGf1LOdYLkXEqN5BX3E4iO3Vat
	 a56fxuWGEhaPA==
Message-ID: <e745b636-21eb-44b9-97d2-504f2fdb4030@kernel.org>
Date: Mon, 17 Aug 2026 22:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the driver-core tree with the drm
 tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Zhi Wang <zhiw@nvidia.com>
References: <aoMvVQiSv8uzbOLb@sirena.org.uk>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aoMvVQiSv8uzbOLb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/26 5:57 PM, Mark Brown wrote:
> diff --cc rust/helpers/pci.c
> index 4ebf256dff230,23b06becb4489..0000000000000
> --- a/rust/helpers/pci.c
> +++ b/rust/helpers/pci.c
> @@@ -24,14 -24,11 +24,19 @@@ __rust_helper bool rust_helper_dev_is_p
>   	return dev_is_pci(dev);
>   }
>   
>  +#ifndef CONFIG_PCI_IOV
>  +__rust_helper unsigned int
>  +rust_helper_pci_sriov_get_totalvfs(struct pci_dev *pdev)
>  +{
>  +	return pci_sriov_get_totalvfs(pdev);
>  +}
>  +#endif
>  +
> + __rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev)
> + {
> + 	return pci_irq_type(pdev);
> + }
> + 
>   #ifndef CONFIG_PCI_MSI
>   __rust_helper int rust_helper_pci_alloc_irq_vectors(struct pci_dev *dev,
>   						    unsigned int min_vecs,


Looks good to me, thanks!
