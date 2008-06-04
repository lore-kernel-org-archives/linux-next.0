From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware merge conflicts
Date: Wed, 04 Jun 2008 10:56:29 +0100
Message-ID: <1212573389.4042.89.camel@shinybook.infradead.org>
References: <20080604160742.e4c66cd4.sfr@canb.auug.org.au>
	 <s5hprqx5z3b.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:58998 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752599AbYFDJ43 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jun 2008 05:56:29 -0400
In-Reply-To: <s5hprqx5z3b.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alan Cox <alan@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>

On Wed, 2008-06-04 at 11:27 +0200, Takashi Iwai wrote:
> Or just let me know if you guys want to put the changes into sound
> tree.  I'm willing to apply them...

Probably best to handle all the "const" changes together.

> >  And I can carry the sound/Kconfig fixup.

That conflict is just selecting FW_LOADER unconditionally, and changing
the default of SND_*_FIRMWARE_IN_KERNEL to 'n'. The latter you could do
in the sound tree quite happily. The former too, perhaps -- but then
there's Adrian's patch to make FW_LOADER unconditional if !EMBEDDED
anyway, which I think is probably a good idea.

-- 
dwmw2

