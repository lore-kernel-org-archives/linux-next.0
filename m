From: Michal Simek <michal.simek@petalogix.com>
Subject: Re: Microblaze merge
Date: Wed, 27 May 2009 15:33:49 +0200
Message-ID: <4A1D413D.5090507@petalogix.com>
References: <4A1CEA3C.1050904@petalogix.com>	<20090527181022.f69d7036.sfr@canb.auug.org.au>	<4A1D3ACF.2090206@petalogix.com> <20090527232437.d5509976.sfr@canb.auug.org.au>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f168.google.com ([209.85.220.168]:48082 "EHLO
	mail-fx0-f168.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762729AbZE0Ndv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 09:33:51 -0400
Received: by fxm12 with SMTP id 12so2860114fxm.37
        for <linux-next@vger.kernel.org>; Wed, 27 May 2009 06:33:51 -0700 (PDT)
In-Reply-To: <20090527232437.d5509976.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Williams <john.williams@petalogix.com>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Michal,
>
> On Wed, 27 May 2009 15:06:23 +0200 Michal Simek <michal.simek@petalogix.com> wrote:
>   
>>> 	posted to a relevant mailing list
>>>   
>>>       
>> was
>>     
>>> 	reviewed
>>>   
>>>       
>> It was reviewed v1 - v2 contains all reported problems
>>     
>>> 	unit tested
>>>   
>>>       
>> I tested it
>>     
>>> 	destined for the next merge window (or the current release)
>>>   
>>>       
>> it is for next merge open window.
>>     
>
> All good.
>
>   
>> I see the first problem that I should use {GIT PULL] prefix in subject.
>>     
>
> Not for me.  Now that you have asked for inclusion, I will fetch the
> tree/branch that you pointed me to every day until you tell me not to any
> more.  So all you have to do is update that branch when your new stuff
> meets the above criteria.
>   
ok
> I usually don't expect any problems from the architecture trees since, as
> you say, they are usually pretty much contained to their own arch/
> directory.
>   
:-) I too.
> One thing - is it easy for me to build a cross compiler for microblaze
> (i.e. does some GNU release of gcc just work)?  If so, I could add some
> microblaze configs to my automated builds.
>   
We have two approaches - script/crosstools. I will talk with John and
let you know.
We have to provide new tools for others too.

Anyway thanks for your offer I let you know about.

Michal





-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
