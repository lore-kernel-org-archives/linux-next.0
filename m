From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Fri, 8 Feb 2019 09:52:44 +0100
Message-ID: <CAKMK7uHOJwunZ0erM31fBNi+kADoK=Y=CRpoSTx=CRKFFL596w@mail.gmail.com>
References: <20190208123815.64757bc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208123815.64757bc5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 8, 2019 at 2:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from drivers/gpu/drm/arm/display/komeda/komeda_drv.c:13:
> drivers/gpu/drm/arm/display/komeda/komeda_kms.h:87:20: error: field 'base' has incomplete type
>   struct drm_device base;
>                     ^~~~
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_parse_pipe_dt':
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:27:3: error: implicit declaration of function 'DRM_ERROR'; did you mean 'DRM_IOR'? [-Werror=implicit-function-declaration]
>    DRM_ERROR("get aclk for pipeline %d failed!\n", pipe_id);
>    ^~~~~~~~~
>    DRM_IOR
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_dev_create':
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:127:2: error: implicit declaration of function 'DRM_INFO'; did you mean 'DRM_IO'? [-Werror=implicit-function-declaration]
>   DRM_INFO("Found ARM Mali-D%x version r%dp%d\n",
>   ^~~~~~~~
>   DRM_IO
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_dev_destroy':
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:170:3: error: implicit declaration of function 'devm_iounmap'; did you mean 'pci_iounmap'? [-Werror=implicit-function-declaration]
>    devm_iounmap(dev, mdev->reg_base);
>    ^~~~~~~~~~~~
>    pci_iounmap
>
> and lots more ...
>
> Probably caused by commit
>
>   e3b01f0d576a ("drm: remove drmP.h from drm_modeset_helper.h")
>
> I have used the drm-misc tree from next-20190207 for today.

Yup.

Sam, can you pls take a look at what komeda needs? you need to
manually merge together drm-misc-next and drm-next first I think.

Dave, Maxime, Liviu: Heads up, drm-misc-next + drm-next will colide.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
