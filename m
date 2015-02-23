From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Mon, 23 Feb 2015 15:44:19 -0600
Message-ID: <54EB9F33.6030702@acm.org>
References: <20150223102312.7029616b@canb.auug.org.au>	<54EA8C99.50000@acm.org> <20150224072004.534ccb5a@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:39617 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbbBWVoZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 16:44:25 -0500
In-Reply-To: <20150224072004.534ccb5a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Sourcefoge is definitely having issues:

    [cminyard@t430 linux-ipmi]$ git push origin for-next
    fatal: '/git/p/openipmi/linux-ipmi' does not appear to be a git
    repository
    fatal: Could not read from remote repository.

    Please make sure you have the correct access rights
    and the repository exists.

After a while it started working, and the tag was there.  I've verified
that everything is ok from a different machine.

-corey

On 02/23/2015 02:20 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> On Sun, 22 Feb 2015 20:12:41 -0600 Corey Minyard <minyard@acm.org> wrote:
>> On 02/22/2015 05:23 PM, Stephen Rothwell wrote:
>>> While fetching the ipmi tree
>>> (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
>>> error:
>>>
>>> fatal: Couldn't find remote ref refs/heads/for-next
>>>
>> Hmm, I haven't touched that tag.  Sourceforge has been doing some
>> strange things lately, I'm wondering if I should switch to something
>> else.  I guess I could have accidentally deleted it, too.
>>
>> Anyway, those changes are all in Linus' tree, so I just moved for-next
>> to master.
> Its gone again :-(
>
