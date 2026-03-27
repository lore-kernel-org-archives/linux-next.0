Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D9F3815C0;
	Fri, 27 Mar 2026 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637862; cv=none; b=FMsD1UR7V1uKT6DSN4aOFeewCsHccHObwMsgNWJFtpfJi0Lc1TbVtfPfEN3DSGus9N69nsKy82pMG787LOjsRlRF71L2Aq0G+quIJ0yJY/1QBIYSphQxd8p5o3ob9lSua+jepAFfUJHfqjyDRhdBo2p9TDbLZJ2jpN1matQUaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637862; c=relaxed/simple;
	bh=B4C6ATQ++NMj8UsGQ2rKlei0LQeS4D8Iz0pblmrHe5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbt5mjYBmraKhH7nYHi0vKH8IFiQKQfaaazV4mh5PKLxOvKiZNfqSPI71Z0bHaFG+XQMNjwWN+HQjDv9BAP+kWGfCwoypiiPrq94qaUl2mkk7UzgvQUde3g51UH+/uRVCjwJa/biPzxZCFIQ49qkTCT1cy3l2z5wg4mJSqMJ8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=viEPpMmZ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="viEPpMmZ"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 069161A49E8;
	Fri, 27 Mar 2026 19:57:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1774637859;
	bh=B4C6ATQ++NMj8UsGQ2rKlei0LQeS4D8Iz0pblmrHe5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=viEPpMmZR6ypHWCPZtAy2/0qa/Jxy2c9fLcHf0lXLZ8nhE6S2M0m0QMktvqWMJzqo
	 thlT7VsbMBRN7EAoMsd0bmNNYNlOkrjP3p/vOHFtKTVFO/zypkkMCMfjUFmA0sfHEO
	 jvNosuYfZPV9AeAnn5Mf5vdTJC8BFjKWXqwInFAVflUqkbXlT81UJSDZTV0dQQU3ng
	 a0tvDrC9atBUc85ojXRSpWZV0Q3MACEsOqT3uKZZMZpC5BNz9cRBHWQmv/2faEARPG
	 SKpGo1/iuw6xNdUpN2XlZcxCM3xFyr9RSNU8PZ3rFFX3W4IHN7RTJp+tzka2dxOPX6
	 HzubfYcHV1/vA==
Date: Fri, 27 Mar 2026 19:57:37 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the iommu tree
Message-ID: <rqh76k3fn3lwr6zz4mixcdffznxpu23olb5engo4h37vsvwamw@2ys4xrlc7v5e>
References: <aca10hdkzbvpNGNs@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca10hdkzbvpNGNs@sirena.co.uk>

On Fri, Mar 27, 2026 at 04:52:34PM +0000, Mark Brown wrote:
> Commit
> 
>   00a7eef2eef218 ("iommu/riscv: Fix signedness bug")
> 
> is missing a Signed-off-by from its committer

Fixed now, thanks for the heads-up.
