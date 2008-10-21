From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the proc tree
Date: Tue, 21 Oct 2008 17:57:57 +1100
Message-ID: <20081021175757.8956427d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36791 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753803AbYJUIi7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 04:38:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>

Hi Alexey,

Today's linux-next merge of the proc tree got a conflict in
fs/proc/vmcore.c between commit 57cac4d1880527e0baf6c2fda529d2ad1d815aec
("kdump: make elfcorehdr_addr independent of CONFIG_PROC_VMCORE") from
Linus' tree and commit 469b7835a44df596d9bedfc4413174ddba36c518 ("proc:
move /proc/vmcore creation to fs/proc/vmcore.c") from the proc tree.

Just a context change. I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/proc/vmcore.c
index cd9ca67,9074762..0000000
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@@ -32,7 -32,10 +32,7 @@@ static size_t elfcorebuf_sz
  /* Total size of vmcore file. */
  static u64 vmcore_size;
  
- struct proc_dir_entry *proc_vmcore = NULL;
 -/* Stores the physical address of elf header of crash image. */
 -unsigned long long elfcorehdr_addr = ELFCORE_ADDR_MAX;
 -
+ static struct proc_dir_entry *proc_vmcore = NULL;
  
  /* Reads a page from the oldmem device from given offset. */
  static ssize_t read_from_oldmem(char *buf, size_t count,
