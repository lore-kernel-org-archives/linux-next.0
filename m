Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5345091D;
	Tue, 28 Apr 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381017; cv=none; b=Ui0z+g6k6hvJQNgM4+zeCS868WnIv+LD7WxSGwXLiCgIQ507XduDf/KBw6/NX5PgjpAE1iIg3IY+GsJQTNxL85WaWaQ2vy08jkNdu15x8l6zdkE13MSQyNoC67NXndlflS3jHvir4V4HUs7ECIlTzQS/Xk/S1a0O+k2xR/LRrMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381017; c=relaxed/simple;
	bh=OrvsqaGtjkL2gF+C2dCC6NoGcmTOjZDqyYdAJHoSUp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4xn0UbUTWcKwib8hdvRzb5sQhOcnuCau2IURYex+9MC2PkQjJ1mt/zOr0nUDTIUr8+1Zgiz6As7BbuqmR4HGNRkeM5pMPeJq7cpsGRYr7qR5BsGIeZYWvlMD8vzm8+bZcXEGMjB9//ELUnsHz0z8DWcPyYukhksA2FlQkGrAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6C2+WBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6C2+WBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661D0C2BCB8;
	Tue, 28 Apr 2026 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777381016;
	bh=OrvsqaGtjkL2gF+C2dCC6NoGcmTOjZDqyYdAJHoSUp4=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6C2+WBL1fjLATetlMZNsJKzgDcDmVNU6HsnhyCZM9TdJtbzg1zWdeIbS5jf8XpXw
	 kcrqrk2SXg350zwKS6M7764M2PKOSH2UJqHeYXqMpcBAE5PDXCTjQHsbJp7AcWM1Gf
	 zWa39sd13XIYYFMVm0isKCbsGQlBKnFxDON33s/HpefHIgGVVmo8mCDFBmZcH/WVpg
	 ticc/PvwFsUmS1YTdod4P1E3po1XSQuWv2mOgpAUzhCnlCuMRhp2eGmo/mWTj2D+a4
	 hMyJqkcUgT1FXwFj6zHr0WvherVaCiIX/r1DfCBAXNkS70v89klYGsdPjFLjrUKLEb
	 Avf9Y+TD4WfvQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kthread tree
Date: Tue, 28 Apr 2026 14:56:53 +0200
Message-ID: <20260428125654.3911280-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After merging the amdgpu tree, today's linux-next build (arm64 allyesconfig)
failed like this:

    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c: In function 'dml21_ModeSupportAndSystemConfigurationFull':
    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5244:1: error: the frame size of 3232 bytes is larger than 3072 bytes [-Werror=frame-larger-than=]
     5244 | }
          | ^
    cc1: all warnings being treated as errors
    make[7]: *** [/srv/kbuild/next/linux.git/scripts/Makefile.build:289: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.o] Error 1
    make[7]: *** Waiting for unfinished jobs....
    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c: In function 'dml30_ModeSupportAndSystemConfigurationFull':
    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:4961:1: error: the frame size of 3360 bytes is larger than 3072 bytes [-Werror=frame-larger-than=]
     4961 | }
          | ^
    cc1: all warnings being treated as errors
    make[7]: *** [/srv/kbuild/next/linux.git/scripts/Makefile.build:289: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.o] Error 1
    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'dml32_ModeSupportAndSystemConfigurationFull':
    /srv/kbuild/next/linux.git/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3762:1: error: the frame size of 3968 bytes is larger than 3072 bytes [-Werror=frame-larger-than=]
     3762 | } // ModeSupportAndSystemConfigurationFull
          | ^
    cc1: all warnings being treated as errors

It's not clear to me what commit caused this, and looking at the mailing
lists it seems like this may have existed for a while and for different
configurations. I don't know if there any plans to try and fix this.

Thierry
