From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 25 (drm/udl without CONFIG_FB)
Date: Mon, 25 Jul 2016 09:32:39 -0700
Message-ID: <a3af152d-aec2-4cb7-4b2e-bd0856d96771@infradead.org>
References: <20160725161748.61523c10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:60898 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752463AbcGYQcs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 12:32:48 -0400
In-Reply-To: <20160725161748.61523c10@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>

On 07/24/16 23:17, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160724:
> 

on i386, when CONFIG_FB is not enabled:

../drivers/gpu/drm/udl/udl_fb.c: In function 'udl_fb_open':
../drivers/gpu/drm/udl/udl_fb.c:206:23: error: 'struct fb_info' has no member named 'fbdefio'
  if (fb_defio && (info->fbdefio == NULL)) {
                       ^
../drivers/gpu/drm/udl/udl_fb.c:211:28: error: invalid application of 'sizeof' to incomplete type 'struct fb_deferred_io'
   fbdefio = kmalloc(sizeof(struct fb_deferred_io), GFP_KERNEL);
                            ^
../drivers/gpu/drm/udl/udl_fb.c:214:11: error: dereferencing pointer to incomplete type
    fbdefio->delay = DL_DEFIO_WRITE_DELAY;
           ^
../drivers/gpu/drm/udl/udl_fb.c:215:11: error: dereferencing pointer to incomplete type
    fbdefio->deferred_io = drm_fb_helper_deferred_io;
           ^
../drivers/gpu/drm/udl/udl_fb.c:218:7: error: 'struct fb_info' has no member named 'fbdefio'
   info->fbdefio = fbdefio;
       ^
../drivers/gpu/drm/udl/udl_fb.c: In function 'udl_fb_release':
../drivers/gpu/drm/udl/udl_fb.c:238:38: error: 'struct fb_info' has no member named 'fbdefio'
  if ((ufbdev->fb_count == 0) && (info->fbdefio)) {
                                      ^
../drivers/gpu/drm/udl/udl_fb.c:240:13: error: 'struct fb_info' has no member named 'fbdefio'
   kfree(info->fbdefio);
             ^
../drivers/gpu/drm/udl/udl_fb.c:241:7: error: 'struct fb_info' has no member named 'fbdefio'
   info->fbdefio = NULL;
       ^



-- 
~Randy
