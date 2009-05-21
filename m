From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 21 May 2009 10:39:01 +0300
Message-ID: <4A150515.8030608@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <4A15038B.1090204@redhat.com> <4A15049F.8000707@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52884 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751467AbZEUHjQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 03:39:16 -0400
In-Reply-To: <4A15049F.8000707@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory Haskins <ghaskins@novell.com>

Boaz Harrosh wrote:
>> I'll look for a ppc machine for build testing.
>>
>>     
>
> Can't you cross compile for ppc? I can't remember someone posted a link
> with binary cross-compiler packages a while back.
>
>   

I have userspace to test as well, which needs a ton of cross-compiled 
libraries.

-- 
error compiling committee.c: too many arguments to function
