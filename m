From: Andrey Wagin <avagin@gmail.com>
Subject: linux-next: Unable to write into a vma if it has been mapped without PROT_READ
Date: Mon, 29 Feb 2016 11:11:37 -0800
Message-ID: <CANaxB-wA_3qh78NUBc2ODqYHyXJLK0O6FRCdWizXBRPpWoBaGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35457 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbcB2TLi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 14:11:38 -0500
Received: by mail-lf0-f52.google.com with SMTP id j186so23849369lfg.2
        for <linux-next@vger.kernel.org>; Mon, 29 Feb 2016 11:11:38 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-mm@kvack.org

Hello Everyone,

I found that now we can't write into a vma if it was mapped without PROT_READ:

mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2ac7eb8000
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x7f2ac7eb8000} ---
+++ killed by SIGSEGV (core dumped) +++
Segmentation fault
[root@linux-next-test ~]# cat test.c
#include <sys/mman.h>
#include <stdlib.h>

int main()
{
    int *p;

    p = mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    p[0] = 1;

    return 0;
}

[root@linux-next-test ~]# uname -a
Linux linux-next-test 4.5.0-rc6-next-20160229 #1 SMP Mon Feb 29
17:38:25 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

This issue appeared in 4.5.0-rc5-next-20160226.

https://ci.openvz.org/job/CRIU-linux-next/152/console

Thanks,
Andrew
