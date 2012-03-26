From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the sound
 tree
Date: Mon, 26 Mar 2012 11:47:35 +0530
Message-ID: <1332742655.19804.19.camel@vkoul-udesk3>
References: <20120322133930.b75bb87714ef197d22d56cf3@canb.auug.org.au>
	 <20120322134101.e2342db0ae13a4ed79cfebfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120322134101.e2342db0ae13a4ed79cfebfd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, 2012-03-22 at 13:41 +1100, Stephen Rothwell wrote:
> On Thu, 22 Mar 2012 13:39:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the slave-dma tree got a conflict in
> > sound/soc/imx/imx-pcm-dma-mx2.c between commit c307e8e32e11 ("ASoC:
> > imx-pcm-dma: Use dmaengine PCM helper functions") from the sound tree and
> > commit 16052827d98f ("dmaengine/dma_slave: introduce inline wrappers")
> > from the slave-dma tree.
> > 
> > I just use dthe version from the sound tree.
> 
> The same with sound/soc/mxs/mxs-pcm.c .
Thanks Stephan, and sorry for delay in responding was away for the
weekend.

This should be fixed now with MArk applying the fix from Fabio Estevam.
I see this is in asoc-next.

-- 
~Vinod
