From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Mon, 31 Jul 2017 15:02:27 +1000
Message-ID: <20170731150227.58ea271b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, JB Van Puyvelde <jbvanpuyvelde@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/staging/media/atomisp/i2c/imx/imx.c:1087:12: warning: 'imx_vcm_power_up' defined but not used [-Wunused-function]
 static int imx_vcm_power_up(struct v4l2_subdev *sd)
            ^
drivers/staging/media/atomisp/i2c/imx/imx.c:1095:12: warning: 'imx_vcm_power_down' defined but not used [-Wunused-function]
 static int imx_vcm_power_down(struct v4l2_subdev *sd)
            ^
drivers/staging/media/atomisp/i2c/imx/imx.c:1103:12: warning: 'imx_vcm_init' defined but not used [-Wunused-function]
 static int imx_vcm_init(struct v4l2_subdev *sd)
            ^
drivers/staging/media/atomisp/i2c/imx/imx.c:1111:12: warning: 'imx_t_focus_vcm' defined but not used [-Wunused-function]
 static int imx_t_focus_vcm(struct v4l2_subdev *sd, u16 val)
            ^

Introduced by commit

  9a5a6911aa3f ("staging: imx: fix non-static declarations")

-- 
Cheers,
Stephen Rothwell
