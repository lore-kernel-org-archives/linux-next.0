From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH -next] qdio: add missing export.h include
Date: Wed, 28 Sep 2011 10:03:22 -0400
Message-ID: <4E83292A.3070502@windriver.com>
References: <1316676108-5729-1-git-send-email-heiko.carstens@de.ibm.com> <4E824F3A.6070302@windriver.com> <20110928063425.GA2621@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:50798 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496Ab1I1OGT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 10:06:19 -0400
In-Reply-To: <20110928063425.GA2621@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, Frank Blaschka <blaschka@linux.vnet.ibm.com>, Jan Glauber <jang@linux.vnet.ibm.com>

On 11-09-28 02:34 AM, Heiko Carstens wrote:
> On Tue, Sep 27, 2011 at 06:33:30PM -0400, Paul Gortmaker wrote:
>> On 11-09-22 03:21 AM, Heiko Carstens wrote:
>>> Fix compile breakage caused by splitting module.h:
>>>
>>> drivers/s390/cio/qdio_setup.c:31:1:
>>>  warning: data definition has no type or storage class [enabled by default]
>>> drivers/s390/cio/qdio_setup.c:31:1:
>>>  warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
>>
>> Now that I look at this, and the other patch, I'm not
>> seeing how this is possible.  Unless there is some
>> convoluted CPP magic going on, I don't see any instances
>> of EXPORT_SYMBOL in qdio_setup.c -- similarly I don't
>> see any module_ or MODULE_ references in zfcp_qdio.c
>>
>> Am I missing something obvious here?   The line numbers
>> you quote dont match anything meaningful -- so I'm wondering
>> if perhaps these changes are meant to be in advance of the
>> s390 changes you've got queued in next -- which is fine, but
>> it would be nice to have that called out.
> 
> Oh right, I should have mentioned this. Sorry!
> he two patches fix compile breakages only in -next because of s390
> related patches in the scsi and net git trees. Since it's not possible
> to add the compile fixes (at least for the new export.h header file)
> to the scsi or net trees I just sent these patches towards you...

OK, thanks for the info.  I'll update the commit header with
a note indicating those two changes are in anticipation of
pending s390 changes.

Paul.

> 
> Thanks,
> Heiko
