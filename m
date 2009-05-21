From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Thu, 21 May 2009 13:05:13 +0300
Message-ID: <4A152759.1050200@redhat.com>
References: <20090521172122.bb12027c.sfr@canb.auug.org.au> <4A15038B.1090204@redhat.com> <4A15049F.8000707@panasas.com> <4A150515.8030608@redhat.com> <4A150747.3070304@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:34360 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752321AbZEUKFf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 06:05:35 -0400
In-Reply-To: <4A150747.3070304@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory Haskins <ghaskins@novell.com>

Boaz Harrosh wrote:
>> I have userspace to test as well, which needs a ton of cross-compiled 
>> libraries.
>>
>>     
>
> A cross compiler produces native foreign code. A Native distribution with
> binary libraries will work just as well.
>
> Do you mean to set up all the build environment and dependencies?
> Perhaps get a ready made ppc linux image, mount and chroot into it
> and build that way.
>
> If only you had an emulator for ppc?
>   

Life's too short for emulators.

-- 
error compiling committee.c: too many arguments to function
