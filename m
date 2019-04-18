From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: Fixes tag needs some work in the drm-fixes tree
Date: Thu, 18 Apr 2019 09:39:59 +0200
Message-ID: <CAKMK7uHiZLLcnotJyb1jK2tJ0iKqk4cQpvpy_x+AHih34_QCSw@mail.gmail.com>
References: <20190418074658.541fcfd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418074658.541fcfd7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, Apr 17, 2019 at 11:47 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   453393369dc9 ("drm/ttm: fix incrementing the page pointer for huge pages")
>
> Fixes tag
>
>   Fixes: e16858a7e6e7 drm/ttm: fix start page for huge page check in ttm_put_pages()
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: ac1e516d5a4c ("drm/ttm: fix start page for huge page check in ttm_put_pages()")

Uh, our tooling should have caught this, and more:

dim: WARNING: Issues in pull request detected, but continuing dry-run
dim: b575f10dbd6f ("drm/amdgpu: shadow in shadow_list without
tbo.mem.start cause page fault in sriov TDR"): author Signed-off-by
missing.

^^ Wentao Lou should fix their git author, it looks a bit more like a
login id than a proper name

dim: 453393369dc9 ("drm/ttm: fix incrementing the page pointer for
huge pages"): SHA1 in fixes line not found:
dim:     e16858a7e6e7 drm/ttm: fix start page for huge page check in
ttm_put_pages()

^^ There we are.

dim: WARNING: issues in commits detected, but continuing dry-run

Dave, maybe drop the default dim -f you probably have in your history
somewhere :-)
Alex, another excuse to at lest copypaste the checks from dim? Or push
your tree using dim first, for these checks (you can still do all the
internal tree dancing for whatever reasons).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
