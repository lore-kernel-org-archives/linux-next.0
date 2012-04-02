From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 07/11] sh: fix several build failures from system.h fallout
Date: Mon, 2 Apr 2012 14:15:53 -0400
Message-ID: <4F79ECD9.6000108@windriver.com>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com> <1333312727-11428-8-git-send-email-paul.gortmaker@windriver.com> <20120402010048.GA21647@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120402010048.GA21647@linux-sh.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Mundt <lethal@linux-sh.org>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12-04-01 09:00 PM, Paul Mundt wrote:
> On Sun, Apr 01, 2012 at 04:38:43PM -0400, Paul Gortmaker wrote:
>> commit e839ca528718e68cad32a307dc9aabf01ef3eb05
>>
>>     "Disintegrate asm/system.h for SH"
>>
>> created the new file asm/cache_insns.h but it didn't add
>> an include for all the users of it.
>>
>> The failure on fpu.c (also seen below) showed up roughly
>> at the same time, and since the fix is trivial (include traps.h)
>> I did not bother to bisect to 100% confirm it was caused by
>> the system.h disintegration.
>>
> There's still more, but they've alreadly all been fixed up in my tree.

OK, I can drop this one.  Is that tree part of linux-next?

Thanks,
Paul.
