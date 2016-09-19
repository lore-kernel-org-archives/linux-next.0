From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 19 Sep 2016 22:08:20 +0530
Message-ID: <20160919163819.GA3688@localhost>
References: <20160916131834.1ecb0eeb@canb.auug.org.au>
 <20160916083444.GA4730@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160916083444.GA4730@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Sep 16, 2016 at 09:34:44AM +0100, Peter Griffin wrote:
> Hi Vinod & Stephen,
> 
> On Fri, 16 Sep 2016, Stephen Rothwell wrote:
> 
> > Hi Vinod,
> > 
> > After merging the slave-dma tree, today's linux-next build (arm
> > multi_v7_defconfig build) failed like this:
> 
> FYI Patch 17 of 19 in the fdma series "drm/virtio: kconfig: Fix recursive dependency
> issue." [1], fixes this issue. It looks like that hasn't been applied. I should have
> made it clearer that this was a depedency (and the other white drm/kconfig white
> space fixup obviously isn't).

Yeah it should have been mentioned.

And I do not like to merge DRM patches for this and that too without ACKs.

I am dropping this branch from next untill I get ACK from someone on DRM
side to apply this

Thanks
-- 
~Vinod
