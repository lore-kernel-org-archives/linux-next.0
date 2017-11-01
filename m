From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: linux-next: build warnings after merge of the drm tree
Date: Wed, 1 Nov 2017 10:58:37 +0100
Message-ID: <20171101105837.75bc2be5@bbrezillon>
References: <20171101141640.3ca7597f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171101141640.3ca7597f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, 1 Nov 2017 14:16:40 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
> 
> drivers/gpu/drm/vc4/vc4_bo.c: In function 'vc4_bo_stats_debugfs':
> drivers/gpu/drm/vc4/vc4_bo.c:91:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
>    seq_printf(m, "%30s: %6dkb BOs (%d)\n", "userspace BO cache",
>                  ^
> drivers/gpu/drm/vc4/vc4_bo.c:95:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t {aka long unsigned int}' [-Wformat=]
>    seq_printf(m, "%30s: %6dkb BOs (%d)\n", "total purged BO",
>                  ^
> 
> Introduced by commit
> 
>   b9f19259b84d ("drm/vc4: Add the DRM_IOCTL_VC4_GEM_MADVISE ioctl")
> 

Just sent a patch fixing the problem.

Thanks for the report.

Boris
