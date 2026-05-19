Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA4640C5B6;
	Tue, 19 May 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180973; cv=none; b=RhSSYGBIsnD/DnT2PyS7Fme7Y9ARjqpSBctL2G1DKDbld+I7SIGeSmPwlE6BM6RQer0ZLqvRfUQEojbEYFwlA/z/B1mHSgcFQPErotfbYZmITDEZLKhUZ/P9HZMvnzzJ/URbmwDy3sqBL68rx4IYPdWoogv9/rnwE2HZ0l6s3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180973; c=relaxed/simple;
	bh=P+UmcTYbcSVV0JPLpe4CL4MHB3kG6tJG+Yn13uLMrlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHtxv/4fqyIih6pYm1NQAh6iDWqXdeFcakW4uTSzVpln7gRGjYWVau2MX6vN3se3+ddtUw9Vap7nmfXNbW73RPGH1y7c8THv55pZINI38SOjrj1NEjFiI5pyUqQY2JB8QsoKv2lu7YIdPylNJrqP+Tmf/5QqBSU0gEgSXN/baPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af4fc5006ce656747b95889c.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:6ce6:5674:7b95:889c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 771DF1C01AD;
	Tue, 19 May 2026 10:56:05 +0200 (CEST)
Date: Tue, 19 May 2026 10:56:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Joerg Roedel <joerg.roedel@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iommu tree with the arm-soc tree
Message-ID: <agwlifRAn65A2dJC@8bytes.org>
References: <agsOzbfiOszzuUvk@sirena.org.uk>
 <ff150272-c748-48e4-8273-3487278f3d71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff150272-c748-48e4-8273-3487278f3d71@oss.qualcomm.com>

On Mon, May 18, 2026 at 05:17:07PM +0200, Krzysztof Kozlowski wrote:
> >   187029b922d0e ("arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588")
> 
> This patch should rather not be taken by iommu tree.
> 
> Just like DTS this is patch for SoC platform. Joerg, could you drop it?
> It's better if SoC platform maintainer handles the conflicts.

It is now dropped, will push out a new tree later today.

-Joerg
