From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Wed, 9 Aug 2017 11:25:22 +1000
Message-ID: <20170809112522.1b2563ad@canb.auug.org.au>
References: <20170731150227.58ea271b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751973AbdHIBZY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 21:25:24 -0400
In-Reply-To: <20170731150227.58ea271b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, JB Van Puyvelde <jbvanpuyvelde@gmail.com>

Hi all,

On Mon, 31 Jul 2017 15:02:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/staging/media/atomisp/i2c/imx/imx.c:1087:12: warning: 'imx_vcm_power_up' defined but not used [-Wunused-function]
>  static int imx_vcm_power_up(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1095:12: warning: 'imx_vcm_power_down' defined but not used [-Wunused-function]
>  static int imx_vcm_power_down(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1103:12: warning: 'imx_vcm_init' defined but not used [-Wunused-function]
>  static int imx_vcm_init(struct v4l2_subdev *sd)
>             ^
> drivers/staging/media/atomisp/i2c/imx/imx.c:1111:12: warning: 'imx_t_focus_vcm' defined but not used [-Wunused-function]
>  static int imx_t_focus_vcm(struct v4l2_subdev *sd, u16 val)
>             ^
> 
> Introduced by commit
> 
>   9a5a6911aa3f ("staging: imx: fix non-static declarations")

There is now another copy of this commit in the v4l-dvb tree producing
the same warnings :-(

-- 
Cheers,
Stephen Rothwell
