From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 10 (media/i2c/ov2659)
Date: Fri, 10 Apr 2015 10:06:35 -0700
Message-ID: <5528031B.60408@infradead.org>
References: <20150410211806.574ae8f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150410211806.574ae8f9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-media <linux-media@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 04/10/15 04:18, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150409:
> 

on x86_64:
when # CONFIG_VIDEO_V4L2_SUBDEV_API is not set:


  CC [M]  drivers/media/i2c/ov2659.o
../drivers/media/i2c/ov2659.c: In function 'ov2659_get_fmt':
../drivers/media/i2c/ov2659.c:1054:3: error: implicit declaration of function 'v4l2_subdev_get_try_format' [-Werror=implicit-function-declaration]
   mf = v4l2_subdev_get_try_format(sd, cfg, 0);
   ^
../drivers/media/i2c/ov2659.c:1054:6: warning: assignment makes pointer from integer without a cast [enabled by default]
   mf = v4l2_subdev_get_try_format(sd, cfg, 0);
      ^
../drivers/media/i2c/ov2659.c: In function 'ov2659_set_fmt':
../drivers/media/i2c/ov2659.c:1129:6: warning: assignment makes pointer from integer without a cast [enabled by default]
   mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
      ^
../drivers/media/i2c/ov2659.c: In function 'ov2659_open':
../drivers/media/i2c/ov2659.c:1264:38: error: 'struct v4l2_subdev_fh' has no member named 'pad'
     v4l2_subdev_get_try_format(sd, fh->pad, 0);
                                      ^



-- 
~Randy
