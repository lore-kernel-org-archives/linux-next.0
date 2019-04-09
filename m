From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 9 Apr 2019 10:31:21 +0200
Message-ID: <20190409083121.v2otrskzvuc66yfj@sirius.home.kraxel.org>
References: <20190409160849.391d3efa@canb.auug.org.au>
 <20190409072218.nepac7a4pngacweh@sirius.home.kraxel.org>
 <20190409180855.6a33e4e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409180855.6a33e4e9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 09, 2019 at 06:08:55PM +1000, Stephen Rothwell wrote:
> Hi Gerd,
> 
> > >    drm_fb_memcpy_dstclip(__io_virt(cirrus->vram),
> > >                          ^~~~~~~~~
> > >                          __do_irq  
> > 
> > Probably just a missing arm/io.h include.
> 
> I assume you meant asm/io.h?

Yes.

cheers,
  Gerd
