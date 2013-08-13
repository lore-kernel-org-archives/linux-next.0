From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: Tree for Aug 13 [ screen corruption in graphical
 mode ]
Date: Tue, 13 Aug 2013 19:53:22 +0100
Message-ID: <20130813185322.GA5982@cantiga.alporthouse.com>
References: <CA+icZUUKH6Fa8WksqA69FXKUUJmKsNdXv0ZJH50HA2mFavfPCg@mail.gmail.com>
 <CA+icZUXC73i4hO7LHDQ=85__JtrZmSMB+KyUnS+G6vRmm_=tkg@mail.gmail.com>
 <CA+icZUXdS3EuXyGZiS1--rMu6H0ospzCiK_CXgPv8mOk0sMt+Q@mail.gmail.com>
 <20130813163439.GA8805@cantiga.alporthouse.com>
 <CA+icZUX8HZD3z-uwTMWX9CoLdYYqyPVuhH-vWGhJuoonvMQTbQ@mail.gmail.com>
 <CA+icZUU1tbHGVPgjXNvsq-F44O6umbhp_bFcoLE35HZ0zTqo2g@mail.gmail.com>
 <20130813171324.GB8805@cantiga.alporthouse.com>
 <CA+icZUWFqpObp_6KzJExPs2pkJOofaKw6CKv8J0=VTfyVy_Uew@mail.gmail.com>
 <20130813180129.GC8805@cantiga.alporthouse.com>
 <CA+icZUWcF6bdoD1pSbbtBTAYNMC9237Eas7SemS6kPpnY=c2Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s16502780.onlinehome-server.info ([87.106.93.118]:63903 "EHLO
	fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757602Ab3HMSxu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2013 14:53:50 -0400
Content-Disposition: inline
In-Reply-To: <CA+icZUWcF6bdoD1pSbbtBTAYNMC9237Eas7SemS6kPpnY=c2Sw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, "s.dilek" <s.dilek@jpberlin.de>

On Tue, Aug 13, 2013 at 08:40:37PM +0200, Sedat Dilek wrote:
> On Tue, Aug 13, 2013 at 8:01 PM, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > On Tue, Aug 13, 2013 at 07:53:25PM +0200, Sedat Dilek wrote:
> >> Files attached.
> >
> > Can you also please attach a full dmesg so I can check for anything
> > unusual?
> >

Nothing scarred me on a couple of read throughs.

What happens if you try:

diff --git a/drivers/gpu/drm/i915/i915_gem_stolen.c b/drivers/gpu/drm/i915/i915_gem_stolen.c
index 112c5e1..9828d9b 100644
--- a/drivers/gpu/drm/i915/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/i915_gem_stolen.c
@@ -284,7 +284,7 @@ i915_gem_object_create_stolen(struct drm_device *dev, u32 size)
                return NULL;
 
        ret = drm_mm_insert_node(&dev_priv->mm.stolen, stolen, size,
-                                4096, DRM_MM_SEARCH_DEFAULT);
+                                1024*1024, DRM_MM_SEARCH_DEFAULT);
        if (ret) {
                kfree(stolen);
                return NULL;

-- 
Chris Wilson, Intel Open Source Technology Centre
