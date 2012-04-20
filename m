From: Seth Jennings <sjenning@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Apr 19 (zcache)
Date: Fri, 20 Apr 2012 14:06:41 -0500
Message-ID: <4F91B3C1.5080507@linux.vnet.ibm.com>
References: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au> <4F909200.6070104@xenotime.net> <0b74f96b-8450-4dfb-8798-36edd0e06a64@default> <4F90E7CA.6080201@linux.vnet.ibm.com> <20120420163745.GB31062@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120420163745.GB31062@phenom.dumpdata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Dan Magenheimer <dan.magenheimer@oracle.com>, Nitin Gupta <nitingupta910@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 04/20/2012 11:37 AM, Konrad Rzeszutek Wilk wrote:
> On Thu, Apr 19, 2012 at 11:36:26PM -0500, Seth Jennings wrote:
>> One fix is this:
>>
>> diff --git a/drivers/staging/zcache/Kconfig b/drivers/staging/zcache/Kconfig
>> index 3ed2c8f..7048e01 100644
>> --- a/drivers/staging/zcache/Kconfig
>> +++ b/drivers/staging/zcache/Kconfig
>> @@ -2,7 +2,7 @@ config ZCACHE
>>         bool "Dynamic compression of swap pages and clean pagecache pages"
>>         # X86 dependency is because zsmalloc uses non-portable pte/tlb
>>         # functions
>> -       depends on (CLEANCACHE || FRONTSWAP) && CRYPTO && X86
>> +       depends on (CLEANCACHE || FRONTSWAP) && CRYPTO=y && X86
>>         select ZSMALLOC
>>         select CRYPTO_LZO
>>         default n
>>
>> I think this is the best way since ZCACHE is a bool and CRYPTO is the only
>> one of the dependencies that is a tristate.  This forces both ZSMALLOC and
>> CRYPTO_LZO to be builtin if ZCACHE is selected.
>>
>> Any other suggestions?
> 
> Could you do:
> 
> default y if (CRYPTO=y || ZSMALLOC=m)
> default m if (CRYPTO=m || ZSMALLOC=y)

ZCACHE is a bool and can't be built as a module.

The requirement is the if ZCACHE=y, then ZSMALLOC and
CRYPTO must also =y.

Thanks,
Seth
