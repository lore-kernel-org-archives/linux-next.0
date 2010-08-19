From: Jeff Garzik <jeff@garzik.org>
Subject: Re: linux-next: build failure after merge of the libata tree
Date: Thu, 19 Aug 2010 16:15:24 -0400
Message-ID: <4C6D90DC.4050202@garzik.org>
References: <20100818104057.5fdaf20d.sfr@canb.auug.org.au> <AANLkTinJ8ks85Ym11wd4csdqFVgQpS7nw=RrfhMrLPUH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:49470 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab0HSUP2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Aug 2010 16:15:28 -0400
In-Reply-To: <AANLkTinJ8ks85Ym11wd4csdqFVgQpS7nw=RrfhMrLPUH@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gwendal Grignou <gwendal@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@google.com>

On 08/17/2010 08:46 PM, Gwendal Grignou wrote:
> Let me fix it and send a patch to Jeff.
>
> Gwendal.
>
> On Tue, Aug 17, 2010 at 5:40 PM, Stephen Rothwell<sfr@canb.auug.org.au>  wrote:
>> Hi Jeff,
>>
>> After merging the libata tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> drivers/ata/libata-transport.c: In function 'ata_attach_transport':
>> drivers/ata/libata-transport.c:678: error: implicit declaration of function 'kzalloc'
>> drivers/ata/libata-transport.c:678: warning: assignment makes pointer from integer without a cast
>> drivers/ata/libata-transport.c: In function 'ata_release_transport':
>> drivers/ata/libata-transport.c:741: error: implicit declaration of function 'kfree'
>>
>> Caused by commit 97395d39931160a171959ac2e1fbff1caba3374b ("[libata] Add
>> ATA transport class") neglecting to include linux/slab.h.   See Rule 1 in
>> Documentation/SubmitChecklist.
>>
>> I have used the libata tree form next-20100817 for today.


Never received a patch; pushed out the obvious fix myself.
