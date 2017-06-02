From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Fri, 2 Jun 2017 13:59:25 +1000
Message-ID: <20170602135925.70272f31@canb.auug.org.au>
References: <20170519120729.597f5a9e@canb.auug.org.au>
        <87y3tsg2jx.fsf@eliezer.anholt.net>
        <20170525114933.1e1dea04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59455 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751120AbdFBD72 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Jun 2017 23:59:28 -0400
In-Reply-To: <20170525114933.1e1dea04@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Anholt <eric@anholt.net>
Cc: Dave Airlie <airlied@linux.ie>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Cooksey <tom.cooksey@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>

Hi all,

On Thu, 25 May 2017 11:49:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Fri, 19 May 2017 10:49:06 -0700 Eric Anholt <eric@anholt.net> wrote:
> >
> > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >   
> > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > produced these warnings:
> > >
> > > drivers/gpu/drm/pl111/pl111_drv.c:81:12: warning: 'pl111_modeset_init' defined but not used [-Wunused-function]
> > >  static int pl111_modeset_init(struct drm_device *dev)
> > >             ^
> > > drivers/gpu/drm/pl111/pl111_drv.c:149:26: warning: 'pl111_drm_driver' defined but not used [-Wunused-variable]
> > >  static struct drm_driver pl111_drm_driver = {
> > >                           ^    
> > 
> > Sorry about that -- I thought that kbuild test robot would give me
> > notification of new warnings.
> > 
> > Patch incoming.  
> 
> I saw the patch, but it doesn't seem to have been applied anywhere yet.

So these warnings went away yesterday, but are back today after quite a
few patches were dropped from the drm-misc tree.

Yesterday it contained theses (relative to the drm tree):

9a8d5e4a53dc drm/vc4: Fix comment in vc4_drv.h
66d6dd45eee2 drm/pl111: fix warnings without CONFIG_ARM_AMBA
91110a4b64fe drm/atomic: Consitfy mode parameter to drm_atomic_set_mode_for_crtc()
fb51cbfd4b2e drm/arcgpu: Drop drm_vblank_cleanup
e3ec0e1e38a5 drm/atmel: Drop drm_vblank_cleanup
85769cf7cd7f drm/imx: Drop drm_vblank_cleanup
a360b39b5137 drm/meson: Drop drm_vblank_cleanup
25b905fe4323 drm/stm: Drop drm_vblank_cleanup
d79373bd4d7e drm/sun4i: Drop drm_vblank_cleanup
8938d13585bc drm: better document how to send out the crtc disable event
46466b0dac3f drm: Use vsnprintf extension %ph
99cdb35e787b drm/doc: move printf helpers out of drmP.h
e7cc23de3e4e drm/pl111: select DRM_PANEL
7dbcbce9f551 drm/bridge: analogix-anx78xx: Use bridge->mode_valid() callback
faf94a0883ce drm: Use mode_valid() in atomic modeset
97f973d65260 drm: Use new mode_valid() helpers in connector probe helper
b1240f81a186 drm: Introduce drm_bridge_mode_valid()
da251bf8f935 drm: Add drm_{crtc/encoder/connector}_mode_valid()
18e51064c42c drm: Remove drm_device->virtdev
a301b1118615 drm: todo: remove task about switch to drm_connector_list_iter
eb53a46be597 drm: remove unsafe drm_for_each_connector()
4894bf711d19 drm/vc4: use drm_for_each_connector_iter()
875dd62697fe drm/nouveau: use drm_for_each_connector_iter()
c8bf8b968adb drm/mediatek: use drm_for_each_connector_iter()
2fd96b4116bf drm/i915: use drm_for_each_connector_iter()
2cbeb64f6c70 drm/rockchip: use drm_for_each_connector_iter()
48a92916729b drm/exynos: use drm_for_each_connector_iter()

Today it only has:

2d7b56378d32 drm/rockchip: gem: add the lacks lock and trivial changes

-- 
Cheers,
Stephen Rothwell
