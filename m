From: Boaz Harrosh <boaz@plexistor.com>
Subject: Re: linux-next: hang while trying to fetch the osd tree
Date: Sun, 31 May 2015 11:43:18 +0300
Message-ID: <556AC9A6.7010300@plexistor.com>
References: <20150528104735.387bdb22@canb.auug.org.au> <5566D45E.5000000@electrozaur.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:34725 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754435AbbEaInW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 31 May 2015 04:43:22 -0400
Received: by wibut5 with SMTP id ut5so14222505wib.1
        for <linux-next@vger.kernel.org>; Sun, 31 May 2015 01:43:21 -0700 (PDT)
In-Reply-To: <5566D45E.5000000@electrozaur.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/28/2015 11:39 AM, Boaz Harrosh wrote:
> On 05/28/2015 03:47 AM, Stephen Rothwell wrote:
>> Hi Boaz,
>>
>> Trying to fetch the osd tree
>> (git://git.open-osd.org/linux-open-osd.git#linux-next) just hangs after
>> connecting. :-(
>>
> 
> Yes I've seen that too.
> 
> I will wait until Sunday (5/31) and if it does not come back up I will
> switch to another tree on another domain.
> 
> Please suspend the fetching for now And I will post you an email
> on Sunday if to re-enable or if to switch to a new address.
> 
> Sorry for the mess
> Boaz
> 

Hi Stephen

So it looks like the service is back so we'll keep the same
address for now.

Apparently I still had ssh access to this server and all that
was needed was a service restart to the gitd

Thanks
Boaz
