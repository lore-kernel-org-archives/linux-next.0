From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the vfs tree
Date: Mon, 3 Jul 2017 12:07:44 +1000
Message-ID: <20170703120744.645d9fda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_internal.h

between commits:

  012c6741c6aa ("switch compat_drm_version() to drm_ioctl_kernel()")
  17e3dade62d6 ("switch compat_drm_getunique() to drm_ioctl_kernel()")
  9e92662d01d8 ("switch compat_drm_getclient() to drm_ioctl_kernel()")

from the vfs tree and commit:

  e9083420bbac ("drm: introduce sync objects (v4)")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_internal.h
index 14dfa9c83d1d,5cecc974d2f9..000000000000
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@@ -142,7 -143,17 +143,20 @@@ static inline int drm_debugfs_crtc_crc_
  {
  	return 0;
  }
+ 
  #endif
 +drm_ioctl_t drm_version;
 +drm_ioctl_t drm_getunique;
 +drm_ioctl_t drm_getclient;
+ 
+ /* drm_syncobj.c */
+ void drm_syncobj_open(struct drm_file *file_private);
+ void drm_syncobj_release(struct drm_file *file_private);
+ int drm_syncobj_create_ioctl(struct drm_device *dev, void *data,
+ 			     struct drm_file *file_private);
+ int drm_syncobj_destroy_ioctl(struct drm_device *dev, void *data,
+ 			      struct drm_file *file_private);
+ int drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
+ 				   struct drm_file *file_private);
+ int drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
+ 				   struct drm_file *file_private);
