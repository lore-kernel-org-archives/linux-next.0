From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: Boot failure with next-20120208
Date: Fri, 23 Mar 2012 12:24:12 -0700
Message-ID: <4F6CCDDC.5000802@linux.intel.com>
References: <20120212113805.c7e5d902c95a9d0f4037e12c@canb.auug.org.au> <16788.1329102254@neuling.org> <4F391BBA.5020506@linux.intel.com> <20120213120549.eab7e2b9.akpm@linux-foundation.org> <4F396FA9.90606@linux.intel.com> <20120323122244.132198e3.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:12065 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759604Ab2CWTYN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Mar 2012 15:24:13 -0400
In-Reply-To: <20120323122244.132198e3.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Neuling <mikey@neuling.org>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, Milton Miller <miltonm@bga.com>

On 3/23/2012 12:22 PM, Andrew Morton wrote:
> On Mon, 13 Feb 2012 12:16:41 -0800
> Arjan van de Ven <arjan@linux.intel.com> wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>>> The bug looks pretty generic, nothing very PPC-specific there.  It 
>>> might affect other architectures - we won't know until we find out
>>> wht caused it.
>>
>> well one half of the race looks pretty generic...
>> ..... doesn't mean the other half of the race is though....
>>
>>
>>>
>>> Ho hum, I suppose I should pull the patch out of linux-next, to
>>> avoid disrupting other testing.  This means it's going to be hard
>>> to get the bug fixed.
>>
>> it means losing this one big PPC machine indeed.... until they hit
>> that same race some other way with regular real cpu hotplug ;-(
> 
> So we're kinda stuck with this.  As I can't merge it, I guess I'll make
> smp-start-up-non-boot-cpus-asynchronously.patch disappear.


well yeah, PPC is throwing things in the spanner

we're now working on an x86-only patch with basically the same
improvement, but done in a way that does not touch the other architectures

so by all means drop the patch
