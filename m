From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Date: Wed, 9 May 2018 07:08:55 +0200
Message-ID: <20180509050855.GA18469@lst.de>
References: <20180508110716.53dfef41@canb.auug.org.au> <20180509150255.38a5b1cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180509150255.38a5b1cc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nipun Gupta <nipun.gupta@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 09, 2018 at 03:02:55PM +1000, Stephen Rothwell wrote:
> > -	ret = of_dma_configure(dev, NULL);
> > +	ret = of_dma_configure(dev, NULL, true);
> >  	if (ret < 0) {
> >  		DRM_ERROR("Cannot setup DMA ops, ret %d", ret);
> >  		return ret;
> > -- 
> > 2.17.0
> 
> This is now needed for the merge of the drm and dma-mapping trees.

FYI, because the dma_configure change touch so much code and the author
wants to base more work on it it actually is in a guranteed stable
branch with just those patches:

    git://git.infradead.org/users/hch/dma-mapping.git dma-configure

Gitweb:

    http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/dma-configure
  
Feel free to pull this into the drm tree.
