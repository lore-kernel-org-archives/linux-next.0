From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the drm tree
Date: Wed, 2 Aug 2017 16:54:56 +1000
Message-ID: <20170802165456.1a2f6eb7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36355 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750985AbdHBGy6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 02:54:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>

Hi Dave,

Commits

  663ebbf63180 "drm/amdgpu: trace VM flags as 64bits"
  5327dd8acf05 "drm/amdgpu: remove stale TODO comment"
  eabd76cef900 "drm/amd/sched: print sched job id in amd_sched_job trace"
  a69c7e0138fc "drm/amdgpu: update pctl1 ram index/data for mmhub on raven"
  7504938f8e73 "drm/amdgpu: add check when no firmware need to load"
  98a7f88ce9a9 "drm/amdgpu: bind BOs with GTT space allocated directly v2"
  92c60d9cf663 "drm/amdgpu: bind BOs to TTM only once"
  fc9c8f5459f2 "drm/amdgpu: add vm_needs_flush parameter to amdgpu_copy_buffer"
  df264f9e0808 "drm/amdgpu: allow flushing VMID0 before IB execution as well"
  369421cbfabf "drm/amdgpu: fix amdgpu_ring_write_multiple"
  e8110b1c9bdd "drm/amdgpu: move ring helpers to amdgpu_ring.h"

are missing Signed-off-by from their comitter.

-- 
Cheers,
Stephen Rothwell
