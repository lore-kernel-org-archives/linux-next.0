From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 21 (nouveau)
Date: Fri, 22 Nov 2013 11:22:54 -0800
Message-ID: <528FAF0E.6040802@infradead.org>
References: <20131121140411.092318822bbd82b7b47e0d53@canb.auug.org.au> <528E2BC3.4040007@infradead.org> <20131122113748.GB20300@shodan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:54933 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755619Ab3KVTXA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Nov 2013 14:23:00 -0500
In-Reply-To: <20131122113748.GB20300@shodan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Pop <sultryweather@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>

On 11/22/13 03:37, Adrian Pop wrote:
> Hello!
> 
>> on x86_64:
>>
>> CONFIG_HWMON is not enabled.
>>
>> drivers/gpu/drm/nouveau/nouveau_hwmon.c: In function 'nouveau_hwmon_init':
>> drivers/gpu/drm/nouveau/nouveau_hwmon.c:633:2: error: 'hwmon' undeclared (first use in this function)
> 
> I've attached a patch that fixes the build for me when using this
> config.
> 

That works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy
