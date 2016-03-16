From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Date: Wed, 16 Mar 2016 08:56:50 +0100
Message-ID: <56E911C2.3060802@suse.cz>
References: <20160316105851.015ff688@canb.auug.org.au>
 <56E91108.5050105@bmw-carit.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34184 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933203AbcCPH4y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 03:56:54 -0400
In-Reply-To: <56E91108.5050105@bmw-carit.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>

On 2016-03-16 08:53, Daniel Wagner wrote:
> Hi,
> 
> On 03/16/2016 12:58 AM, Stephen Rothwell wrote:
>> After merging the kbuild tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpu/drm/gma500/mdfld_dsi_output.c:407:39: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>   .dpms = /*drm_helper_connector_dpms*/mdfld_dsi_connector_dpms,
>>                                        ^
>>
>> Caused by commit
>>
>>   ea8daa7b9784 ("kbuild: Add option to turn incompatible pointer check into error")
> 
> 
> A fix should be on the way via drm-misc:

Right. Stephen, could you perhaps move the kbuild tree down in your list
a bit, so that the fixes are present?

Thanks,
Michal
