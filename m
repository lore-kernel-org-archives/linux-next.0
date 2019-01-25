From: "Li, Weinan Z" <weinan.z.li@intel.com>
Subject: RE: linux-next: Fixes tag needs some work in the drm-intel-fixes
 tree
Date: Fri, 25 Jan 2019 01:21:26 +0000
Message-ID: <9BD218709B5F2A4F96F08B4A3B98A8977335C38E@SHSMSX101.ccr.corp.intel.com>
References: <20190124221949.4c89542a@canb.auug.org.au>
 <87munq1e9u.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87munq1e9u.fsf@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jani Nikula <jani.nikula@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Thank Stephen.
I am not sure about the problem. The commit id "0cce2823ed37" is just for the patch of "drm/i915/gvt: Refine error handling for prepare_execlist_workload". Is there any other problems I missed?

Regards.
-Weinan


> -----Original Message-----
> From: Jani Nikula [mailto:jani.nikula@linux.intel.com]
> Sent: Thursday, January 24, 2019 7:33 PM
> To: Stephen Rothwell <sfr@canb.auug.org.au>; Daniel Vetter
> <daniel.vetter@ffwll.ch>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Intel Graphics
> <intel-gfx@lists.freedesktop.org>; DRI <dri-devel@lists.freedesktop.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Li, Weinan Z <weinan.z.li@intel.com>; Zhenyu
> Wang <zhenyuw@linux.intel.com>
> Subject: Re: linux-next: Fixes tag needs some work in the drm-intel-fixes tree
> 
> On Thu, 24 Jan 2019, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > In commit
> >
> >   0f7555121609 ("drm/i915/gvt: release shadow batch buffer and wa_ctx
> > before destroy one workload")
> >
> > Fixes tag
> >
> >   Fixes: 0cce2823ed37 ("drm/i915/gvt/kvmgt:Refine error handling for
> > prepare_execlist_workload")
> >
> > has these problem(s):
> >
> >   - Subject does not match target commit subject
> >
> > Just some whitespace.
> 
> Thanks for the report. The commit being referenced seems to be the right one,
> though, so I don't think I'm going to force push to fix this.
> 
> BR,
> Jani.
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
