From: Michal Simek <michal.simek@petalogix.com>
Subject: microblaze FAULT: memblock: Introduce for_each_memblock() and new
 accessors, and use it
Date: Mon, 02 Aug 2010 12:25:42 +0200
Message-ID: <4C569D26.1000907@petalogix.com>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:58771 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417Ab0HBK3O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2010 06:29:14 -0400
Received: by bwz1 with SMTP id 1so1374218bwz.19
        for <linux-next@vger.kernel.org>; Mon, 02 Aug 2010 03:29:12 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Ben,

your commit 53e16bfaf19346f59b3502e207aa66c61332075c in linux-next
breaks microblaze kernel compilation. It is easy to remove. Patch is 
below. Please add this change to your commit.

Thanks,
Michal

diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 10bae6e..840026c 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -143,7 +143,7 @@ void __init setup_memory(void)

         /* reserve allocate blocks */
         for_each_memblock(reserved, reg) {
-               pr_debug("reserved %d - 0x%08x-0x%08x\n", i,
+               pr_debug("reserved - 0x%08x-0x%08x\n",
                          (u32) reg->base, (u32) reg->size);
                 reserve_bootmem(reg->base, reg->size, BOOTMEM_DEFAULT);
         }


-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
