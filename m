From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-20090611: SLUB: Unable to allocate memory on node -1
Date: Thu, 11 Jun 2009 17:03:38 +0400
Message-ID: <a4423d670906110603s42bf0287p848b00c2cc786cc1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:36328 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbZFKNDh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 09:03:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi

SLUB: Unable to allocate memory on node -1 (gfp=11200)
  cache: kmalloc-2048, object size: 2048, buffer size: 2048, default
order: 3, min order: 0
  node 0: slabs: 407, objs: 1724, free: 0
SLUB: Unable to allocate memory on node -1 (gfp=11200)
  cache: kmalloc-2048, object size: 2048, buffer size: 2048, default
order: 3, min order: 0
  node 0: slabs: 407, objs: 1724, free: 0

It is 4-way (2*2) SMP with 2Gb RAM

After ohe hour:

SysRq : Show Memory
Mem-Info:
DMA per-cpu:
CPU    0: hi:    0, btch:   1 usd:   0
CPU    1: hi:    0, btch:   1 usd:   0
CPU    2: hi:    0, btch:   1 usd:   0
CPU    3: hi:    0, btch:   1 usd:   0
DMA32 per-cpu:
CPU    0: hi:  186, btch:  31 usd:  33
CPU    1: hi:  186, btch:  31 usd:   6
CPU    2: hi:  186, btch:  31 usd:  32
CPU    3: hi:  186, btch:  31 usd: 128
Active_anon:17806 active_file:125950 inactive_anon:867
 inactive_file:184832 unevictable:0 dirty:6551 writeback:0 unstable:0
 free:114704 slab:50538 mapped:1397 pagetables:488 bounce:0
DMA free:11688kB min:28kB low:32kB high:40kB active_anon:0kB
inactive_anon:0kB active_file:32kB inactive_file:120kB unevictable:0kB
present:11072kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 1975 1975 1975
DMA32 free:443780kB min:5672kB low:7088kB high:8508kB
active_anon:74536kB inactive_anon:3468kB active_file:503768kB
inactive_file:739208kB unevictable:0kB present:2023256kB
pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0 0
DMA: 18*4kB 8*8kB 10*16kB 10*32kB 9*64kB 8*128kB 5*256kB 4*512kB
2*1024kB 0*2048kB 1*4096kB = 11688kB
DMA32: 13673*4kB 20022*8kB 12589*16kB 832*32kB 3*64kB 0*128kB 0*256kB
1*512kB 0*1024kB 0*2048kB 0*4096kB = 443620kB
310848 total pagecache pages
56 pages in swap cache
Swap cache stats: add 736, delete 680, find 10/15
Free swap  = 3909060kB
Total swap = 3911788kB
523088 pages RAM
24077 pages reserved
230011 pages shared
162325 pages non-shared
