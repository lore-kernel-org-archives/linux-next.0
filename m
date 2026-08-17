Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2A418350;
	Mon, 17 Aug 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972559; cv=none; b=IIPHHQ/vno1/IjkEMfsyJ7S0s4pVe9uXFoEE6LYhIweVGP7jW0k3usavachCNtx5kTU41cil5kXHmVC/u+567FDXoJZQgoXYRurA7srpOcPjQUXldYCqIOmF6XbzTXCffdBe+g3MTNtjv19yJUenNVbDRB9HiG9ShNe/8cC1rbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972559; c=relaxed/simple;
	bh=7in3dzlPWt9aMJZThbbm2fOIrPxAHCx7hlEp0Ln13e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qmsh+CkPk3Xl7dg+fSrvApXN8FRrs25IdCVr3oKeyXmBWsLig+zWaI0H8ETfR6TMPAdxkk3kxFRe/YVLcd5lRfZqnGUfAnJ3nmdVlmU2D4dGfCCtX++JrS3YbJr+psStqtvh9qSjP2AqqznlE+kX63OjlwOu6BGJmLPLXQm6AHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRdzUINm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRdzUINm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8D51F00A3E;
	Mon, 17 Aug 2026 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786972558;
	bh=qm3DuJZorsmWUYRw2IDxlAVda6mnleq4G4gxwCn6t1Q=;
	h=Date:From:To:Cc:Subject;
	b=iRdzUINmS66aL4eRFqUHly8nPmnR3QW9DbDBdDSdOApmk0IaAohlj2VVzAkGPP+1v
	 vq4MRhImAPRaKFrVzK6GD5bjhHy4BcywljurD94HS6N/ZOVkYRgcktcdQXJuC55Q16
	 kdBf3igozSH6PYV4ke78c7Zqqjbp7mzZSoXed4Kh9HJKC1S2aNbhJKirs5PlJc7Kex
	 2UQRx4gqLdTUqpXcpG4Q4V/q4NBppaaxwGHN0zw8FxRL78EkfazO890bZqvSNRqyvK
	 fkIXMnLqAlRFDmVB7FssAQ16Irr9saz3t9OEgAjvMdaZJIKS/05lkeuIwe7uwRnkAV
	 FEHmR3Nqp+AHQ==
Date: Mon, 17 Aug 2026 14:15:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ksmbd tree
Message-ID: <aoMJivO_AiXFax6P@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  a9ec4dc53b052 ("smb/server: rename to ksmbd_has_nonposix_open_child()")

is missing a Signed-off-by from its committer
