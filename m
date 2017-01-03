From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: linux-next: manual merge of the drm-intel-fixes tree with the vfio-fixes tree
Date: Tue, 03 Jan 2017 11:17:19 +0200
Message-ID: <87inpwijts.fsf@intel.com>
References: <20170103104002.3aab91a3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:46438 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756044AbdACJRY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Jan 2017 04:17:24 -0500
In-Reply-To: <20170103104002.3aab91a3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Alex Williamson <alex.williamson@redhat.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, igvt-g-dev@lists.01.org
Cc: Jike Song <jike.song@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 03 Jan 2017, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the drm-intel-fixes tree got a conflict in:
>
>   drivers/gpu/drm/i915/gvt/kvmgt.c
>
> between commit:
>
>   99e3123e3d72 ("vfio-mdev: Make mdev_device private and abstract interfaces")
>
> from the vfio-fixes tree and commit:
>
>   364fb6b789ff ("drm/i915/gvt/kvmgt: prevent double-release of vgpu")
>
> from the drm-intel-fixes tree.

Hi Stephen, while GVT-g is part of i915, it has its own mailing list and
maintainers, listed under "INTEL GVT-g DRIVERS (Intel GPU
Virtualization)" in MAINTAINERS. Please include them wrt linux-next
conflicts in drivers/gpu/drm/i915/gvt/. Added now.

Thanks,
Jani.


> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/gpu/drm/i915/gvt/kvmgt.c
> index f8021a01df63,934963970288..000000000000
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@@ -497,10 -500,19 +500,19 @@@ static int intel_vgpu_open(struct mdev_
> 		goto undo_iommu;
> 	}
> 
> - 	return kvmgt_guest_init(mdev);
> + 	ret = kvmgt_guest_init(mdev);
> + 	if (ret)
> + 		goto undo_group;
> + 
> + 	atomic_set(&vgpu->vdev.released, 0);
> + 	return ret;
> + 
> + undo_group:
> + 	vfio_unregister_notifier(&mdev->dev, VFIO_GROUP_NOTIFY,
> + 					&vgpu->vdev.group_notifier);
> 
>   undo_iommu:
>  -	vfio_unregister_notifier(&mdev->dev, VFIO_IOMMU_NOTIFY,
>  +	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
> 					&vgpu->vdev.iommu_notifier);
>   out:
> 	return ret;
> @@@ -513,10 -526,16 +526,16 @@@ static void __intel_vgpu_release(struc
> 	if (!handle_valid(vgpu->handle))
> 		return;
> 
> - 	vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMMU_NOTIFY,
> + 	if (atomic_cmpxchg(&vgpu->vdev.released, 0, 1))
> + 		return;
> + 
>  -	ret = vfio_unregister_notifier(&vgpu->vdev.mdev->dev, VFIO_IOMMU_NOTIFY,
> ++	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMMU_NOTIFY,
> 					&vgpu->vdev.iommu_notifier);
> - 	vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROUP_NOTIFY,
> + 	WARN(ret, "vfio_unregister_notifier for iommu failed: %d\n", ret);
> + 
>  -	ret = vfio_unregister_notifier(&vgpu->vdev.mdev->dev, VFIO_GROUP_NOTIFY,
> ++	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROUP_NOTIFY,
> 					&vgpu->vdev.group_notifier);
> + 	WARN(ret, "vfio_unregister_notifier for group failed: %d\n", ret);
> 
> 	info = (struct kvmgt_guest_info *)vgpu->handle;
> 	kvmgt_guest_exit(info);
> 
-- 
Jani Nikula, Intel Open Source Technology Center
