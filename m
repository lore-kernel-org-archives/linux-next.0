From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-fixes tree
Date: Fri, 24 May 2019 10:09:28 +0200
Message-ID: <CAKMK7uGSfOev71DKF+ygRjU0rMWcrW3rL7-=Xhbwdm9STUWntQ@mail.gmail.com>
References: <20190524082926.6e1a7d8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524082926.6e1a7d8f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 24, 2019 at 12:29 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'load_dmcu_fw':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:667:7: error: implicit declaration of function 'ASICREV_IS_PICASSO'; did you mean 'ASICREV_IS_VEGA12_P'? [-Werror=implicit-function-declaration]
>    if (ASICREV_IS_PICASSO(adev->external_rev_id))
>        ^~~~~~~~~~~~~~~~~~
>        ASICREV_IS_VEGA12_P
>
> Caused by commit
>
>   55143dc23ca4 ("drm/amd/display: Don't load DMCU for Raven 1")
>
> I have reverted that commit for today.

Seems to compile fine here, and Dave just sent out the pull so I guess
works for him too. What's your .config?
-Daniel

>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
