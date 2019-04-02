From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 07:10:41 -0700
Message-ID: <20190402141041.GF22763@bombadil.infradead.org>
References: <20190402105006.48f93e53@canb.auug.org.au>
 <CAKGbVbvj9cZnJuey_ra7U+xm-JhoB17bpTgcXKiKaHWbjB9Sxw@mail.gmail.com>
 <20190402112656.GE22763@bombadil.infradead.org>
 <CAKGbVbuY3mKAZ6bA9G87NHq7mdxkw95p7OoO_QyUU_101yQEuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKGbVbuY3mKAZ6bA9G87NHq7mdxkw95p7OoO_QyUU_101yQEuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qiang Yu <yuq825@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 02, 2019 at 09:56:08PM +0800, Qiang Yu wrote:
> On Tue, Apr 2, 2019 at 7:26 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Apr 02, 2019 at 01:55:03PM +0800, Qiang Yu wrote:
> > > Thanks, patch is:
> > > Reviewed-by: Qiang Yu <yuq825@gmail.com>
> >
> > This looks like a fairly naive conversion from the old IDR API to the
> > XArray API.  You should be able to remove mgr->lock entirely, relying on
> > the xa_lock for synchronising free and get.
> 
> I'm afraid the a little complex free path may involve some might sleep
> functions so use a mutex lock instead of spinlock.

Ah, good call ...

+       mutex_lock(&mgr->lock);
+       ctx = xa_erase(&mgr->handles, id);
+       if (ctx)
+               kref_put(&ctx->refcnt, lima_ctx_do_release);
+       else
+               ret = -EINVAL;
+       mutex_unlock(&mgr->lock);

+static void lima_ctx_do_release(struct kref *ref)
+{
+       struct lima_ctx *ctx = container_of(ref, struct lima_ctx, refcnt);
+       int i;
+
+       for (i = 0; i < lima_pipe_num; i++)
+               lima_sched_context_fini(ctx->dev->pipe + i, ctx->context + i);
+       kfree(ctx);
+}

+void lima_sched_context_fini(struct lima_sched_pipe *pipe,
+                            struct lima_sched_context *context)
+{
+       drm_sched_entity_fini(&context->base);
+}

and drm_sched_entity_fini() can call kthread_park(), which does sleep.

> > If you think it's worth it,
> > you could even use kfree_rcu() to free the ctx and kref_get_unless_zero()
> > and then your get path would be lock-free.
> 
> I can take a look this way, thanks.

I think that's the only way you can get rid of the mutex, given the
sleeping functions called in the free path.
