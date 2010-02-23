From: Luke Yelavich <luke.yelavich@canonical.com>
Subject: Re: linux-next: build warning after merge of the sound tree
Date: Tue, 23 Feb 2010 16:20:00 +1100
Message-ID: <20100223052000.GA15640@strigy.yelavich.home>
References: <20100223160746.e283a14f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail04.adl6.internode.on.net ([150.101.137.141]:9644 "EHLO
	ipmail04.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750863Ab0BWFZO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2010 00:25:14 -0500
Content-Disposition: inline
In-Reply-To: <20100223160746.e283a14f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 23, 2010 at 04:07:46PM EST, Stephen Rothwell wrote:
> Hi Takashi,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> sound/pci/hda/patch_realtek.c:7016: warning: 'alc885_macmini3_ch2_init' defined but not used
> sound/pci/hda/patch_realtek.c:7028: warning: 'alc885_macmini3_ch6_init' defined but not used
> 
> Introduced by commit e458b1fadf9239d1fdb165ff4c4ea0d807041bec ("ALSA: hda
> - Add Macmini 3,1 support").

Whoops, thats my fault. I'll send a patch to the ALSA dev list to fix that right away.

Luke
