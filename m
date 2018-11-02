From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: linux-next: build warning in Linus' tree tree
Date: Fri, 2 Nov 2018 07:30:16 -0300
Message-ID: <20181102073005.4fb45747@coco.lan>
References: <20181101082820.76abf19e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101082820.76abf19e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Em Thu, 1 Nov 2018 08:28:20 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> ./usr/include/linux/v4l2-controls.h:1105: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> Introduced by commit
> 
>   c27bb30e7b6d ("media: v4l: Add definitions for MPEG-2 slice format and metadata")
> 

How are you building it? Here this warning doesn't pop up.

I'm using here:

	gcc (GCC) 8.2.1 20181011 (Red Hat 8.2.1-4)

And I'm using:

$ make ARCH=x86_64  CF=-D__CHECK_ENDIAN__ CONFIG_DEBUG_SECTION_MISMATCH=y W=1 CHECK='' M=drivers/media

(it is not a full build, but it should be enough to get warnings at the
media subsystem)

Thanks,
Mauro
