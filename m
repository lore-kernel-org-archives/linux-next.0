Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072173F44C4
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896944; cv=none; b=bHlSNZEmH+V4M0JcpacYGymAYlKbWACvAfwbcWuAeKZ7qZ+lpEU/4xpiux37qD8nQm7OCMM2I29foXpZNedmHr55z84oRm6MZRipO2sAWTBKrEcDj0s2znkBc5X+y7JUqqC8yjxuRQCL2iKDjAiOYhYFwQYLMSSNNpPe8WxPxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896944; c=relaxed/simple;
	bh=72Wfl0hlpUQCDV3I5ytRUTBmXd1e7UZRSnISwseAtBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IchNSWsKBl2PlrWdcO1ClI1jq1SCc/gzsKF4PrC6eqPARp41vGpwItOFJttD32idpKCU8US9xEh5FD44EgCMWNajl8LBtQxQ0YtgBQoloAzIUvDLbNTjTvDQfHu2Xci5zyqyE3sd5htGj8w058UwT3sTFAN4OVWT+awC+98ZShs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/sZMYO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/sZMYO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583AD1F000E9;
	Wed,  1 Jul 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782896942;
	bh=72Wfl0hlpUQCDV3I5ytRUTBmXd1e7UZRSnISwseAtBc=;
	h=Date:From:To:Cc:Subject;
	b=Q/sZMYO91t1PxAg4Rsv1UzuYLJD2MY+pav1X1WYh4SluPNSc1TtV9cEybqTbgbZMD
	 2vVkixGWY2soy0rGxr34bsdIQ+8ANf/MEhC2hunGt6pMVxrMTSAT5fuu8hy3U+dmZx
	 j/V1WYQapdDbi2rU/1KIf5+R1chG3wdwU1Qj4hhEc5KOuLPRZw+3wx6ESUTGC/wEDX
	 YE2JbxAArIbpSyWfcFrL56ZVPIRYgkBTNWSdZ1xQrZi3BUwde9L92I/P7+aMeDwp3R
	 nT9AtQdiI1qfsLwiKFhG2doxG5eMnzUbBXBK1P+e8nQZzqfrzPh5mE2+vSbFpkbjkW
	 gMlftfuvW26zQ==
Date: Wed, 1 Jul 2026 11:08:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Update i2c branches
Message-ID: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

can you please update my branch setup in the -next repositories?

Please remove the exisitng i2c/i2c-host* branches and from my
repository:

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please include:

i2c/i2c
i2c/i2c-fixes
i2c/i2c-next

The latter is normally a merge of the first two so that it
doesn't create any conflict, but very often it contains more
patches needing some special dependencies.

Thanks,
Andi
