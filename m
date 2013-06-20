From: Chao Xie <cxie4@marvell.com>
Subject: RE: linux-next: build failure after merge of the final tree (mfd
 tree related)
Date: Wed, 19 Jun 2013 19:25:26 -0700
Message-ID: <AAD1C6EB06EE3649B35B7E026785068D2581671C20@SC-VEXCH2.marvell.com>
References: <20130618171957.9d8fbcf376243d1d5f1d92b0@canb.auug.org.au>
 <20130619082456.GR7161@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130619082456.GR7161@zurbaran>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yi Zhang <yizhang@marvell.com>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: Samuel Ortiz [mailto:sameo@linux.intel.com] 
> Sent: Wednesday, June 19, 2013 4:25 PM
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Chao Xie; Yi Zhang
> Subject: Re: linux-next: build failure after merge of the final tree (mfd tree related)

> Hi Stephen,

>>On Tue, Jun 18, 2013 at 05:19:57PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the final tree, today's linux-next build (powerpc
>> allyesconfig) failed like this:
>> 
>> drivers/mfd/88pm800.c: In function 'pm800_pages_init':
>> drivers/mfd/88pm800.c:434:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
>>   if (IS_ERR(subchip->regmap_power)) {
>>   ^
>> drivers/mfd/88pm800.c:435:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
>>    ret = PTR_ERR(subchip->regmap_power);
>>    ^
>> 
>> Caused by commit f8ca616f67f7 ("mfd: 88pm800: Enhance error handling for
>> sub pages probe/remove") from the mfd tree.  Forgot to include
>> linux/err.h (see Rule 1 in Documentation/SubmitChecklist).
>Sorry about that. This is fixed now.

It is my fault. Thanks for fixing it.

> Cheers,
> Samuel.

> -- 
> Intel Open Source Technology Centre
> http://oss.intel.com/
