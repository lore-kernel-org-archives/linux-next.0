From: Pauli Nieminen <suokkos@gmail.com>
Subject: [PATCH] drm/radeon: Fix printf type warning in 64bit system.
Date: Mon,  1 Mar 2010 11:37:11 +0200
Message-ID: <1267436231-5524-1-git-send-email-suokkos@gmail.com>
References: <20100301181452.9efa3661.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100301181452.9efa3661.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

Type of iterator was promoted to unsigned long in 64bit systems.

*header is small structure so it is alwas safe to cast return value
of sizeof operator to int.

Signed-off-by: Pauli Nieminen <suokkos@gmail.com>
---
 drivers/gpu/drm/radeon/r300_cmdbuf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r300_cmdbuf.c b/drivers/gpu/drm/radeon/r300_cmdbuf.c
index 18d3ff8..27930fc 100644
--- a/drivers/gpu/drm/radeon/r300_cmdbuf.c
+++ b/drivers/gpu/drm/radeon/r300_cmdbuf.c
@@ -1148,7 +1148,7 @@ int r300_do_cp_cmdbuf(struct drm_device *dev,
 		default:
 			DRM_ERROR("bad cmd_type %i at byte %d\n",
 				  header->header.cmd_type,
-				  cmdbuf->buffer->iterator - sizeof(*header));
+				  cmdbuf->buffer->iterator - (int)sizeof(*header));
 			ret = -EINVAL;
 			goto cleanup;
 		}
-- 
1.6.3.3


------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
--
