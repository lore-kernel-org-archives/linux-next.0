From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: Tree for Oct 25 (powercap_sys.c)
Date: Fri, 25 Oct 2013 15:17:44 -0700
Message-ID: <526AEE08.5080706@linux.intel.com>
References: <1382713426-2680-1-git-send-email-treding@nvidia.com> <526ACA95.9030904@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:7871 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751321Ab3JYWRq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Oct 2013 18:17:46 -0400
In-Reply-To: <526ACA95.9030904@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Jacob Pan <jacob.jun.pan@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>


On 10/25/2013 12:46 PM, Randy Dunlap wrote:
> On 10/25/13 08:03, Thierry Reding wrote:
>> Hi all,
>>
>> I've uploaded today's linux-next tree to the master branch of the
>> repository below:
>>
>>          git://gitorious.org/thierryreding/linux-next.git
>>
>> A next-20131025 tag is also provided for convenience.
>>
>> One new trivial conflicts and a new build failure caused by an incorrect
>> use of the genpool allocator.
>>
>> Upon a request from Olof Johansson I've only included fixes for build
>> breakage as a result of interactions between the various trees. But
>> since I've fixed many of the other build failures already, I've pushed
>> those to a separate tag (next-20131025-fixes). That builds fine on x86
>> 32-bit and 64-bit allmodconfigs as well as ARM and x86 default
>> configurations. Most of the PowerPC build errors have also been fixed.
> on i386:
>
> drivers/powercap/powercap_sys.c:484:2: error: unknown field 'dev_attrs' specified in initializer
> drivers/powercap/powercap_sys.c:484:2: warning: initialization from incompatible pointer type [enabled by default]
> drivers/powercap/powercap_sys.c:484:2: warning: (near initialization for 'powercap_class.suspend') [enabled by default]
Submitted patch and copied to you all.

Thanks,
Srinivas
