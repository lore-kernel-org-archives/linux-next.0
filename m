From: Michal Simek <michal.simek@petalogix.com>
Subject: Re: Microblaze merge
Date: Wed, 27 May 2009 15:06:23 +0200
Message-ID: <4A1D3ACF.2090206@petalogix.com>
References: <4A1CEA3C.1050904@petalogix.com> <20090527181022.f69d7036.sfr@canb.auug.org.au>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f222.google.com ([209.85.218.222]:49792 "EHLO
	mail-bw0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763845AbZE0NG0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2009 09:06:26 -0400
Received: by bwz22 with SMTP id 22so4587713bwz.37
        for <linux-next@vger.kernel.org>; Wed, 27 May 2009 06:06:27 -0700 (PDT)
In-Reply-To: <20090527181022.f69d7036.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, John Williams <john.williams@petalogix.com>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> HI Michal,
>
> On Wed, 27 May 2009 09:22:36 +0200 Michal Simek <michal.simek@petalogix.com> wrote:
>   
>> Can you please merge my next branch to linux-next?
>>
>> The following changes since commit 5805977e63a36ad56594a623f3bd2bebcb7db233:
>>   Linus Torvalds (1):
>>         Merge branch 'for-linus' of git://git.kernel.org/.../jbarnes/drm-2.6
>>
>> are available in the git repository at:
>>
>>   git://git.monstr.eu/linux-2.6-microblaze.git next
>>     
>
> I have added it to the end of the tree for today (you just caught me in
> time :-)).  Tomorrow it will be moved back with all the other
> architectures.
>   
;-)

> What I tell everyone: all patches/commits in the tree/series must
> have been:
>
> 	posted to a relevant mailing list
>   
was
> 	reviewed
>   
It was reviewed v1 - v2 contains all reported problems
> 	unit tested
>   
I tested it
> 	destined for the next merge window (or the current release)
>   
it is for next merge open window.
> *before* they are included.  The linux-next tree is for integration
> testing and to lower the impact of conflicts between subsystems in the
> next merge window.
>   
I would like to know that Kconfig changes (enabling some drivers) + Arnd
generic changes
not caused any problem which I should know about.
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
>   
next branch is based on my for-linus branch - There are only microblaze
specific changes in arch/microblaze
and these changes shouldn't have impact to any subsystem that's why I
don't expect any problem in it.

If I am wrong in anything let me know. This is my first "pull request to
linux-next".

I see the first problem that I should use {GIT PULL] prefix in subject.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
