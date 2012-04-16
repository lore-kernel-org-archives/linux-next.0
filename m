From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] mfd: fix modular builds of rc5t583 regulator support
Date: Mon, 16 Apr 2012 10:12:21 -0400
Message-ID: <4F8C28C5.9070308@windriver.com>
References: <1334549301-32114-1-git-send-email-paul.gortmaker@windriver.com> <4F8BC20A.2090105@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:59584 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753498Ab2DPOMb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 10:12:31 -0400
In-Reply-To: <4F8BC20A.2090105@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 12-04-16 02:54 AM, Laxman Dewangan wrote:
> On Monday 16 April 2012 09:38 AM, Paul Gortmaker wrote:
>> The combination of commit 1b1247dd75aa5cf5fae54a3bec7280046e9c7957
>>
>>      "mfd: Add support for RICOH PMIC RC5T583"
>>
>> and commit 6ffc3270210efa2bea526953a142ffc908f5bd86
>>
>>      "regulator: Add support for RICOH PMIC RC5T583 regulator"
>>
>> are causing the i386 allmodconfig builds to fail with this:
>>
>>    ERROR: "rc5t583_update" [drivers/regulator/rc5t583-regulator.ko] undefined!
>>    ERROR: "rc5t583_set_bits" [drivers/regulator/rc5t583-regulator.ko] undefined!
>>    ERROR: "rc5t583_clear_bits" [drivers/regulator/rc5t583-regulator.ko] undefined!
>>    ERROR: "rc5t583_read" [drivers/regulator/rc5t583-regulator.ko] undefined!
>>
>> and this:
>>
>>    ERROR: "rc5t583_ext_power_req_config" [drivers/regulator/rc5t583-regulator.ko] undefined!
>>
>> For the 1st four, make the simple ops static inline, instead of
>> polluting the namespace with trivial exports.  For the last one,
>> add an EXPORT_SYMBOL.
>>
>> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
>> ---
>>
>> [ alternately, make REGULATOR_RC5T583 bool instead of tristate? ]
> 
> Why not export all require symbol from mfd core.
> I am sending the patch to exporting all required apis. Please review.

As I said in the commit log, it doesn't seem to make sense to export
them when they are trivial enough to be static inline, since it
avoids having them pollute the /proc/kallsyms namespace.

It is almost like having basic inb/outb as functions vs inline; it
just doesn't make sense to me.

However, if you are determined to rewrite the patch in another way,
please add the customary reported-by line.

Thanks,
Paul.
