From: Gleb Natapov <gleb@redhat.com>
Subject: S3 sleep no longer works on x86_64 in 2.6.27
Date: Thu, 23 Oct 2008 14:24:05 +0200
Message-ID: <20081023122405.GC14838@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from il.qumranet.com ([212.179.150.194]:53173 "EHLO il.qumranet.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752457AbYJWMYJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 08:24:09 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gcosta@redhat.com
Cc: mingo@elte.hu, linux-next@vger.kernel.org

Hi,

S3 sleep no longer works on x86_64 (at least in KVM, but it looks like
this is the kernel bug). Kernel 2.6.26 works. I think that the commit
that caused the problem is a939098af, but I can't be 100% sure since
compilation is broken at this point.

Triple fault happens during S3 resume. It happens in arch/x86/kernel/head_64.S
during access to GDT after it was loaded on line 213 (lgdt early_gdt_descr(%rip))
early_gdt_descr points to per_cpu__gdt_page and this address contains
valid GDT entries during a regular boot, but on S3 resume in contains
garbage. It seems that per_cpu area is reallocated somewhere, but I
don't understand this magic enough to fix it. Can somebody look at this
and explain what happens?

--
			Gleb.
