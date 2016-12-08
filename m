From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: -next build failure with gcc 5.2.1
Date: Thu, 8 Dec 2016 13:09:27 +1100
Message-ID: <798a8079-6d96-6a9c-b413-21e46f0fcbb0@gmail.com>
References: <8BC02969-0A0D-4C59-8E5E-31F5FC2B1391@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:32783 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753287AbcLHCKJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2016 21:10:09 -0500
Received: by mail-pf0-f196.google.com with SMTP id 144so21394802pfv.0
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2016 18:09:32 -0800 (PST)
In-Reply-To: <8BC02969-0A0D-4C59-8E5E-31F5FC2B1391@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org

On 12/07/2016 07:26 PM, Sachin Sant wrote:
> next tree fails to build on a ppc64le box with following message
>
>   LD      init/built-in.o
>   LD      vmlinux.o
>   MODPOST vmlinux.o
> WARNING: modpost: Found 3 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
>   KSYM    .tmp_kallsyms1.o
> kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode
> Makefile:969: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
>
> GCC version is : gcc version 5.2.1 20151010 (Ubuntu 5.2.1-22ubuntu2)
>
> Have attached kernel config file.
>

Thanks, would you be in a position to bisect?

Balbir Singh.
