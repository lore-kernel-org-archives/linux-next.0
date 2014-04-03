From: Jan Moskyto Matejka <mq@suse.cz>
Subject: [PATCH] Revert "drm/i915: fix build warning on 32-bit
	(v2)"
Date: Thu,  3 Apr 2014 14:53:57 +0200
Message-ID: <1396529637-15395-1-git-send-email-mq@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jan Moskyto Matejka <mq@suse.cz>
List-Id: linux-next.vger.kernel.org

This reverts commit 60f2b4af1258c05e6b037af866be81abc24438f7.

The same warning has been fixed in e5081a538a565284fec5f30a937d98e460d5e780 and
these two commits got merged in 74e99a84de2d0980320612db8015ba606af42114 which
caused another warning. Simply, the reverted commit casted the pointer
difference to unsigned long and the other commit changed the output type from
long to ptrdiff_t.

The other commit fixes the original warning the better way so I'm reverting
this commit now.
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 4cf6d02..0eaed44 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -405,7 +405,7 @@ int i915_parse_cmds(struct intel_ring_buffer *ring,
 			DRM_DEBUG_DRIVER("CMD: Command length exceeds batch length: 0x%08X length=%d batchlen=%td\n",
 					 *cmd,
 					 length,
-					 (unsigned long)(batch_end - cmd));
+					 batch_end - cmd);
 			ret = -EINVAL;
 			break;
 		}
-- 
1.8.4.5
