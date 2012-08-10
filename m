From: Chris Zankel <chris@zankel.net>
Subject: Re: xtensa port maintenance
Date: Fri, 10 Aug 2012 15:39:04 -0700
Message-ID: <50258D88.7090903@zankel.net>
References: <50205592.1030205@gmail.com> <201208102115.59946.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48680 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760360Ab2HJWjH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Aug 2012 18:39:07 -0400
Received: by pbbrr13 with SMTP id rr13so3410097pbb.19
        for <linux-next@vger.kernel.org>; Fri, 10 Aug 2012 15:39:06 -0700 (PDT)
In-Reply-To: <201208102115.59946.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marc Gauthier <marc@tensilica.com>, Kirill Krinkin <kirill.krinkin@gmail.com>

Hi Arnd,

Given the recent renewed push for Xtensa, I'll step in to feed the 
changes upstream. We might change that in future, though.

Max has volunteered to help bring the Xtensa port up-to-date. Most of 
the recent development was done on outdated trees and never got 
submitted in true kernel-manner (i.e. small changes at a time). It's 
also important to bring the ecosystem (compilers, libraries, etc.) to 
the latest trees, and my understanding is that there's also work going 
on in that area.

I have set up a tree on github for now, and will work close with Max to 
get his changes to Stephen's linux-next tree and eventually Linus' tree. 
I think it's fine to add Max as a second maintainer, so he can help 
filtering patches.

Cheers!
-Chris

On 8/10/12 2:15 PM, Arnd Bergmann wrote:
> On Monday 06 August 2012, Max Filippov wrote:
>> I have a couple of questions regarding the path of xtensa-specific patches
>> upstream:
>>      - which git tree should they be targeted for? Should I set up a tree for
>>        pull requests, or will patches be picked up into some existing tree?
>>        (Looks like Linus' tree is the right target. AFAIK previously xtensa
>>        patches went mostly through akpm tree).
> Setting up a git tree is a good first step if you want to be the official
> maintainer, and if you want to get it included into linux-next.
>
