From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Thu, 23 May 2019 15:11:15 +0200
Message-ID: <CAKMK7uHvUFtRNn5j6TnmBrs5ndkSuNwJWzB026j2zczaV9O_Tg@mail.gmail.com>
References: <20190521105151.51ffa942@canb.auug.org.au> <20190523115355.joyeqlmbjkufueyn@flea>
 <20190523230409.31da92b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523230409.31da92b9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

On Thu, May 23, 2019 at 3:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Maxime,
>
> On Thu, 23 May 2019 13:53:55 +0200 Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> > >
> > > Today's linux-next merge of the drm-misc tree got a conflict in:
> > >
> > >   Documentation/devicetree/bindings/vendor-prefixes.txt
> > >
> > > between commit:
> > >
> > >   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> > >
> > > from Linus' tree and commits:
> > >
> > >   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
> > >   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9700RTWV43TR-01B")
> > >   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronics")
> > >
> > > from the drm-misc tree.
> >
> > I just took your patch and pushed a temp branch there:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/commit/?h=drm-misc-next&id=3832f2cad5307ebcedeead13fbd8d3cf06ba5e90
> >
> > Rob, Stephen, are you ok with the change? If so, I'll push it.
>
> All that needs to be done is for my patch (slightly corrected) needs to
> be applied to the drm-misc tree.  That tree already has the back merge
> of Linus' tree and the txt file has been removed (my patch should have
> been applied as part of the merge resolution but doing it later is fine).

That commit is on top of drm-misc, and somehow the .txt version has
been resurrect in drm-misc-next (so needs to be re-deleted too).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
