From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: Request to add linux-kselftest to linux-next
Date: Mon, 08 Sep 2014 17:07:41 -0600
Message-ID: <540E36BD.4060607@osg.samsung.com>
References: <540DC2BD.7030506@osg.samsung.com> <20140909085841.2ec2871e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53221 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755293AbaIHXH7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Sep 2014 19:07:59 -0400
In-Reply-To: <20140909085841.2ec2871e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, greg Kroah-Hartman <gregkh@linuxfoundation.org>, fengguang.wu@intel.com, linux-api@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On 09/08/2014 04:58 PM, Stephen Rothwell wrote:
> Hi Shuah,
> 
> On Mon, 08 Sep 2014 08:52:45 -0600 Shuah Khan 
> <shuahkh@osg.samsung.com> wrote:
>> 
>> Could you please add linux-kselftest tree to linux-next. I plan 
>> to maintain two branches:
>> 
>> linux-kselftest for Kselftest Framework
>> 
>> fixes - Contains changes intended for merging before the next 
>> major release, including fixes for regressions introduced during
>>  merge window. next  - Contains changes intended for merging 
>> during the next merge window between a major release and -rc1.
> 
> Umm, a git URL would be helpful :-)
> 

Sorry: here it is:

https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git/

-- Shuah

-- 
Shuah Khan
Sr. Linux Kernel Developer
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
