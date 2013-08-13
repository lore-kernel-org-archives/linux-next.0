From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: Tree for Aug 13 [ screen corruption in graphical
 mode ]
Date: Tue, 13 Aug 2013 18:13:24 +0100
Message-ID: <20130813171324.GB8805@cantiga.alporthouse.com>
References: <CA+icZUVEcCTbBre99FWiDXRAMKcdQxUagXE-2-rO9g=YVUAieQ@mail.gmail.com>
 <20130813095259.GC4519@cantiga.alporthouse.com>
 <CA+icZUX6KM3dKrdX3Qkwg-DeBYobjQ+WG6oQEUjJQG3Q=qf+Sg@mail.gmail.com>
 <CA+icZUWPdivbDc=cBUR2BJzKGwWwK-P0OP0CZ5EfCupii7sP_w@mail.gmail.com>
 <CA+icZUUKH6Fa8WksqA69FXKUUJmKsNdXv0ZJH50HA2mFavfPCg@mail.gmail.com>
 <CA+icZUXC73i4hO7LHDQ=85__JtrZmSMB+KyUnS+G6vRmm_=tkg@mail.gmail.com>
 <CA+icZUXdS3EuXyGZiS1--rMu6H0ospzCiK_CXgPv8mOk0sMt+Q@mail.gmail.com>
 <20130813163439.GA8805@cantiga.alporthouse.com>
 <CA+icZUX8HZD3z-uwTMWX9CoLdYYqyPVuhH-vWGhJuoonvMQTbQ@mail.gmail.com>
 <CA+icZUU1tbHGVPgjXNvsq-F44O6umbhp_bFcoLE35HZ0zTqo2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUU1tbHGVPgjXNvsq-F44O6umbhp_bFcoLE35HZ0zTqo2g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, DRI <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, "s.dilek" <s.dilek@jpberlin.de>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 13, 2013 at 07:03:44PM +0200, Sedat Dilek wrote:
> On Tue, Aug 13, 2013 at 6:37 PM, Sedat Dilek <sedat.dilek@gmail.com> =
wrote:
> > On Tue, Aug 13, 2013 at 6:34 PM, Chris Wilson <chris@chris-wilson.c=
o.uk> wrote:
> >> On Tue, Aug 13, 2013 at 06:23:29PM +0200, Sedat Dilek wrote:
> >>> On Tue, Aug 13, 2013 at 5:59 PM, Sedat Dilek <sedat.dilek@gmail.c=
om> wrote:
> >>> > I have bisected the issue on Linux v3.11-rc5 + drm-intel-nightl=
y:
> >>> >
> >>> > 5456fe3882812aba251886e36fe55bfefb8e8829 is the first bad commi=
t
> >>> > commit 5456fe3882812aba251886e36fe55bfefb8e8829
> >>> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> >>> > Date:   Thu Aug 8 14:41:07 2013 +0100
> >>> >
> >>> >     drm/i915: Allocate LLC ringbuffers from stolen
> >>> >
> >>> >     As stolen objects now behave identically (wrt to default LL=
C cacheing)
> >>> >     as their normal system counterparts, we no longer have to d=
ifferentiate
> >>> >     our usage for ringbuffers. So allocate them from stolen on =
SNB+ as well.
> >>> >
> >>> >     Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >>> >     Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.c=
om>
> >>> >     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> >
> >>> > :040000 040000 de063a052f39095f4d2f51b49caef9f827df41e8
> >>> > 1c819aa5501a9fcc9912a5c7c037c71b9b9e9a6b M      drivers
> >>> >
> >>> > See also attached files!
> >>> >
> >>>
> >>> With the attached revert-patch my system is OK (with my customize=
d X stack).
> >>
> >> No indication of a GPU hang? I'm puzzled as to how this ends up wi=
th the
> >> scanout being misread.
> >>
> >> cat /sys/kernel/debug/dri/0/i915_gem_stolen
> >> cat /sys/kernel/debug/dri/0/i915_gem_framebuffer
> >>
> >> would be interesting.

> Attached both outputs with GOOD and BAD (BROKEN) kernel.

ggtt offset is the same for both setups, the only difference between th=
e
two is the location of fbcon in stolen memory.

Can you please attach the output of intel_reg_dumper for good/bad? It's
a long shot...

Speaking of long shots, try this (slightly different to the earlier pat=
ch):

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i91=
5/intel_display.c
index a21f935..37ad772 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -1850,6 +1850,9 @@ intel_pin_and_fence_fb_obj(struct drm_device *dev=
,
                BUG();
        }
=20
+       if (obj->stolen && INTEL_INFO(dev)->gen >=3D 6)
+               alignment =3D 256 * 1024;
+
        /* Note that the w/a also requires 64 PTE of padding following =
the
         * bo. We currently fill all unused PTE with the shadow page an=
d so
         * we should always have valid PTE following the scanout preven=
ting


--=20
Chris Wilson, Intel Open Source Technology Centre
