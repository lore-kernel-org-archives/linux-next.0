From: Richard Holden <aciddeath@gmail.com>
Subject: Re: [PATCH] Remove unused variables from the cirrusfb driver
Date: Thu, 20 Nov 2008 23:12:42 -0700
Message-ID: <DE425C06-700A-4042-B0AB-1CDE2134C4DF@gmail.com>
References: <1227204203-32112-1-git-send-email-aciddeath@gmail.com> <1227204203-32112-2-git-send-email-aciddeath@gmail.com> <20081121103409.fed9a837.sfr@canb.auug.org.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.237]:3898 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbYKUGMo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Nov 2008 01:12:44 -0500
Received: by rv-out-0506.google.com with SMTP id k40so806770rvb.1
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2008 22:12:43 -0800 (PST)
In-Reply-To: <20081121103409.fed9a837.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


On Nov 20, 2008, at 4:34 PM, Stephen Rothwell wrote:

> Hi Richard,
>
> On Thu, 20 Nov 2008 11:03:22 -0700 "Richard A. Holden III" <aciddeath@gmail.com 
> > wrote:
>>
>> Remove i and s vars from cirrusfb_setup as they are not used
>> anywhere in that function. This fixes 2 unused vars build warnings.
>
> Thanks for the patch, but this is already fixed in mainline (commit
> ee11940f8e7a2f064af22d52180cb5f9643eef61 "cirrusfb: remove unused
> variables").
>
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/

Am I right in assuming you pulled mainline before this commit for  
next-20081120? I don't see the changelog in next and I'm getting the  
build warnings still, but I can recheck this in the next version of  
next.

-Richard Holden
