From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: Tree for Aug 13 [ screen corruption in graphical
 mode ]
Date: Tue, 13 Aug 2013 10:25:54 +0100
Message-ID: <20130813092554.GA4519@cantiga.alporthouse.com>
References: <CA+icZUWmee5nTZCGvFb4vLpna5vUn+RJ-V9pHpKPFaTc96BG5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUWmee5nTZCGvFb4vLpna5vUn+RJ-V9pHpKPFaTc96BG5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 13, 2013 at 11:10:18AM +0200, Sedat Dilek wrote:
> Hi,
> 
> with today's next-20130813 I cannot see 1/10 of my desktop-screen's
> top, it's simply black.
> I can estimate the URL line in Firefox (or open a new tab blindly and
> get a known URL from my autocompleted history).

Can you attach a photograph?
 
> My Xorg stack did not change: libdrm-2.4.46 | mesa-9.16 | intel-ddx-2.4.14.
> next-20130808 was OK - no screen corruptions.
> 
> Any idea, hint?

Can you please try:

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index af1b2f0..b0f181d 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -1837,7 +1837,7 @@ intel_pin_and_fence_fb_obj(struct drm_device *dev,
                break;
        case I915_TILING_X:
                /* pin() will align the object as required by fence */
-               alignment = 0;
+               alignment = 256 * 1024;
                break;
        case I915_TILING_Y:
                /* Despite that we check this in framebuffer_init userspace can

-- 
Chris Wilson, Intel Open Source Technology Centre
