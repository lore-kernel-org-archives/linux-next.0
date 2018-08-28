From: Sean Paul <sean@poorly.run>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 drm-misc-fixes tree
Date: Tue, 28 Aug 2018 15:34:51 -0400
Message-ID: <20180828193451.GI45089@art_vandelay>
References: <20180828072959.631b9dbc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828072959.631b9dbc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Sean Paul <seanpaul@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 28, 2018 at 07:29:59AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ccb748df0058 ("drm/vc4: Fix the "no scaling" case on multi-planar YUV formats")
> 
> is missing a Signed-off-by from its committer.
> 
> It was rebased.

Hi Stephen,
I've fixed the commit and fixed our tooling to avoid this in the future. Thanks
for the poke,

Sean

> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Sean Paul, Software Engineer, Google / Chromium OS
