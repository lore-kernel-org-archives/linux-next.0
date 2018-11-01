From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: linux-next: build warning in Linus' tree tree
Date: Wed, 31 Oct 2018 23:38:38 -0300
Message-ID: <20181031233825.2724585f@coco.lan>
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

Somehow, I missed this warning. I'll send soon a fix for it.


Thanks,
Mauro
