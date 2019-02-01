From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the drm tree
Date: Fri, 1 Feb 2019 15:34:46 -0500
Message-ID: <CADnq5_O3rGYGi95pB_0-xxODpcKYdB_ZaHcNS9zzBRGorE2oMg@mail.gmail.com>
References: <20190201105736.1428c9fc@canb.auug.org.au> <CAKMK7uGf7X3m3Hp1r3-RSrKvGqsJK61WAMQ7goFP_28GAieP2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKMK7uGf7X3m3Hp1r3-RSrKvGqsJK61WAMQ7goFP_28GAieP2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Ken Chalmers <ken.chalmers@amd.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 1, 2019 at 5:05 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Feb 1, 2019 at 12:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   a93587b31e34 ("drm/amd/display: Only get the connector state for VRR when toggled")
> >
> > Fixes tag
> >
> >   Fixes: 3cc22f281318 ("drm/amdgpu: Set FreeSync state using drm VRR properties")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe instead:
> >
> >   FIxes: bb47de736661 ("drm/amdgpu: Set FreeSync state using drm VRR properties")
> >
> > In commit
> >
> >   32e61361b82e ("drm/amd/display: Fix 64-bit division for 32-bit builds")
> >
> > Fixes tag
> >
> >   Fixes: https://lists.freedesktop.org/archives/dri-devel/2018-December/201008.html
> >
> > has these problem(s):
> >
> >   - No SHA1 recognised
> >
> > Maybe instead:
> >
> >   Fixes: 80604e27bc9 ("drm/amd/display: Use 100 Hz precision for pipe pixel clocks")
> >
> > In commit
> >
> >   c4312c27c826 ("drm/amdgpu: Cleanup 2 compiler warnings")
> >
> > Fixes tag
> >
> >   Fixes: e4ae0fc drm/amdgpu: implement gfx8 post_soft_reset
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> >     or later) just making sure it is not set (or set to "auto").
> >
> > Fixes tag
> >
> >   Fixes: 5e01c09 drm/amdgpu/gfx_v8_0: Reorder the gfx, kiq and kcq rings
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe instead:
> >
> >   Fixes: c6064de4b734 ("drm/amdgpu/gfx_v8_0: Reorder the gfx, kiq and kcq rings test sequence")
>
> Yeah the top 71 commits in the latest amdgpu pull got rebased, which
> is a bit much. Where are we with the "direct group commit, no more
> rebases" project for amd? Still stuck on CI troubles?

In fairness, some of the rebasing was to squash in some bug fixes to
help with bisecting.  As to direct commit, not enough internal
priority at the moment and too many other projects.  I'll try to
double check them better going forward.

Alex

>
> Another one: Is the above checker script available somewhere, could be
> useful to put that into our own scripts to make sure this doesn't
> happen again.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
