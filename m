From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 21 Jan 2016 07:38:59 +1100
Message-ID: <20160121073859.3a6c22a3@canb.auug.org.au>
References: <20151231232210.7ab890f1@canb.auug.org.au>
	<20160114151541.17e76d23@canb.auug.org.au>
	<20160115130527.c43357d0aef93d22380c6673@linux-foundation.org>
	<20160116100047.681e0e03@canb.auug.org.au>
	<20160115151401.03fe1a39ca397079407c2ca9@linux-foundation.org>
	<s5h4meductq.wl-tiwai@suse.de>
	<s5hmvs0uytw.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58575 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753971AbcATUjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2016 15:39:03 -0500
In-Reply-To: <s5hmvs0uytw.wl-tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Hi Takashi,

On Wed, 20 Jan 2016 15:09:47 +0100 Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 16 Jan 2016 09:51:29 +0100,
> Takashi Iwai wrote:
> > 
> > There are a few ways to fix this, but all are not comfortable.
> > 
> > A. Disable compress API for powerpc.

This also affects alpha, mips and (maybe) sparc.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
