From: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Date: Tue, 6 Nov 2018 16:07:25 -0800
Message-ID: <20181107000724.GJ26420@intel.com>
References: <20181107065929.3ded00a6@canb.auug.org.au>
 <20181107000034.GD2367@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181107000034.GD2367@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 06, 2018 at 04:00:34PM -0800, Rodrigo Vivi wrote:
> On Wed, Nov 07, 2018 at 06:59:29AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   35b876db4a42 ("drm/i915/dsc: Add slice_row_per_frame in DSC PPS programming")
> > 
> > is missing a Signed-off-by from its committer.
> 
> It seems the tag "Suggested-by:" tricked out our maintainer tools.

Hmm yea that makes sense since it did have suggested-by: me (committer)
so it skipped adding my sign-off.

Thanks for catching this and fixing it in tools.

Manasi

> 
> from dim:
> 
> # check for committer sign-off
> if ! git show -s $sha1 | grep -qi "S.*-by:.*$committer"  ; then
> 
> -----
> 
> I will send a patch to our tools to spell signed-off-by directly.
> 
> Thanks for reporting this out.
> Rodrigo.
> 
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 
> 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
