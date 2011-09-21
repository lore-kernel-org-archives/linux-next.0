From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: manual merge of the omap_dss2 tree with the
 arm-soc tree
Date: Wed, 21 Sep 2011 09:12:04 +0300
Message-ID: <1316585524.1949.6.camel@deskari>
References: <20110921125844.d83e02ba538d7626d6bdefcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog105.obsmtp.com ([74.125.149.75]:51908 "EHLO
	na3sys009aog105.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752385Ab1IUGML (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Sep 2011 02:12:11 -0400
In-Reply-To: <20110921125844.d83e02ba538d7626d6bdefcf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

On Wed, 2011-09-21 at 12:58 +1000, Stephen Rothwell wrote:
> Hi Tomi,
> 
> Today's linux-next merge of the omap_dss2 tree got a conflict in
> arch/arm/mach-omap2/board-4430sdp.c between commit 8f5b5a41ebc7 ("ARM:
> OMAP: Introduce SoC specific early_init") from the arm-soc tree and
> commit 58282610da02 ("OMAP: 4430SDP: Remove unneeded lcd config") from
> the omap_dss2 tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks, looks correct.

 Tomi
