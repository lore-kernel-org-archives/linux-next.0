From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound tree with the omap tree
Date: Fri, 13 Nov 2009 12:39:01 +0000
Message-ID: <20091113123901.GB30966@sirena.org.uk>
References: <20091113131947.03d1b259.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:39998 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267AbZKMMi7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2009 07:38:59 -0500
Content-Disposition: inline
In-Reply-To: <20091113131947.03d1b259.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, vikram pandita <vikram.pandita@ti.com>, Tony Lindgren <tony@atomide.com>

On Fri, Nov 13, 2009 at 01:19:47PM +1100, Stephen Rothwell wrote:

> Today's linux-next merge of the sound tree got a conflict in
> arch/arm/mach-omap2/board-zoom2.c between commit
> 3541a57ebeb4c817e6e25bb0c2a2c174d6edb7c4 ("omap: zoom2: split board file
> for software reuse") from the omap tree and commits
> f8d9aad96d0d7b57d0bf2e4de21fdda3a42f4449 ("OMAP: Platform support for
> twl4030_codec MFD") and 953e2f3d272db9db6671ad4f4244820557a71cf7 ("OMAP:
> Configure audio_mclk for twl4030-codec MFD") from the sound tree.

> The former moved the code that the latter modifies into another file.  I
> have added the following merge fixup patch and can carry it as necessary.

Adding Tony for the OMAP tree - as discussed previously you could merge

git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git twl4030-mfd

into the OMAP tree to resolve this.  There's some older ASoC changes in
there to ensure the patches applied but I'm happy for you to carry those
providing Takashi is.
