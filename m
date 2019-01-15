From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: build failure after merge of the mali-dp tree
Date: Tue, 15 Jan 2019 10:12:19 +0000
Message-ID: <20190115101219.GP20661@e110455-lin.cambridge.arm.com>
References: <20190115104619.516be4b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115104619.516be4b9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 15, 2019 at 10:46:19AM +1100, Stephen Rothwell wrote:
> Hi Liviu,

Hi Stephen,

> 
> After merging the mali-dp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c: In function 'komeda_pipeline_obj_add':
> drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:30: error: passing argument 1 of 'drm_atomic_private_obj_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   drm_atomic_private_obj_init(&pipe->obj, &st->obj,
>                               ^~~~~~~~~~
> In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:11,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:7:
> include/drm/drm_atomic.h:437:53: note: expected 'struct drm_device *' but argument is of type 'struct drm_private_obj *'
>  void drm_atomic_private_obj_init(struct drm_device *dev,
>                                   ~~~~~~~~~~~~~~~~~~~^~~
> drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:42: error: passing argument 2 of 'drm_atomic_private_obj_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   drm_atomic_private_obj_init(&pipe->obj, &st->obj,
>                                           ^~~~~~~~
> In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:11,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:7:
> include/drm/drm_atomic.h:438:30: note: expected 'struct drm_private_obj *' but argument is of type 'struct drm_private_state *'
>       struct drm_private_obj *obj,
>       ~~~~~~~~~~~~~~~~~~~~~~~~^~~
> drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:49:9: error: passing argument 3 of 'drm_atomic_private_obj_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>          &komeda_pipeline_obj_funcs);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:11,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:7:
> include/drm/drm_atomic.h:439:32: note: expected 'struct drm_private_state *' but argument is of type 'const struct drm_private_state_funcs *'
>       struct drm_private_state *state,
>       ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:2: error: too few arguments to function 'drm_atomic_private_obj_init'
>   drm_atomic_private_obj_init(&pipe->obj, &st->obj,
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:11,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
>                  from drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:7:
> include/drm/drm_atomic.h:437:6: note: declared here
>  void drm_atomic_private_obj_init(struct drm_device *dev,
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
> 
> interacting with commit
> 
>   b962a12050a3 ("drm/atomic: integrate modeset lock with private objects")
> 
> from the drm tree.
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 15 Jan 2019 10:42:04 +1100
> Subject: [PATCH] drm/komeda: merge fix for drm_atomic_private_obj_init() API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> index 9edfd6ab0c12..f1c9e3fefa86 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> @@ -45,7 +45,7 @@ static int komeda_pipeline_obj_add(struct komeda_kms_dev *kms,
>  		return -ENOMEM;
>  
>  	st->pipe = pipe;
> -	drm_atomic_private_obj_init(&pipe->obj, &st->obj,
> +	drm_atomic_private_obj_init(&kms->base, &pipe->obj, &st->obj,
>  				    &komeda_pipeline_obj_funcs);

That looks like the right fix, thank you for that! I will roll your
patch into my tree.

Best regards,
Liviu

>  
>  	return 0;
> -- 
> 2.20.1
> 
> -- 
> Cheers,
> Stephen Rothwell



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
