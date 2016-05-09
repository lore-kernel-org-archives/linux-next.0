From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 9 May 2016 11:28:28 +1000
Message-ID: <20160509112828.1fd4f68e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Flora Cui <Flora.Cui@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/ttm/ttm_bo.c

between commit:

  56fc350224f1 ("drm/ttm: fix kref count mess in ttm_bo_move_to_lru_tail")

from Linus' tree and commits:

  c3ea576e0583 ("drm/ttm: add optional LRU removal callback v2")
  98c2872ae99b ("drm/ttm: implement LRU add callbacks v2")

from the drm tree.

I fixed it up (I have no idea how to fix merge these changes, so I just
used the latter ones) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
