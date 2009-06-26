From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Merge request for the Thumb-2 branch
Date: Fri, 26 Jun 2009 17:59:51 +0100
Message-ID: <1246035591.30717.54.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:45837 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754658AbZFZRAB (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2009 13:00:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Hi Stephen,

Could you please merge the thumb-2 branch into linux-next:

  git://linux-arm.org/linux-2.6.git thumb-2

It adds support for compiling the ARM kernel to the Thumb-2 instruction
set (16 or 32 bit opcodes) and it makes sense to check it doesn't break
other things before the next merging window (it's a bit more intrusive
but limited to arch/arm/* files).

The commits in this branch are:

Catalin Marinas (11):
      Thumb-2: Add some .align statements to the .S files
      Thumb-2: Add macros for the unified assembler syntax
      Thumb-2: Implementation of the unified start-up and exceptions code
      Thumb-2: Implement the unified arch/arm/mm support
      Thumb-2: Implement the unified arch/arm/lib functions
      Thumb-2: Implement the unified VFP support
      Thumb-2: Implement the unified boot code
      Thumb-2: Add support for loadable modules
      Thumb-2: Pass a Thumb-2 address to the secondary CPUs to jump to
      Thumb-2: Make the uImage entry an odd number
      Thumb-2: Add Thumb-2 support to the build files

Thanks.

-- 
Catalin
