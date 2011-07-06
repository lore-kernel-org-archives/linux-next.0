From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Build issue with linux next. duplicate member _count in mm_types.h
Date: Wed, 06 Jul 2011 10:55:44 +0100
Message-ID: <4E143120.2020501@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152]:37716 "EHLO
	ppsw-52.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345Ab1GFJrh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jul 2011 05:47:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Stephen

Getting:

  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: `include/generated/mach-types.h' is up to date.
  CC      arch/arm/kernel/asm-offsets.s
In file included from include/linux/sched.h:64:0,
                 from arch/arm/kernel/asm-offsets.c:13:
include/linux/mm_types.h:74:15: error: duplicate member '_count'
make[1]: *** [arch/arm/kernel/asm-offsets.s] Error 1
make: *** [prepare0] Error 2

Issue looks to have been introduced by 

    mm: Rearrange struct page

fc9bb8c768abe7ae10861c3510e01a95f98d5933

Guessing it's a known issue, but just thought I'd flag it up in case
it's something very specific about my build.

gcc-2.6 armv7a

Reverting that patch works, but given I don't know the history, I'm
not proposing doing that in general!

Jonathan
