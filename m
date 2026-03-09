Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F973AEF52;
	Mon,  9 Mar 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060049; cv=none; b=IAMREkI/g0H1zaqSQ/J2eIrvM0nS/8zj1OeA4WYsvRoGmbhQlG6AqFbuLkqjUV4II+62k5LxWtdexE0qQoVXYJ8FnzpxJc58Mu7Cpmt+sgH+ZV3VmuMZrZwH7lbfeXFqqEbYOL0BEVtSGjHfSsFvdQFZ0ZUPz3ro2oOgm6E05ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060049; c=relaxed/simple;
	bh=dt0joZTopJgeilawArE0cxPREmtWTigshx+wPXqpu+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5EnG/yfrJyvb1LNuoC6F+UtLokTfJGrdaPhFbJ3YHzSofjAnpw9viEewiCP2s9fIgzxG9LUtKtCWjRZ7IpggScLNmHVarg00ekuP/EcllCoQ+fM0BNOP1XMbI1Ubrg/vhgzXe+Bi5enZA6Y6HbKa1akv+f9zt93FRREbY3Z7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqRuYyM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqRuYyM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C2FC2BC86;
	Mon,  9 Mar 2026 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773060049;
	bh=dt0joZTopJgeilawArE0cxPREmtWTigshx+wPXqpu+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqRuYyM3V9NOJAgH/TMrTZp+g/6/h196Db4I3zUm9KZqwBEI1pqKBi/Sl340qhpLC
	 5IPOBndQo2olCOAym7fceKiodGDZ2e87+L9m8em0yYhOrNGLz2ya2MV/R2wOtJSnWK
	 EPcl6NONyicrs20zvHzD4gpT/VsaIVWfoylFKP6p1su2mo3FVPSuPbifmOxvVArnTk
	 40ZDaUeP3C55MaxuBwC26YZwckXzgNayfUaz+wr87UVHbFGPFoLSd8fVxBjc+rr27e
	 ugxM+w0vMBP2BYCdza5+t+t178e0YdxfoijVYqSpzsdF0VkkByFiICk5apRjrfGZkI
	 Oyda+hSMYT/pg==
Date: Mon, 9 Mar 2026 20:40:45 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Mark Brown <broonie@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the imx-mxs tree
Message-ID: <aa6_zUCpS9vnREJg@QCOM-aGQu4IUr3Y>
References: <aa6qnpEoSaiP4B--@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6qnpEoSaiP4B--@sirena.org.uk>

+ Frank

On Mon, Mar 09, 2026 at 11:10:22AM +0000, Mark Brown wrote:
> Commit
> 
>   587096ada5204 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
> 
> is missing a Signed-off-by from its committer

Hi Mark,

Could you update imx-mxs contact to be Frank?

Thanks,
Shawn
