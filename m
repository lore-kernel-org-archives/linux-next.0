From: =?ISO-8859-1?Q?T=F6r=F6k_Edwin?= <edwintorok@gmail.com>
Subject: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 14:12:11 +0300
Message-ID: <4877400B.1000400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.187]:41484 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756897AbYGKLMP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 07:12:15 -0400
Received: by mu-out-0910.google.com with SMTP id w8so1223363mue.1
        for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 04:12:14 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Linux Kernel <linux-kernel@vger.kernel.org>

Hi,

Today's linux-next tree (commit
93847083e4791567931bd17c039cc35881cdad29) fails to boot:
[built with gcc-4.2.4-3]

BUG: Int 14: CR2 b0049dea
     EDI 00000082 ESI 00000000 EBP c059be88 ESP c059be5c
     EBX f000ec62 EDX 0000000e ECX c0595480 EAX f000ec62
     err 00000000 EIP c0181ca0  CS 00000060 flg 00010082
Stack:   00000040 c06a2ba0 000080d0 c0595480 c0000f19c c000f180 c0581120
c059bea8
         c02bf19b 00000000 00000080 c059beb8 c0000f194 c000f180 0000000a
c059beb8
         c03a1059 00000000 00000000 c059bed8 c05c4c7c  0009efff 00000000
c04f4df4

I get this as soon as I boot from grub2, strangely the error message is
at the bottom of the screen, and I can't see the full message (scrolling
won't work).

The last kernel I built & booted was 2.6.26-rc8 from Linus's tree. I
will try to built&boot 2.6.26-rc9, and then bisect.

This happens on 32-bit Dell Inspiron 6400 (Intel Core Duo T2300 @1.66
Ghz CPU),  Intel ICH-7 chipset, and a seagate SATA drive. 
I will provide  full hardware details once I bisected the problem.

Meanwhile, if somebody has an idea as to what is wrong?

Best regards,
--Edwin
