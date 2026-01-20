Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264844CF46;
	Tue, 20 Jan 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919985; cv=none; b=kc0i5U2sgEhv4rh/6o0CaVY/y9QLRbOO5869UQYBHLuHf5tE2Ty4QaXun1Lg1JvbRQl9G9oDIYcC0b6THM+MgEa4fozO77FZ/masu2tYf59DmauKh7CZZNoz6f0+bTvM5Eh1+JgezC8/Uuu2niRTrI3d/MiwRd/S3BndFelmbek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919985; c=relaxed/simple;
	bh=kFWwgq5jNrzw3UhJZmYCyWsHWOq13iBHrimqft1Hwoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bso+roP0CI+VOr3457honqBGcyUsn9kzMoqSLVuUT5dza9GMV1SFFEOXq16J1pfC0sd3y8/crygv0f/UzJ6QwUydbOujMgdLBTv3wo7//EWB//IDVwW17nT2OqJ3PvpSmefWSezTgJO6zDO3Gfx5N/UcDKFm2Ycck0tTywoQyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1F303341E5B;
	Tue, 20 Jan 2026 14:39:41 +0000 (UTC)
Date: Tue, 20 Jan 2026 22:39:36 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the spacemit tree
Message-ID: <20260120143936-GYA59644@gentoo.org>
References: <aW-Ke8K6pKGrIp-N@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-Ke8K6pKGrIp-N@sirena.org.uk>

Hi Mark,

On 14:00 Tue 20 Jan     , Mark Brown wrote:
> Commit
> 
>   91c444d4285c0 ("riscv: dts: spacemit: add reset property")
> 
> is missing a Signed-off-by from its author
It seems Encrow having problem in sending patch v3, and I completely
overlooked this.. but as v2 is correct, then I can fix it downside in
SpacemiT SoC tree, which will eventually make it right at for-next tree..

-- 
Yixun Lan (dlan)
