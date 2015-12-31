From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 31 Dec 2015 13:14:19 +0800
Message-ID: <5684B9AB.7000703@rock-chips.com>
References: <20151231134011.165b239b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151231134011.165b239b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2015=E5=B9=B412=E6=9C=8831=E6=97=A5 10:40, Stephen Rothwell wrote:
> Hi Dave,
>
> After merging the drm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> ERROR: "vop_component_ops" [drivers/gpu/drm/rockchip/rockchip_vop_reg=
=2Eko] undefined!
>
> Caused by commit
>
>    a67719d18229 ("drm/rockchip: vop: spilt register related into rock=
chip_reg_vop.c")
>
> I have added the following fix patch for today (just because its
> Christmas :-)):
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 31 Dec 2015 13:35:27 +1100
> Subject: [PATCH] drm/rockchip: vop: export vop_component_ops to modul=
es
>
> Fixes: a67719d18229 ("drm/rockchip: vop: spilt register related into =
rockchip_reg_vop.c")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_vop.c
> index d83bf87ba71e..f5b3da2f92d7 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1395,3 +1395,4 @@ const struct component_ops vop_component_ops =3D=
 {
>   	.bind =3D vop_bind,
>   	.unbind =3D vop_unbind,
>   };
> +EXPORT_SYMBOL_GPL(vop_component_ops);
Hi Stephen

Thanks for the fix, Sorry for forgetting test it with modules,  and

Acked-by: Mark Yao <mark.yao@rock-chips.com>

Hi Dave
    Can you pick this one?


Thanks.:-)

--=20
=EF=BC=ADark Yao
