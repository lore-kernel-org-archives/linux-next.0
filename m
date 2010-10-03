From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 4 Oct 2010 10:30:46 +1100
Message-ID: <20101004103046.0eb5f505.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58968 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174Ab0JCXaw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Oct 2010 19:30:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
include/drm/drmP.h between commit
31dfbc93923c0aaa0440b809f80ff2830c6a531a ("drm: Prune GEM vma entries")
from Linus' tree and commits 793a97e4cc38f834e0488ccc1ecbfe52ff6f5b84
("drm: kill drm_map_ofs callbacks") and
cbc60ca04b342a4e1f2a1086a7277c077f07dbed ("drm: kill get_reg_ofs
callback") from the drm tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/drm/drmP.h
index 4c9461a,30e827a..0000000
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@@ -1174,9 -1158,6 +1158,7 @@@ extern int drm_release(struct inode *in
  extern int drm_mmap(struct file *filp, struct vm_area_struct *vma);
  extern int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma);
  extern void drm_vm_open_locked(struct vm_area_struct *vma);
 +extern void drm_vm_close_locked(struct vm_area_struct *vma);
- extern resource_size_t drm_core_get_map_ofs(struct drm_local_map * map);
- extern resource_size_t drm_core_get_reg_ofs(struct drm_device *dev);
  extern unsigned int drm_poll(struct file *filp, struct poll_table_struct *wait);
  
  				/* Memory management support (drm_memory.h) */
