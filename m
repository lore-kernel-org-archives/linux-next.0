From: Vincent ABRIOU <vincent.abriou@st.com>
Subject: RE: linux-next: build failure after merge of the drm tree
Date: Wed, 25 Jan 2017 10:52:39 +0000
Message-ID: <1e7d5e40781c4248a150894f91d0db40@SFHDAG5NODE1.st.com>
References: <20170124122515.07a3fcc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170124122515.07a3fcc8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Dave,

Here is the patch from Chris Wilson to solve the build issue:
[PATCH] drm/sti: Fix compilation failure for drm_framebuffer.pixel_format

BR
Vincent

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: mardi 24 janvier 2017 02:25
> To: Dave Airlie <airlied@linux.ie>
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Vincent
> ABRIOU <vincent.abriou@st.com>; Ville Syrjälä
> <ville.syrjala@linux.intel.com>
> Subject: linux-next: build failure after merge of the drm tree
> 
> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpu/drm/sti/sti_plane.c: In function 'sti_plane_update_fps':
> drivers/gpu/drm/sti/sti_plane.c:76:33: error: 'struct drm_framebuffer' has
> no member named 'pixel_format'
>      (char *)&plane->drm_plane.fb->pixel_format,
>                                  ^
> 
> Caused by commit
> 
>   a69e466b0666 ("drm/sti: update fps debugfs entries")
> 
> Interacting with commit
> 
>   438b74a5497c ("drm: Nuke fb->pixel_format")
> 
> This should have been fixed up in commit
> 
>   d64a1661c8f7 ("Merge tag 'sti-drm-next-2017-01-06' of
> https://github.com/vinceab/linux into drm-next")
> 
> I have used the drm tree from next-20170123 for today.
> 
> --
> Cheers,
> Stephen Rothwell
