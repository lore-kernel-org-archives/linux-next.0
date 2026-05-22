Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09813CDBC4;
	Fri, 22 May 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445462; cv=none; b=R/NHqRIxFSq1YEhaLXc8Dwcmyz6dysRzBBouWZCQ922DuD1bQsfYqdmsOi4qIoo63RXAP+stgCy1miHbeaBbpS5MiZKWdxBzYW9jY9jCqmgTQA53JHMJR0571mxF5DjA94HwKqhbnbgO6J7YGa6c/OnUzgRhZ9gmX2CU8olE5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445462; c=relaxed/simple;
	bh=d3dTlVF7t0caQrPx6VYGDq+McYRKVoEDx6x+FciRBCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbBSiUaXpEdMbbEw3DjD2FszRIyUlld3R7AczOpYPa7EOQA+FDAbFKAz0LjtHlMVby2vonVCt9DETLeDb6fnvUFu1OiwbFkVxoTqIGlYYd8rKAWdcZIhxxprb7WkElznpor5rmJcv9j5udSwgrwWqTwxcGMAcQPQZCpJaWZPHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rgbjygs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rgbjygs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00A81F000E9;
	Fri, 22 May 2026 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445460;
	bh=luLrHuSS0vmS9p+zcsGKnefq/v6cTpKKThrWimnyGro=;
	h=Date:From:To:Cc:Subject;
	b=Rgbjygs5av1+rzkX19v1XaAb0OVunaDsth/TEDqM79VnNMad3LDTBuQfpOGN2Sxfs
	 QuoDRjnizchWZThLTEgwW4TFRdGMuTitsAN9f2mnyQQmPrEBMsNtrjcdU7nPPS3T5h
	 q9XDzQ5w/4IHd7PjhyfESprxNRShRxTTngh0gE5xKQwOlz7Jx4NrFKtEo4pK5XG6fi
	 NMnnstF+z7DzVioZZetGyEV94P+2gYcKiGYTEUvy6cSkSRurDXcpPNfcPm3z3kgFhT
	 zPlyA3RGFulnzU2y4Wp/JeAEHs4BJrU1KHn8FbhXT4MOVgYCSOGdwpbtRPxF9XggI+
	 i9jl7lc6l8dVQ==
Date: Fri, 22 May 2026 11:24:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the qcom tree
Message-ID: <ahAu0MhgBZO2MD70@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  90825ab392ac1 ("arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node")

Fixes tag

  Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the

has these problem(s):

  - Subject has leading but no trailing quotes
