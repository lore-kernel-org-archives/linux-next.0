From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 09:57:44 +0200
Message-ID: <20190402075744.GC2665@phenom.ffwll.local>
References: <20190402105006.48f93e53@canb.auug.org.au>
 <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qiang Yu <yuq825@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 02, 2019 at 01:55:03PM +0800, Qiang Yu wrote:
> Thanks, patch is:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>

Good time to get started with committing patches? In general it's kinda
confusing if the maintainer r-bs a patch, but doesn't say whether/when/how
it gets merged. Big chance the patch will get lost in limbo and fall
through cracks.
-Daniel

> 
> Regards,
> Qiang
> 
> On Tue, Apr 2, 2019 at 7:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > In file included from include/linux/kernel.h:7,
> >                  from include/asm-generic/bug.h:18,
> >                  from arch/x86/include/asm/bug.h:83,
> >                  from include/linux/bug.h:5,
> >                  from include/linux/mmdebug.h:5,
> >                  from include/linux/gfp.h:5,
> >                  from include/linux/slab.h:15,
> >                  from drivers/gpu/drm/lima/lima_ctx.c:4:
> > drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_create':
> > include/linux/limits.h:13:18: warning: passing argument 3 of 'xa_alloc' makes pointer from integer without a cast [-Wint-conversion]
> >  #define UINT_MAX (~0U)
> >                   ^~~~~
> > drivers/gpu/drm/lima/lima_ctx.c:26:36: note: in expansion of macro 'UINT_MAX'
> >   err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
> >                                     ^~~~~~~~
> > In file included from include/linux/radix-tree.h:31,
> >                  from include/linux/idr.h:15,
> >                  from include/drm/drm_device.h:7,
> >                  from drivers/gpu/drm/lima/lima_device.h:7,
> >                  from drivers/gpu/drm/lima/lima_ctx.c:6:
> > include/linux/xarray.h:817:9: note: expected 'void *' but argument is of type 'unsigned int'
> >    void *entry, struct xa_limit limit, gfp_t gfp)
> >    ~~~~~~^~~~~
> > drivers/gpu/drm/lima/lima_ctx.c:26:46: error: incompatible type for argument 4 of 'xa_alloc'
> >   err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
> >                                               ^~~
> > In file included from include/linux/radix-tree.h:31,
> >                  from include/linux/idr.h:15,
> >                  from include/drm/drm_device.h:7,
> >                  from drivers/gpu/drm/lima/lima_device.h:7,
> >                  from drivers/gpu/drm/lima/lima_ctx.c:6:
> > include/linux/xarray.h:817:32: note: expected 'struct xa_limit' but argument is of type 'struct lima_ctx *'
> >    void *entry, struct xa_limit limit, gfp_t gfp)
> >                 ~~~~~~~~~~~~~~~~^~~~~
> >
> > Caused by commit
> >
> >   a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> >
> > interacting with commit
> >
> >   a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")
> >
> > from Linus' tree (v5.1-rc1).
> >
> > I have applied the following patch for today.  It could be applied as
> > part of a merge of v5.1-rc1 into drm-misc.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 2 Apr 2019 10:45:32 +1100
> > Subject: [PATCH] drm/lima: update for xa_alloc API change
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/lima/lima_ctx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
> > index c8d12f7c6894..bafa00d74cc5 100644
> > --- a/drivers/gpu/drm/lima/lima_ctx.c
> > +++ b/drivers/gpu/drm/lima/lima_ctx.c
> > @@ -23,7 +23,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
> >                         goto err_out0;
> >         }
> >
> > -       err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
> > +       err = xa_alloc(&mgr->handles, id, ctx, XA_LIMIT(*id, UINT_MAX), GFP_KERNEL);
> >         if (err < 0)
> >                 goto err_out0;
> >
> > --
> > 2.20.1
> >
> > --
> > Cheers,
> > Stephen Rothwell

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
