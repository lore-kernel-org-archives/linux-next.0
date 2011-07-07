From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: Build issue with linux next. duplicate member _count in mm_types.h
Date: Thu, 07 Jul 2011 15:57:17 +0100
Message-ID: <4E15C94D.9080205@cam.ac.uk>
References: <4E143120.2020501@cam.ac.uk> <alpine.DEB.2.00.1107060933460.17202@router.home> <4E15AF1C.7080103@example.com> <alpine.DEB.2.00.1107070841500.17376@router.home> <4E15B945.5060805@example.com> <alpine.DEB.2.00.1107070908320.17929@router.home> <4E15C59E.5000900@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E15C59E.5000900@example.com>
Sender: linux-kernel-owner@vger.kernel.org
To: piotr@hosowicz.com
Cc: Christoph Lameter <cl@linux.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 07/07/11 15:41, Piotr Hosowicz wrote:
> On 07.07.2011 16:09, Christoph Lameter wrote:
>> On Thu, 7 Jul 2011, Piotr Hosowicz wrote:
>>
>>> I attach it. Your patch seems to had worked, I finish making the package.
>>
>> I do not see anything remarkable in the config file.
>>
>> Which compiler version are you using?
>>
>> Mine is:
>>
>> christoph@oldy:~$ gcc --version
>> gcc (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5
>> Copyright (C) 2010 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions. There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
> 
> Mine is:
> 
> aapi205:~# gcc --version
> gcc (Debian 4.6.0-10) 4.6.1 20110526 (prerelease)
> Copyright (C) 2011 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
Mine, 

gcc version 4.6.1 20110617 (prerelease) (GCC) 
