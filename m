From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 28 Dec 2010 02:17:48 +0000
Message-ID: <20101228021747.GB30589@opensource.wolfsonmicro.com>
References: <20101228104024.fb0e9e34.sfr@canb.auug.org.au>
 <20101228104834.84202d88.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48467 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752988Ab0L1CRg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Dec 2010 21:17:36 -0500
Content-Disposition: inline
In-Reply-To: <20101228104834.84202d88.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

On Tue, Dec 28, 2010 at 10:48:34AM +1100, Stephen Rothwell wrote:

> Mark, I reversed the order of the trees today ...

That's expected, Takashi is on holiday at the minute so not updating his
tree.  Merging ASoC first will mean you get the fixes in ASoC plus the
additional stuff in the sound tree which seems more sensible.
