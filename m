From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: + drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet.patch added to
 -mm tree
Date: Mon, 27 Feb 2012 09:46:24 -0800
Message-ID: <4F4BC170.7060804@xenotime.net>
References: <20120224231044.753EC10004D@wpzn3.hot.corp.google.com> <20120224233124.GM25293@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:53888 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754126Ab2B0RqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 12:46:22 -0500
In-Reply-To: <20120224233124.GM25293@ponder.secretlab.ca>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, b-cousson@ti.com, balajitk@ti.com, gg@slimlogic.co.uk, rob.herring@calxeda.com, sameo@linux.intel.com, linux-next@vger.kernel.org

On 02/24/2012 03:31 PM, Grant Likely wrote:

> On Fri, Feb 24, 2012 at 02:27:28PM -0800, akpm@linux-foundation.org wrote:
>>
>> The patch titled
>>      Subject: drivers/mfd/twl-core.c: wtf isn't this fixed yet??
>> has been added to the -mm tree.  Its filename is
>>      drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet.patch
>>
>> Before you just go and hit "reply", please:
>>    a) Consider who else should be cc'ed
>>    b) Prefer to cc a suitable mailing list as well
>>    c) Ideally: find the original patch on the mailing list and do a
>>       reply-to-all to that, adding suitable additional cc's
>>
>> *** Remember to use Documentation/SubmitChecklist when testing your code ***
>>
>> The -mm tree is included into linux-next and is updated
>> there every 3-4 working days
> 
> Hi Andrew,
> 
> I've posted patchs to fix this today, and I'll push it out to my tree
> on the weekend so that Monday's linux-next will have this finally solved.


Did these patches get pushed??

linux-next of 20120227 still has build errors in twl-core.c:

drivers/mfd/twl-core.c:1237:2: error: implicit declaration of function 'irq_alloc_descs'
drivers/mfd/twl-core.c:1332:3: error: implicit declaration of function 'of_platform_populate'

on both i386 and x86_64.


> g.
> 
>>
>> ------------------------------------------------------
>> From: Andrew Morton <akpm@linux-foundation.org>
>> Subject: drivers/mfd/twl-core.c: wtf isn't this fixed yet??
>>
>> drivers/mfd/twl-core.c: In function 'twl_probe':
>> drivers/mfd/twl-core.c:1237: error: implicit declaration of function 'irq_alloc_descs'
>> drivers/mfd/twl-core.c:1245: error: implicit declaration of function 'irq_domain_add_legacy'
>> drivers/mfd/twl-core.c:1246: error: 'irq_domain_simple_ops' undeclared (first use in this function)
>> drivers/mfd/twl-core.c:1246: error: (Each undeclared identifier is reported only once
>> drivers/mfd/twl-core.c:1246: error: for each function it appears in.)
>>
>> Cc: Benoit Cousson <b-cousson@ti.com>
>> Cc: Balaji T K <balajitk@ti.com>
>> Cc: Graeme Gregory <gg@slimlogic.co.uk>
>> Cc: Samuel Ortiz <sameo@linux.intel.com>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>> ---
>>
>>  drivers/mfd/twl-core.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff -puN drivers/mfd/twl-core.c~drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet drivers/mfd/twl-core.c
>> --- a/drivers/mfd/twl-core.c~drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet
>> +++ a/drivers/mfd/twl-core.c
>> @@ -1234,7 +1234,7 @@ twl_probe(struct i2c_client *client, con
>>  		return -EINVAL;
>>  	}
>>  
>> -	status = irq_alloc_descs(-1, pdata->irq_base, nr_irqs, 0);
>> +	status = 0;
>>  	if (IS_ERR_VALUE(status)) {
>>  		dev_err(&client->dev, "Fail to allocate IRQ descs\n");
>>  		return status;
>> @@ -1242,8 +1242,8 @@ twl_probe(struct i2c_client *client, con
>>  
>>  	pdata->irq_base = status;
>>  	pdata->irq_end = pdata->irq_base + nr_irqs;
>> -	irq_domain_add_legacy(node, nr_irqs, pdata->irq_base, 0,
>> -			      &irq_domain_simple_ops, NULL);
>> +//	irq_domain_add_legacy(node, nr_irqs, pdata->irq_base, 0,
>> +//			      &irq_domain_simple_ops, NULL);
>>  
>>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) == 0) {
>>  		dev_dbg(&client->dev, "can't talk I2C?\n");
>> _
>> Subject: Subject: drivers/mfd/twl-core.c: wtf isn't this fixed yet??

-- 
~Randy
