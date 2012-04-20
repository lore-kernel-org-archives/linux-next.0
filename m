From: Seth Jennings <sjenning@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Apr 19 (zcache)
Date: Thu, 19 Apr 2012 23:36:26 -0500
Message-ID: <4F90E7CA.6080201@linux.vnet.ibm.com>
References: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au> <4F909200.6070104@xenotime.net> <0b74f96b-8450-4dfb-8798-36edd0e06a64@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:44431 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab2DTEge (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Apr 2012 00:36:34 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <sjenning@linux.vnet.ibm.com>;
	Thu, 19 Apr 2012 22:36:33 -0600
In-Reply-To: <0b74f96b-8450-4dfb-8798-36edd0e06a64@default>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Magenheimer <dan.magenheimer@oracle.com>
Cc: Nitin Gupta <nitingupta910@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Wilk <konrad.wilk@oracle.com>

On 04/19/2012 05:36 PM, Dan Magenheimer wrote:
>> From: Randy Dunlap [mailto:rdunlap@xenotime.net]
>> Sent: Thursday, April 19, 2012 4:30 PM
>> To: Stephen Rothwell
>> Cc: linux-next@vger.kernel.org; LKML; Dan Magenheimer
>> Subject: Re: linux-next: Tree for Apr 19 (zcache)
>>
>> On 04/18/2012 11:46 PM, Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20120418:
>>
>>
>> on x86_64:
>>
>> drivers/built-in.o: In function `zv_free':
>> zcache-main.c:(.text+0x5e1c9): undefined reference to `zs_map_object'
>> zcache-main.c:(.text+0x5e238): undefined reference to `zs_unmap_object'
>> zcache-main.c:(.text+0x5e29a): undefined reference to `zs_free'
>> drivers/built-in.o: In function `zv_create':
>> zcache-main.c:(.text+0x5e6b3): undefined reference to `zs_malloc'
>> zcache-main.c:(.text+0x5e6f0): undefined reference to `zs_map_object'
>> zcache-main.c:(.text+0x5e72c): undefined reference to `zs_unmap_object'
>> drivers/built-in.o: In function `zcache_comp_init':
>> zcache-main.c:(.text+0x5e831): undefined reference to `crypto_has_alg'
>> zcache-main.c:(.text+0x5e8a5): undefined reference to `crypto_has_alg'
>> drivers/built-in.o: In function `zcache_cpu_notifier':
>> zcache-main.c:(.text+0x5e94f): undefined reference to `crypto_alloc_base'
>> zcache-main.c:(.text+0x5e9f2): undefined reference to `crypto_destroy_tfm'
>> drivers/built-in.o: In function `zv_decompress':
>> zcache-main.c:(.text+0x5ee40): undefined reference to `zs_map_object'
>> zcache-main.c:(.text+0x5ef06): undefined reference to `zs_unmap_object'
>> drivers/built-in.o: In function `zcache_pampd_create':
>> zcache-main.c:(.text+0x5f614): undefined reference to `zs_get_total_size_bytes'
>> make[1]: *** [.tmp_vmlinux1] Error 1

The problem is that zsmalloc is being built as a module and zcache is
builtin.  It seems that because CRYPTO=m, kbuild is forcing zsmalloc
to be built, just not forcing it to be builtin.

The zcache Kconfig has:
	bool "Dynamic compression of swap pages and clean pagecache pages"
	depends on (CLEANCACHE || FRONTSWAP) && CRYPTO && X86
	select ZSMALLOC
	select CRYPTO_LZO

Seems to be a nuance of kbuild I didn't know before.  If a
"selected by" (sub)condition is met, if any of the conditionals are
built as modules, then the entry can be built as a module.

For example, if zsmalloc is selected by:
...(CLEANCACHE [=y] || FRONTSWAP [=n]) && CRYPTO [=m] && X86 [=y]
then it can be built as a module or builtin.

If zsmalloc is selected by:
...(CLEANCACHE [=y] || FRONTSWAP [=n]) && CRYPTO [=y] && X86 [=y]
then it must be builtin.

One fix is this:

diff --git a/drivers/staging/zcache/Kconfig b/drivers/staging/zcache/Kconfig
index 3ed2c8f..7048e01 100644
--- a/drivers/staging/zcache/Kconfig
+++ b/drivers/staging/zcache/Kconfig
@@ -2,7 +2,7 @@ config ZCACHE
        bool "Dynamic compression of swap pages and clean pagecache pages"
        # X86 dependency is because zsmalloc uses non-portable pte/tlb
        # functions
-       depends on (CLEANCACHE || FRONTSWAP) && CRYPTO && X86
+       depends on (CLEANCACHE || FRONTSWAP) && CRYPTO=y && X86
        select ZSMALLOC
        select CRYPTO_LZO
        default n

I think this is the best way since ZCACHE is a bool and CRYPTO is the only
one of the dependencies that is a tristate.  This forces both ZSMALLOC and
CRYPTO_LZO to be builtin if ZCACHE is selected.

Any other suggestions?

Thanks,
Seth
