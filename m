From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 15:38:43 +0000
Message-ID: <20101227153843.GA13400@opensource.wolfsonmicro.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
 <20101227113857.GA31293@sirena.org.uk>
 <20101228022027.8519be82.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101228022027.8519be82.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 28, 2010 at 02:20:27AM +1100, Stephen Rothwell wrote:

> I got this error after merging the sound tree:

> ERROR: "__tracepoint_snd_soc_jack_irq" [sound/soc/codecs/snd-soc-wm8962.ko] undefined!

> after that, I merged the old version of the sound tree.  I then merged
> the sound-asoc tree and go the same error.  I presumed that you had fixed
> the other error:

> ERROR: "__tracepoint_snd_soc_jack_irq" [sound/soc/codecs/snd-soc-wm8903.ko] undefined!

> in the sound-asoc tree and then that version of the sound-asoc tree had
> been merged into the sound tree.

To my knowledge I'd fixed everything.  However, it looks like there's a
typo in the wm8962 ifdef to work around the x86 failure which was
causing the problem; since you hadn't mentioned that you'd encountered
any issue after I'd done the previous fix I'd no idea that this had
happened and it had appeared that the problem with Takashi's tree was
simply that he'd not merged up the fix.

Fixed now, anyway.  Please do report if you see any more issues.
