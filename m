From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] arm/rpc: avoid static keyword removal via define
Date: Wed, 17 Dec 2014 15:20:17 +0100
Message-ID: <54919121.7070405@de.ibm.com>
References: <1418633287-5019-1-git-send-email-borntraeger@de.ibm.com> <1418633287-5019-2-git-send-email-borntraeger@de.ibm.com> <5490146A.3000408@de.ibm.com> <20141216114056.GP11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:41180 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011AbaLQR0l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Dec 2014 12:26:41 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Wed, 17 Dec 2014 17:26:39 -0000
In-Reply-To: <20141216114056.GP11285@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

Am 16.12.2014 um 12:40 schrieb Russell King - ARM Linux:
> On Tue, Dec 16, 2014 at 12:15:54PM +0100, Christian Borntraeger wrote:
>> Am 15.12.2014 um 09:48 schrieb Christian Borntraeger:
>>> commit 4486b86368d7 ("[ARM] riscpc: fix decompressor font file handling")
>>> introduced Makefile magic to avoid building a file two times. Using
>>> -Dstatic= does break some assumptions on compiler.h that were introduced
>>> for READ_ONCE.
>>>
>>> Lets just use sed on the copy instead of using a define.
>>>
>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>> Cc: Russell King <linux@arm.linux.org.uk>
>>
>> This fixed the linux-next build http://kisskb.ellerman.id.au/kisskb/target/1508/
>> Unless anybody complains, I will send the pull request for the access_once tree tomorrow and I have this patch applied on top.
> 
> Please give me some time to look at this.

>From all builds, the only problematic case was the rpc_defconfig.
As I said, I want to send this series this merge window, so if you dont find the time to look into this before rc1, I can remove this patch from my queue and we solve this later?

Christian
