From: Konstantin Khlebnikov <khlebnikov@openvz.org>
Subject: Re: [PATCH] mm: add config NUMA stub to all architectures
Date: Fri, 17 Feb 2012 17:32:10 +0400
Message-ID: <4F3E56DA.3050203@openvz.org>
References: <4F3E42E0.4030108@openvz.org>	<20120217120815.25909.15632.stgit@zurg> <20120217234508.8293a84fb3ebb7fed6d60ec3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:34219 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999Ab2BQNcO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2012 08:32:14 -0500
In-Reply-To: <20120217234508.8293a84fb3ebb7fed6d60ec3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi Konstantin,
>
> On Fri, 17 Feb 2012 16:08:15 +0400 Konstantin Khlebnikov<khlebnikov@openvz.org>  wrote:
>>
>> Config NUMA must be defined for all architectures,
>> otherwise IS_ENABLED(CONFIG_NUMA) does not work.
>> Some arch-specific Kconfig already has this stub.
>> This patch adds it to all remaining.
>
> Why not add it somewhere generic (like mm/Kconfig, maybe) and then it can
> be removed from the architecture specific places over time (if necessary
> - I am pretty sure it is ok to have it there twice)?
>

Different architectures has different dependencies for NUMA.

Seems like Kconfig allow config option duplication, but it use default state from first.
If we add "config NUMA\n def_bool n" somewhere in generic Kconfig, default will be n if
Kconfig see this declaration first.
