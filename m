From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Sun, 1 Nov 2015 19:11:30 +1100
Message-ID: <20151101191130.7ec26f3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53082 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752133AbbKAILf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 03:11:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>

Hi Dave,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c

between commit:

  f6c7aba47bcc ("drm/amdgpu: Keep the pflip interrupts always enabled v7")

from Linus' tree and commit:

  f9fff064bb83 ("drm/amdgpu/dce: simplify suspend/resume")

from the drm tree.

I fixed it up (I just used the versions from the drm tree) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
