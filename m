From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Tue, 9 Apr 2019 09:23:52 +0200
Message-ID: <20190409072352.2qcuarc76kjgnhkm@sirius.home.kraxel.org>
References: <20190409113410.3d2a8afc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409113410.3d2a8afc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 09, 2019 at 11:34:10AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-misc tree got conflicts in:
> 
>   drivers/gpu/drm/cirrus/cirrus_drv.h
>   drivers/gpu/drm/cirrus/cirrus_ttm.c
> 
> between commits:
> 
>   aa8e2435b3d4 ("drm/ttm: Define a single DRM_FILE_PAGE_OFFSET constant")
>   7d1500f9fbfc ("drm/ttm: Remove file_page_offset parameter from ttm_bo_device_init()")
>   bed2dd84212e ("drm/ttm: Quick-test mmap offset in ttm_bo_mmap()")
> 
> from the drm tree and commit:
> 
>   ab3e023b1b4c ("drm/cirrus: rewrite and modernize driver.")
> 
> from the drm-misc tree.
> 
> I fixed it up (I just removed the files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Ping drm-misc maintainers.  Time to update drm-misc-next with a
backmerge I think?

thanks,
  Gerd
