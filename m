From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>
Subject: Re: today's linux-next fails to boot
Date: Tue, 15 Jul 2008 04:11:26 +0200
Message-ID: <487C074E.8080309@gmail.com>
References: <4877400B.1000400@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060802020207000008040404"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.184]:23780 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755628AbYGOCL3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jul 2008 22:11:29 -0400
Received: by fk-out-0910.google.com with SMTP id 18so3043581fkq.5
        for <linux-next@vger.kernel.org>; Mon, 14 Jul 2008 19:11:27 -0700 (PDT)
In-Reply-To: <4877400B.1000400@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-1?Q?T=F6r=F6k_Edwin?= <edwintorok@gmail.com>
Cc: linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060802020207000008040404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Török Edwin a écrit :
> Hi,
>
> Today's linux-next tree (commit
> 93847083e4791567931bd17c039cc35881cdad29) fails to boot:
> [built with gcc-4.2.4-3]
>
> BUG: Int 14: CR2 b0049dea
>      EDI 00000082 ESI 00000000 EBP c059be88 ESP c059be5c
>      EBX f000ec62 EDX 0000000e ECX c0595480 EAX f000ec62
>      err 00000000 EIP c0181ca0  CS 00000060 flg 00010082
> Stack:   00000040 c06a2ba0 000080d0 c0595480 c0000f19c c000f180 c0581120
> c059bea8
>          c02bf19b 00000000 00000080 c059beb8 c0000f194 c000f180 0000000a
> c059beb8
>          c03a1059 00000000 00000000 c059bed8 c05c4c7c  0009efff 00000000
> c04f4df4
>
> I get this as soon as I boot from grub2, strangely the error message is
> at the bottom of the screen, and I can't see the full message (scrolling
> won't work).
>
> The last kernel I built & booted was 2.6.26-rc8 from Linus's tree. I
> will try to built&boot 2.6.26-rc9, and then bisect.
>
> This happens on 32-bit Dell Inspiron 6400 (Intel Core Duo T2300 @1.66
> Ghz CPU),  Intel ICH-7 chipset, and a seagate SATA drive. 
> I will provide  full hardware details once I bisected the problem.
>
> Meanwhile, if somebody has an idea as to what is wrong?
>
> Best regards,
> --Edwin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>   

I got the same problem on an x86-PC and after looking at the stack, the 
problem comes from firmware_map_add_early() in drivers/firmware/memmap.c

The backtrace is the following:

kzalloc()
verify_dynamic_kobject_allocation()
kobject_init()
firmware_map_add_entry()
firmware_map_add_early()
e820_reserve_resources()
setup_arch() (in x86)

The problem is that verify_dynamic_kobject_allocation() calls kzalloc 
assuming that kmem_cache_init() has already been called. But it's not 
the case and it's too soon to call the kmalloc/kzalloc functions.

I don't know what is the real problem: the fact that kobject_init is 
called too soon or verify_dynamic_kobject_allocation() which calls 
kzalloc without making any assumption about its current context.

So here is just a patch to temporarily disable 
verify_dynamic_kobject_allocation() This function just checks the sanity 
of the code.



--------------060802020207000008040404
Content-Type: text/x-patch;
 name="disable_verify_dyn_kobject.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="disable_verify_dyn_kobject.diff"

--- a/lib/kobject.c	2008-07-15 02:55:08.000000000 +0200
+++ b/lib/kobject.c	2008-07-15 04:01:10.000000000 +0200
@@ -335,7 +335,6 @@
 		       "object, something is seriously wrong.\n", kobj);
 		dump_stack();
 	}
-	verify_dynamic_kobject_allocation(kobj);
 
 	kobject_init_internal(kobj);
 	kobj->ktype = ktype;

--------------060802020207000008040404--
