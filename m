Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112423F167B;
	Wed,  6 May 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061265; cv=none; b=NOgAJ3fqXPtlfOGPo5y2HsFMuJOxe7ZfA3ck1FSygHIlaDMRB3rgm43irKbmHfXNnjbcndl/g6579kuTcdH0cJyx/JNvj4ZHY6A7YDkabbXbIM0wpWCWhaDtccUseBKaiX1ZXKii90eqXTyQzmtoBcpQuxHNcKYTq+L52OxpWII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061265; c=relaxed/simple;
	bh=rwf8wYFiXK0gfewH3TE++d4knpALHmMTFdcamNMRptU=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject; b=Hsv0Jb5KLYjoPWZfYa15jMY1gdHcZZlvv/FqHGQCJrX02I5Z2VLeOn88usMSdbx5likLvcodhpiy+iZDoGedcNN0Duo9RsY5qVv3tm+g3mCosNHIJZdTduudyNO8aH9wc3nqiX85yTu8sZL6dnooTheCW+yZAhwZ7bGC/U8FHaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Levt32AE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Levt32AE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC6BC2BCB8;
	Wed,  6 May 2026 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061264;
	bh=rwf8wYFiXK0gfewH3TE++d4knpALHmMTFdcamNMRptU=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:From;
	b=Levt32AEU6GkBJ560yKat5BPt+lzoZTjBOLWvXzbLjMdQVL1jngh/CZvLlzorrX8o
	 HMvUic7p9bQcmSRzixqFu4RvyGGE6kKb/rmXB/s+ihfNBxykIabAue4+mr5kEYarHj
	 iP61Vfz/wHOZT6juAjpUUCZjyDd1PSdct28nY+Xb6hqx7La66RzNgHxhCZYjZ/L/h5
	 2iqvwJM6JU+Y+AHFnlOmJAUJiIA64EJTu2GF3GrI/42XIQo8Tz1t/CHeX0XFYr1XoE
	 rUyjzkHvd6Rgf5eL+GtBV2NzSOGfpuzPmh423Sz49WphRMjqyJTfV1gBNcw6RtOKSH
	 yFwc0W33GtFUg==
Date: Wed, 06 May 2026 11:54:22 +0200
Message-ID: <2c2d12ba287fc63df4351a9bfb03c042@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the amdgpu tree with the drm-next tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c

between commit:

  5164f7e7ff8e ("drm: Rename struct drm_atomic_state to drm_atomic_commit")

from the drm-next tree and commit:

  f86875a33984 ("drm/amdgpu: Replace VKMS vblank timer with common implementation")

from the amdgpu tree.

I fixed it up by using the version from the amdgpu tree, which already
contains a version of the commit from Linus' tree. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.
