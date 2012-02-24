From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: build warning after merge of the libata tree
Date: Fri, 24 Feb 2012 12:01:56 -0500
Message-ID: <4F47C284.6050703@garzik.org>
References: <20120213162740.9e3cb47a39da19ed89edea49@canb.auug.org.au> <20120224140814.c134151d30e3f32b36360d5d@canb.auug.org.au> <4F470CB3.2010800@garzik.org> <20120224151410.e245d7610a597504541858ad@canb.auug.org.au> <20120224232212.caf992ef1200adb2b761890c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:44795 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757331Ab2BXRB7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2012 12:01:59 -0500
In-Reply-To: <20120224232212.caf992ef1200adb2b761890c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On 02/24/2012 07:22 AM, Stephen Rothwell wrote:
> Hi Jeff,
>
> On Fri, 24 Feb 2012 15:14:10 +1100 Stephen Rothwell<sfr@canb.auug.org.au>  wrote:
>>
>> On Thu, 23 Feb 2012 23:06:11 -0500 Jeff Garzik<jeff@garzik.org>  wrote:
>>>
>>> A build fix and oops fix were both just pushed out.
>>
>> Excellent, thanks.
>
> Except the commits in the current version of the libata tree destined for
> linux-next do not fix the warnings I was reporting where the "inline"
> keyword is missing from several static function definitions in
> drivers/ata/libata.h ...

Patchset backed out, and hopefully this will get fixed before it appears 
again in linux-next.

	Jeff
