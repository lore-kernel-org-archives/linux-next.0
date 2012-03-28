From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Wed, 28 Mar 2012 12:59:39 -0400
Message-ID: <4F73437B.6070806@windriver.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com> <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com> <4F732C97.2030804@compulab.co.il> <20120328152743.GW3232@opensource.wolfsonmicro.com> <4F73356D.5080401@windriver.com> <20120328161305.GZ3232@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:34275 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751457Ab2C1Q7x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 12:59:53 -0400
In-Reply-To: <20120328161305.GZ3232@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Igor Grinberg <grinberg@compulab.co.il>
Cc: haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On 12-03-28 12:13 PM, Mark Brown wrote:
> On Wed, Mar 28, 2012 at 11:59:41AM -0400, Paul Gortmaker wrote:
>> On 12-03-28 11:27 AM, Mark Brown wrote:
> 
>> static struct platform_device em_x270_gps_userspace_consumer = {
>>         .name           = "reg-userspace-consumer",
>>         .id             = 0,
> 
>> static struct platform_device em_x270_gprs_userspace_consumer = {
>>         .name           = "reg-userspace-consumer",
>>         .id             = 1,
> 
>> Note that the existing names currently don't incorporate the .id
>> field as a suffix, and so never were unique.
> 
> No, this is just a basic part of how platform devices work - the device
> name is always the same and if you've got more than one of them they get
> different .ids.  dev_name() returns name.id, or just name if id is set
> to -1 indicating that there's onyl one device of a given type.

OK, so Igor - can you simply retest the v2 patch, but make the
two trivial changes:

-REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer", "vcc gps");
+REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer.0", "vcc gps");

-REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer", "vcc gprs");
+REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer.1", "vcc gprs");

Thanks,
Paul.
