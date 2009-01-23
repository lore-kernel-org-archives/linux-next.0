From: Ian Molton <ian@mnementh.co.uk>
Subject: Re: linux-next: manual merge of the sound tree with the pxa tree
Date: Fri, 23 Jan 2009 03:08:06 +0000
Message-ID: <49793496.2010908@mnementh.co.uk>
References: <20090123140130.eba111dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.mnementh.co.uk ([173.45.232.4]:37794 "EHLO mnementh.co.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753398AbZAWDNL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 22:13:11 -0500
In-Reply-To: <20090123140130.eba111dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Eric Miao <eric.miao@marvell.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

Stephen Rothwell wrote:
> Hi Takashi,
> 
> Today's linux-next merge of the sound tree got a conflict in
> sound/soc/pxa/e800_wm9712.c between commit
> f638d6ae54b5dc1bbffaa1dd94cb288d989670af ("[ARM] pxa: remove unnecessary
> #include of pxa-regs.h and hardware.h") from the pxa tree and commit 0465c7aa6fbab89de820442aed449ceb8d9145a6 ("ASoC: machine driver for
> Toshiba e800") from the sound tree.
> 
> Just overlapping context changes.  I fixed it up (see below) and can
> carry the fix as necessary.

Looks good. If it needs acking, then

Acked-by: Ian Molton <ian@mnementh.co.uk>

-Ian
