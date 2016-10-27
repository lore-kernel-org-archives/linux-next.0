From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: Tree for Oct 25
Date: Thu, 27 Oct 2016 08:21:33 +0200
Message-ID: <20161027062121.ofj2whaaohokfswb@phenom.ffwll.local>
References: <20161025143134.7ab67718@canb.auug.org.au>
 <CAP=VYLqdh2E17pZmEwQWS66Y9jdx-3SHsZkt5e4nitpg1N-A_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLqdh2E17pZmEwQWS66Y9jdx-3SHsZkt5e4nitpg1N-A_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, airlied@linux.ie, dri-devel@lists.freedesktop.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, zhi.a.wang@intel.com
List-Id: linux-next.vger.kernel.org

On Tue, Oct 25, 2016 at 09:09:33PM -0400, Paul Gortmaker wrote:
> On Mon, Oct 24, 2016 at 11:31 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > There will probably be no linux-next releases next week while I attend
> > the Kernel Summit.
> >
> > Changes since 20161024:
> >
> > The pm tree gained a conflict against the imx-mxs tree.
> >
> > The mali-dp tree gained a conflict against the drm-misc tree.
> >
> > The sunxi tree gained a build failure so I used the version from
> > next-20161024.
> >
> > The akpm-current tree still had its build failures for which I applied
> > 2 patches.
> >
> > Non-merge commits (relative to Linus' tree): 2174
> >  2622 files changed, 187829 insertions(+), 38953 deletions(-)
> 
> The i386 allmodconfig fails with bad 32/64 math for about the last 5 days.
> 
> ERROR: "__umoddi3" [drivers/gpu/drm/i915/i915.ko] undefined!
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12840554/
> 
> git bisect says:
> 
> first bad commit: [4d60c5fd3f8751ea751d6dc6cfe0c1620420ccf8]
> drm/i915/gvt: vGPU PCI configuration space virtualization
> 
> Authors/maintainers added to Cc/To list.   Guessing folks weren't
> aware of the regression.

The fix is in-flight. Thanks anyway for the report.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
