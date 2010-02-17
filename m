From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warning after final merge (sound tree)
Date: Wed, 17 Feb 2010 10:01:33 +0000
Message-ID: <20100217100132.GA19077@opensource.wolfsonmicro.com>
References: <20100217171923.ea505d0f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49576 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933004Ab0BQKBc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Feb 2010 05:01:32 -0500
Content-Disposition: inline
In-Reply-To: <20100217171923.ea505d0f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 17, 2010 at 05:19:23PM +1100, Stephen Rothwell wrote:

> After merging, today's linux-next build (powerpc allyesconfig) produced
> this warning:

Oh, feh.  My working copy has this warning fixed but apparently that
didn't make it over.  I'll push a refresh out later today.

One of these days mainline will actually build and do something useful
with audio on a system I can use for normal development.  :/
