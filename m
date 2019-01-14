From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the mali-dp tree
Date: Mon, 14 Jan 2019 11:29:16 +0000
Message-ID: <20190114112916.GN20661@e110455-lin.cambridge.arm.com>
References: <20190114110909.39a7285c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114110909.39a7285c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 14, 2019 at 11:09:09AM +1100, Stephen Rothwell wrote:
> Hi Liviu,

Hi Stephen,

> 
> Commits
> 
>   31849148cb41 ("drm/komeda: Add komeda_framebuffer")
>   b347a024e10b ("drm/komeda: Add komeda_format_caps for format handling")
>   274d16527e45 ("drm/komeda: Add DT parsing")
>   f20978344694 ("drm/komeda: Build komeda to be a platform module")
>   f8eff4b21a16 ("drm/arm: Delete redundant CONFIG_DRM_ARM")
> 
> are missing a Signed-off-by from their committer.

Sorry about that! I have now fixed those commits and also the build
failure you were seeing.

Best regards,
Liviu

> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
