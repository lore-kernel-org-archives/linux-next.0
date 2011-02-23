From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: manual merge of the watchdog tree with the sh tree
Date: Wed, 23 Feb 2011 08:42:55 +0100
Message-ID: <20110223074255.GL3790@infomag.iguana.be>
References: <20110223143446.8646373f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay009.isp.belgacom.be ([195.238.6.176]:27012 "EHLO
	mailrelay009.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752297Ab1BWHm6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Feb 2011 02:42:58 -0500
Content-Disposition: inline
In-Reply-To: <20110223143446.8646373f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

Hi Stephen,

> Today's linux-next merge of the watchdog tree got a conflict in
> drivers/watchdog/shwdt.c between commits b1fa888e0124 ("watchdog: shwdt:
> Kill off mmap stub and superfluous comments") and 8f5585ec3d17
> ("watchdog: shwdt: driver model conversion") from the sh tree and commit
> e273d97a2281 ("watchdog: cleanup spaces before tabs") from the watchdog
> tree.
> 
> The spaces seem to have been cleaned up in the former patches, so I used
> the sh tree version of this file.

I will redo that patch tonight so that you don't have any issues with it tomorrow.

Thanks,
Wim.
