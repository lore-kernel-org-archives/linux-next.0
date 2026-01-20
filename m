Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244833D1CB2;
	Tue, 20 Jan 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900640; cv=none; b=MerCqwlPAF9pjPaoBsx9su9giHmQ2ADOPwlD5ebzCF+RAgE+UapZsHKXzoxcWznEHxYI36sfpHZbfHAVjxt5dwAEW4hHOZPPFdUkO54Cawk0Klluz9UqHjbtapD8IEU/J/JG0UngxYlICTvlHddRu+xaWi8PMqmm2yUb5CqVWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900640; c=relaxed/simple;
	bh=vRxuprFP8c2kAQEsiX+enuhxLXG2Zl+9CmuhzF7e1+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sq7zEuxBI0hesUaOuVrlGaKik5avOGfwGiFXTBu3mXv7uPmA4PxebQI3URapGRFgdy98gx5oxuM9SOjwbHrCOPWPMNRCaFDcxVuaJ5FLjT3sWgv0W8kQ1OxE74Sqnf+OeNlHyagoh28IqmvQsFpvDg0Beg0d23iTFEcGllvkRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=U/MVFS0y; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="U/MVFS0y"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2EB9C5E2F3;
	Tue, 20 Jan 2026 10:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768900638;
	bh=vRxuprFP8c2kAQEsiX+enuhxLXG2Zl+9CmuhzF7e1+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/MVFS0yA3aaVnYbph0lDGKqV1AMAB2N+BfGe47aGDg+GV0uaVBJVma0Zx3izmqfy
	 dd3oRBTwhH5z7jlam1kSwaqgzk255BdlKiQ6BZCY2iH/6keWhwQiC3sMep47VIYDkb
	 hlarkDcKrlm0NHLBn+SO1t9VS7kiXbjtHbxvv37rbAWjjABFkfN4G/Lr3QyLj/ntkc
	 SFMo2+OC80aLMlEBS4ffkBCpXjrfKuuil/0Hxh9KWeO8B8Hp1NU8yjR3mfV2TziIRO
	 b5FoDrZxRN0F5RdlgzTy9ijg3D2SNbrxOdF0M/mgDqEJSzBH8Ib8ApgXO+4y5NBNal
	 YX2QAvLHg27VQ==
Date: Tue, 20 Jan 2026 10:17:17 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Mark Brown <broonie@kernel.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Message-ID: <ygpnlw2tudyj3gg7n4nikbgitg7tfdtprksah3hjxw2st3u5tm@ahngikjvsawu>
References: <aW57LhM6g2KnrV_w@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW57LhM6g2KnrV_w@sirena.org.uk>

On Mon, Jan 19, 2026 at 06:42:54PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the iommu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/iommu/amd/iommufd.c: In function 'amd_iommufd_viommu_destroy':
> /tmp/next/build/drivers/iommu/amd/iommufd.c:62:27: error: unused variable 'iommu' [-Werror=unused-variable]
>    62 |         struct amd_iommu *iommu = container_of(viommu->iommu_dev, struct amd_iommu, iommu);
>       |                           ^~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>    757d2b1fdf5b7 (iommu/amd: Introduce gDomID-to-hDomID Mapping and handle parent domain invalidation)
> 
> I used the version from 20260116 instead.

Thanks Mark, a fix has been merged.
