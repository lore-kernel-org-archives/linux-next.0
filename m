From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 16 Mar 2016 08:53:44 +0100
Message-ID: <56E91108.5050105@bmw-carit.de>
References: <20160316105851.015ff688@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.bmw-carit.de ([62.245.222.98]:36996 "EHLO
	mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752480AbcCPHxw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 03:53:52 -0400
In-Reply-To: <20160316105851.015ff688@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

Hi,

On 03/16/2016 12:58 AM, Stephen Rothwell wrote:
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/gma500/mdfld_dsi_output.c:407:39: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .dpms = /*drm_helper_connector_dpms*/mdfld_dsi_connector_dpms,
>                                        ^
> 
> Caused by commit
> 
>   ea8daa7b9784 ("kbuild: Add option to turn incompatible pointer check into error")


A fix should be on the way via drm-misc:

https://lkml.org/lkml/2016/2/25/397

Though I don't know what the exact status is (and I haven't really
understood the flow of the patches as far)

cheers,
daniel
