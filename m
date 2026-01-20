Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B13BF309;
	Tue, 20 Jan 2026 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912350; cv=none; b=Rm/E99BIBlk5Cdy7JwT3ouyQgD60nfYhN9SlUUHe+Np3X2agLlHxPqQzzsPVRmTr19NqS1LwsIu0NPEV8Dds4U9tqdd2pQ7w9h5eQixymy/qP0fWR0luqSBhGp6rMHVhpiI+lNLo/4XJ/d53d/u84ZGUZ+IbkERLEGq2sOj1XiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912350; c=relaxed/simple;
	bh=fFwOnTnELDcx6x7z2PJ3DsHyeufLTFNW8uVNjHAQPcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1VMj7+6uIHz8ZjtGuZZU+8ncxE8z17KtH2eFGD86ZzrhWSmhEkX+LYDX9RoUnSPd5hVa1sV16Rbu12Nol462JeorcoYjuH91wwMfOznNzh23QJXsGGEsLSuXDdkDHCoDBprDT27PhGfC8IAF+dqAXXD372pD1ZZnT0RyNDPvlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S25PIjsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S25PIjsb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC7DC16AAE;
	Tue, 20 Jan 2026 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912349;
	bh=fFwOnTnELDcx6x7z2PJ3DsHyeufLTFNW8uVNjHAQPcY=;
	h=Date:From:To:Cc:Subject:From;
	b=S25PIjsbqyjGbgXQOUlbR7kWNqUWVVEnIa4QVabIQqKo1JWYQRG/c3qE0H96b4ZHN
	 zwdAFFR3Cfs5Pmd9ewUPzJhawUeJY+nTfN6ZcJJSlsSOKZ84QswGAfh7+33XhZFoiI
	 /gFEX83yK+t97aRF3C76DJ+zys0q7gaCNLVtrgvB/2H9rk/cw0f+eRMYa6lOPGd+An
	 NzKDmECyu6KiRmLgXisl+m6bFzyg49rXUshJeHe0KK2HQC/RfrR7XPxGFuHNksdy6/
	 8qvVbPX0I+0bbE6UtKMCEDt74pWZgue21CTRdxNwOtYZzC1Uff2CovU39Ou+5dQvYf
	 4muJr4+HQm+iQ==
Date: Tue, 20 Jan 2026 12:32:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tim Bird <tim.bird@sony.com>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the spdx
 tree
Message-ID: <aW912Qvlf_n2S8f6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  kernel/cpu.c

between commit:

  330eb955ea9e7 ("kernel: add SPDX-License-Identifier lines")

from the spdx tree and commit:

  30811b31fac32 ("kernel: add SPDX-License-Identifier lines")

from the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/cpu.c
index 5185c0be847a0,a7a1cf8ea8e08..0000000000000
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
