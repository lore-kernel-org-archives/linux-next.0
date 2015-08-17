From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Mon, 17 Aug 2015 16:08:36 +0900
Message-ID: <55D18874.6010609@samsung.com>
References: <20150817135130.162b3a40@canb.auug.org.au>
 <20150817135342.2c6d3586@canb.auug.org.au>
 <20150817155328.1b690385@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50461 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbbHQHIj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2015 03:08:39 -0400
In-reply-to: <20150817155328.1b690385@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Stephen,

On 2015=EB=85=84 08=EC=9B=94 17=EC=9D=BC 14:53, Stephen Rothwell wrote:
> Hi Inki,
>=20
> On Mon, 17 Aug 2015 13:53:42 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> On Mon, 17 Aug 2015 13:51:30 +1000 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
>>>
>>> After merging the drm-exynos tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> drivers/gpu/drm/exynos/exynos_mixer.c: In function 'vp_video_buffer=
':
>>> drivers/gpu/drm/exynos/exynos_mixer.c:395:15: error: 'struct exynos=
_drm_plane' has no member named 'pixel_format'
>>>   switch (plane->pixel_format) {
>>>                ^
>>> In file included from drivers/gpu/drm/exynos/exynos_mixer.c:17:0:
>>> drivers/gpu/drm/exynos/exynos_mixer.c:404:10: error: 'struct exynos=
_drm_plane' has no member named 'pixel_format'
>>>      plane->pixel_format);
>>>           ^
>>> include/drm/drmP.h:164:17: note: in definition of macro 'DRM_ERROR'
>>>   drm_err(fmt, ##__VA_ARGS__)
>>>                  ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:411:11: error: 'struct exynos=
_drm_plane' has no member named 'scan_flag'
>>>   if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
>>>            ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:417:39: error: 'struct exynos=
_drm_plane' has no member named 'pitch'
>>>     luma_addr[1] =3D luma_addr[0] + plane->pitch;
>>>                                        ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:418:43: error: 'struct exynos=
_drm_plane' has no member named 'pitch'
>>>     chroma_addr[1] =3D chroma_addr[0] + plane->pitch;
>>>                                            ^
>>> In file included from drivers/gpu/drm/exynos/exynos_mixer.c:20:0:
>>> drivers/gpu/drm/exynos/exynos_mixer.c:439:53: error: 'struct exynos=
_drm_plane' has no member named 'pitch'
>>>   vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
>>>                                                      ^
>>> drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro=
 'VP_MASK_VAL'
>>>   (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
>>>      ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:439:35: note: in expansion of=
 macro 'VP_IMG_HSIZE'
>>>   vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->pitch) |
>>>                                    ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:440:21: error: 'struct exynos=
_drm_plane' has no member named 'fb_height'
>>>    VP_IMG_VSIZE(plane->fb_height));
>>>                      ^
>>> drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro=
 'VP_MASK_VAL'
>>>   (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
>>>      ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:440:3: note: in expansion of =
macro 'VP_IMG_VSIZE'
>>>    VP_IMG_VSIZE(plane->fb_height));
>>>    ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:442:53: error: 'struct exynos=
_drm_plane' has no member named 'pitch'
>>>   vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
>>>                                                      ^
>>> drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro=
 'VP_MASK_VAL'
>>>   (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
>>>      ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:442:35: note: in expansion of=
 macro 'VP_IMG_HSIZE'
>>>   vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->pitch) |
>>>                                    ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:443:21: error: 'struct exynos=
_drm_plane' has no member named 'fb_height'
>>>    VP_IMG_VSIZE(plane->fb_height / 2));
>>>                      ^
>>> drivers/gpu/drm/exynos/regs-vp.h:59:5: note: in definition of macro=
 'VP_MASK_VAL'
>>>   (((val) << (low_bit)) & VP_MASK(high_bit, low_bit))
>>>      ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:443:3: note: in expansion of =
macro 'VP_IMG_VSIZE'
>>>    VP_IMG_VSIZE(plane->fb_height / 2));
>>>    ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:445:39: error: 'struct exynos=
_drm_plane' has no member named 'src_width'
>>>   vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
>>>                                        ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:446:40: error: 'struct exynos=
_drm_plane' has no member named 'src_height'
>>>   vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
>>>                                         ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:451:39: error: 'struct exynos=
_drm_plane' has no member named 'crtc_width'
>>>   vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
>>>                                        ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:454:41: error: 'struct exynos=
_drm_plane' has no member named 'crtc_height'
>>>    vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
>>>                                          ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:457:41: error: 'struct exynos=
_drm_plane' has no member named 'crtc_height'
>>>    vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
>>>                                          ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:472:27: error: 'struct exynos=
_drm_plane' has no member named 'mode_height'
>>>   mixer_cfg_scan(ctx, plane->mode_height);
>>>                            ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c:473:30: error: 'struct exynos=
_drm_plane' has no member named 'mode_height'
>>>   mixer_cfg_rgb_fmt(ctx, plane->mode_height);
>>>                               ^
>>> drivers/gpu/drm/exynos/exynos_mixer.c: In function 'mixer_setup_sca=
le':
>>> drivers/gpu/drm/exynos/exynos_mixer.c:494:11: error: 'const struct =
exynos_drm_plane' has no member named 'crtc_width
>>
>> Hmm, my message was truncated ...
>>
>> I assume that there was a conflicting change in some other tree, and=
 so
>> have dropped this tree for today (hopefully it will be fixed up soon=
 or
>> you can tell me how to fix this).
>=20
> Actually it looks like this was caused by commit
>=20
>   a97f353797b4 ("drm/exynos: remove unused fields from struct exynos_=
drm_plane")
>=20
> but only exposed today (maybe by some Kconfig dependency changing so
> that drivers/gpu/drm/exynos/exynos_mixer.c is now built).

I tried to build it with multi_v7_defconfig but I couldn't see any buil=
d
error.

Below is commit of linux-next tree I tested,
commit b00278812ebaae29769666ef556abc20a4680581
Merge: ad1d24c c098dc8
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri Aug 14 12:06:53 2015 +1000

    Merge remote-tracking branch 'drm-exynos/exynos-drm/for-next


And today, I re-based exynos-drm/for-next on top of mainline. Could you
update and try to build it again?

Thanks,
Inki Dae

>=20
