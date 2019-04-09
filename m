From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 9 Apr 2019 09:22:18 +0200
Message-ID: <20190409072218.nepac7a4pngacweh@sirius.home.kraxel.org>
References: <20190409160849.391d3efa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409160849.391d3efa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 09, 2019 at 04:08:49PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/cirrus/cirrus.c: In function 'cirrus_fb_blit_rect':
> drivers/gpu/drm/cirrus/cirrus.c:310:25: error: implicit declaration of function '__io_virt'; did you mean '__do_irq'? [-Werror=implicit-function-declaration]
>    drm_fb_memcpy_dstclip(__io_virt(cirrus->vram),
>                          ^~~~~~~~~
>                          __do_irq

Probably just a missing arm/io.h include.
Test build is running ...

cheers,
  Gerd
