From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 16 (mfd/tpx6586x)
Date: Sat, 19 May 2012 08:58:08 -0700
Message-ID: <4FB7C310.3010403@xenotime.net>
References: <20120516201426.3a162ecd6adeb7132413f1b9@canb.auug.org.au> <4FB3D2C3.3030507@xenotime.net> <20120519142506.GN12015@sortiz-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120519142506.GN12015@sortiz-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-next.vger.kernel.org

On 05/19/2012 07:25 AM, Samuel Ortiz wrote:

> Hi Randy,
> 
> On Wed, May 16, 2012 at 09:16:03AM -0700, Randy Dunlap wrote:
>> On 05/16/2012 03:14 AM, Stephen Rothwell wrote:
>>
>>>
>>> The mfd tree lost its build failure but gained another so I used the
>>> version from next-20120511.
>>>
>>
>>
>>
>> (on i386)
>>
>> drivers/built-in.o: In function `tps6586x_i2c_probe':
>> tps6586x.c:(.devinit.text+0x144e0): undefined reference to `of_regulator_match'
>>
> Is this one fixed now ? It's coming from Mark's regulator tree, not the MFD
> one.


It still fails in linux-next of 20120518.

> Mark, I think mfd/tps6586x.c should select REGULATOR to avoid this one.
> 
> Cheers,
> Samuel.
> 
> 
>> Full randconfig file is attached.
>>
>> -- 
>> ~Randy


-- 
~Randy
