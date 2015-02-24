From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Mon, 23 Feb 2015 18:06:54 -0600
Message-ID: <54EBC09E.1000204@acm.org>
References: <20150223102312.7029616b@canb.auug.org.au>	<54EA8C99.50000@acm.org>	<20150224072004.534ccb5a@canb.auug.org.au>	<54EB9F33.6030702@acm.org> <20150224095449.243040b5@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:37971 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712AbbBXAG5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Feb 2015 19:06:57 -0500
In-Reply-To: <20150224095449.243040b5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/23/2015 04:54 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> On Mon, 23 Feb 2015 15:44:19 -0600 Corey Minyard <minyard@acm.org> wrote:
>> Sourcefoge is definitely having issues:
>>
>>     [cminyard@t430 linux-ipmi]$ git push origin for-next
>>     fatal: '/git/p/openipmi/linux-ipmi' does not appear to be a git
>>     repository
>>     fatal: Could not read from remote repository.
>>
>>     Please make sure you have the correct access rights
>>     and the repository exists.
>>
>> After a while it started working, and the tag was there.  I've verified
>> that everything is ok from a different machine.
> I see the problem.  I expect for-next to be a branch, but it is a tag.
> It is a real pain to pull a tag into a shared tree like mine (there
> could be a for-next tag in every tree I fetch from ...).
Oops, I messed that up, I mixing up procedures.  It's fixed.

-corey
