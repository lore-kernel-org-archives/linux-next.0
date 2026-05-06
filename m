Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA073E315F;
	Wed,  6 May 2026 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061250; cv=none; b=aoCv2xjOy6c11Bq+PzoLqEzUORK4g2tI4d92IIPGiRKTn27MFpjIh4+p1rJnKKoSTK5tS1YWGPwnO5+ytmzBi7fLhbBxhAAd2p1gYUOkbfiX683JIhKgujNuIsy+T6khMm2Hiu534ufb6s9qU9VUshPAFQGPtQSGfhkNgv/JsYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061250; c=relaxed/simple;
	bh=lzTX4EF2eZLPpMsMWSwUvd27RCrOqKXUCOBIIzdZS/I=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Cc:Subject; b=FBWODcx1HB7RbP8alviK/qZH07sbOFNN+4lcted1LKR6LGFfZqivN49j9+/+l6KYQTl4FZuDSQBbgOmvDypAoXS4B+TPicDctqC4JagjdXZWnqI5VdpgexHyGklL+pDEZ8aNP8+ecP75x1KnnT4+MTOCxqS4obNPnFQZlGc7OLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve3+GhRZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve3+GhRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7767C2BCB8;
	Wed,  6 May 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061249;
	bh=lzTX4EF2eZLPpMsMWSwUvd27RCrOqKXUCOBIIzdZS/I=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Cc:Subject:From;
	b=Ve3+GhRZiF8uilVqpDDzRgHZFXWBd9O5xn3k6mvVCJN7ynDGUbD0SJuA52ne7hDsE
	 h78EyM0KPgKuD55BkU5Vf5KytXUUjIELVT8+2tpajUjMiEobqqNbh9KnyVGTVdqHEL
	 c1SHGzNOLaQz+Db52+GdKr5qd7BnySAU1kfJJ4+Cj+zsusV6uEGpaG38IrcTm0d5tR
	 ROMv6E2/3skHs/g7yczNpuYDp9Njx1Dyq4hnQ34Bame1Fh5WaqmkoHer7t/SPDkGMp
	 QquuUAsw0qMh+D0hp4GM+1/bVHzubq1MJVuQIkjZI2fi7xc19qfDEnSBCWR8ac7P59
	 8IRoNUjlDnc6A==
Date: Wed, 06 May 2026 11:54:06 +0200
Message-ID: <0525d1f1c670a3e47293f8e6fa64905c@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Mario Limonciello (AMD) <superm1@kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

between commits:

  87612bab9656 ("amdkfd: Only ignore -ENOENT for KFD init failuires")

from Linus' tree and commit:

  0d831487b5be ("drm/amdgpu: nuke amdgpu_userq_fence_slab v2")

from the amdgpu tree.

I fixed it up by using the version from the amdgpu tree, which already
contains a version of the commit from Linus' tree. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.
