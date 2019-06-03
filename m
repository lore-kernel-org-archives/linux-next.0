From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: unable to fetch the drm-intel-fixes tree
Date: Mon, 3 Jun 2019 09:31:03 +0200
Message-ID: <20190603073103.GC21222@phenom.ffwll.local>
References: <20190603082051.273a014c@canb.auug.org.au>
 <20190603110403.0412ed22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603110403.0412ed22@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 03, 2019 at 11:04:03AM +1000, Stephen Rothwell wrote:
> Hi Stephen,
> 
> On Mon, 3 Jun 2019 08:20:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > Trying to fetch the drm-intel-fixes tree today gives me this error:
> > 
> > -----------------------------------------------------------------
> > fatal: Could not read from remote repository.
> > 
> > Please make sure you have the correct access rights
> > and the repository exists.
> > -----------------------------------------------------------------
> > 
> > The same for drm-misc-fixes, drm-intel and drm-misc.  These are all
> > hosted on git://anongit.freedesktop.org/ .
> 
> Also the drm-tegra tree.

drm.git too I guess?

But yeah fd.o anongit keeled over over the w/e :-( Admins not yet awake,
so can't tell you what's up.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
