From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Date: Fri, 24 May 2019 18:19:22 +0200
Message-ID: <20190524161922.GB21222@phenom.ffwll.local>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
 <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
 <20190524201548.2e8594a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524201548.2e8594a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 24, 2019 at 08:15:48PM +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Fri, 24 May 2019 10:09:28 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, May 24, 2019 at 12:29 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the drm-fixes tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'load_dmcu_fw':
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: error: implicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASICREV_IS_VEGA12_P'? [-Werror=implicit-function-declaration]
> > >    if (ASICREV_IS_PICASSO(adev->external_rev_id))
> > >        ^~~~~~~~~~~~~~~~~~
> > >        ASICREV_IS_VEGA12_P
> > >
> > > Caused by commit
> > >
> > >   55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")
> > >
> > > I have reverted that commit for today.  
> > 
> > Seems to compile fine here, and Dave just sent out the pull so I guess
> > works for him too. What's your .config?
> 
> See above "x86_64 allmodconfig"
> 
> Looking at it closely now, I can't see how that error comes about.
> 
> Ah, in the drm-fixes tree, the definition of  is protected by
> 
>   #if defined(CONFIG_DRM_AMD_DC_DCN1_01)
> 
> which gets removed in the amdgpu tree (merged later).  So I can only
> presume that CONFIG_DRM_AMD_DC_DCN1_01 was not set for the build I did.
> 
> config DRM_AMD_DC
>         bool "AMD DC - Enable new display engine"
>         default y
>         select DRM_AMD_DC_DCN1_0 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_
> COMPARISONS)KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS
>         select DRM_AMD_DC_DCN1_01 if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> 
> So maybe KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS are set for
> allmodconfig.  I no longer have the actual .config file any more, sorry.

Ah yes. Dave figured it out too and added a revert on top and redid the
pull to Linus. Thanks for spotting&reporting this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
