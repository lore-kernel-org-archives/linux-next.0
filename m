From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next build failure
Date: Fri, 3 Jan 2014 14:56:09 -0800
Message-ID: <20140103145609.76b9f8622e8914cde183d7ce@linux-foundation.org>
References: <1388764729.2564.32.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51492 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753362AbaACW4L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 17:56:11 -0500
In-Reply-To: <1388764729.2564.32.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next@vger.kernel.org, jmarchan@redhat.com

On Fri, 03 Jan 2014 10:58:49 -0500 Mark Salter <msalter@redhat.com> wrote:

> The c6x arch (no MMU) is failing to build in linux-next with:
> 
>   kernel/built-in.o:(.fardata+0x3fc): undefined reference to `overcommit_ratio_handler'
>   kernel/built-in.o:(.fardata+0x420): undefined reference to `overcommit_kbytes_handler'
>   make[1]: *** [vmlinux] Error 1
> 
> Looks like this patch adds those functions to mm/mmap.c which
> is only used when CONFIG_MMU is defined.
> 
>   commit 31bdaf7c8e8a784fd8f889371bdacb24670734c7
>   Author: Jerome Marchand <jmarchan@redhat.com>
>   Date:   Tue Dec 17 10:45:06 2013 +1100
> 
>       mm: add overcommit_kbytes sysctl variable

Please check whether that linux-next includes
http://ozlabs.org/~akpm/mmotm/broken-out/mm-add-overcommit_kbytes-sysctl-variable-fix-2.patch
