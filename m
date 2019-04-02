From: Qiang Yu <yuq825@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 21:33:25 +0800
Message-ID: <CAKGbVbt4W8UUST8HZ0tPuHyGv4qx98hMqmkhWmJB5K-TbReg5A@mail.gmail.com>
References: <20190402105006.48f93e53@canb.auug.org.au> <20190402112113.GD22763@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402112113.GD22763@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 2, 2019 at 7:21 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Apr 02, 2019 at 10:50:06AM +1100, Stephen Rothwell wrote:
> > +++ b/drivers/gpu/drm/lima/lima_ctx.c
> > @@ -23,7 +23,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
> >                       goto err_out0;
> >       }
> >
> > -     err = xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
> > +     err = xa_alloc(&mgr->handles, id, ctx, XA_LIMIT(*id, UINT_MAX), GFP_KERNEL);
> >       if (err < 0)
> >               goto err_out0;
>
> I agree that this is an exact translation of what the code was doing,
> but I don't think it's what the author intended the code to do.
> They almost certainly meant:
>
>         err = xa_alloc(&mgr->handles, id, ctx, xa_limit_32b, GFP_KERNEL);
>
> I'm basing this on:
>
> +struct drm_lima_ctx_create {
> +       __u32 id;          /* out, context handle */
> +       __u32 _pad;        /* pad, must be zero */
> +};
>
> (and this confusion is exactly why I changed the API ...)

Right, I plan to send out a patch like yours after drm-misc-next merge
5.1 changes, as this is a build fix patch and already applied to somewhere.
I can send out another patch now if merge guys could use the new one
directly.
