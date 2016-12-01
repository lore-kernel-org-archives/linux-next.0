From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Date: Thu, 1 Dec 2016 13:00:31 +1100
Message-ID: <20161201130031.6c7ba4a0@roar.ozlabs.ibm.com>
References: <20161201100608.625b8915@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34564 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755404AbcLACAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 21:00:52 -0500
In-Reply-To: <20161201100608.625b8915@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 1 Dec 2016 10:06:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Michal,
> 
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: EXPORT symbol "__sw_hweight32" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memcpy_mcsafe_unrolled" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_2" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_2" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__fentry__" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "native_load_gs_index" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__copy_user_nocache" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "copy_user_generic_unrolled" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "_copy_to_user" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__sw_hweight64" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_1" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__memcpy" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memmove" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_8" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "copy_user_generic_string" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_4" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "clear_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__memset" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__memmove" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "copy_user_enhanced_fast_string" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "_copy_from_user" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_1" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "phys_base" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__get_user_8" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "copy_page" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "__put_user_4" [vmlinux] version generation failed, symbol will not be versioned.
> WARNING: EXPORT symbol "memcpy" [vmlinux] version generation failed, symbol will not be versioned.
> 
> Introduced by commit
> 
>   d8c1eb86e952 ("kbuild: modpost warn if export version crc is missing")
> 

These are existing problems caught by the new warning. The modversions saga
has another chapter left, but one way or another we'll get rid of the warnings
for 4.10.

Thanks,
Nick
