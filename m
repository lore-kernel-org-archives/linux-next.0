From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: [PATCH v2 1/2] ras: hwpoison: fix build failure around
 trace_memory_failure_event
Date: Wed, 20 May 2015 06:01:20 +0000
Message-ID: <20150520060119.GB27005@hori1.linux.bs1.fc.nec.co.jp>
References: <20150518185226.23154d47@canb.auug.org.au>
 <555A0327.9060709@infradead.org>
 <20150519024933.GA1614@hori1.linux.bs1.fc.nec.co.jp>
 <20150519094636.67c9a4a3@gandalf.local.home>
 <20150520053614.GA6236@hori1.linux.bs1.fc.nec.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from TYO202.gate.nec.co.jp ([210.143.35.52]:57554 "EHLO
	tyo202.gate.nec.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751512AbbETGD2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 02:03:28 -0400
In-Reply-To: <20150520053614.GA6236@hori1.linux.bs1.fc.nec.co.jp>
Content-Language: ja-JP
Content-ID: <7EE67BA929DD6C4D998C934904A334B5@gisp.nec.co.jp>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Jim Davis <jim.epost@gmail.com>, Chen Gong <gong.chen@linux.intel.com>

Here's an updated patch.

# Randy, I dropped your Ack because there's a major change on this version.
# Would you mind looking at it, please?

---
next-20150515 fails to build on i386 with the following error:

  mm/built-in.o: In function `action_result':
  memory-failure.c:(.text+0x344a5): undefined reference to `__tracepoint_memory_failure_event'
  memory-failure.c:(.text+0x344d5): undefined reference to `__tracepoint_memory_failure_event'
  memory-failure.c:(.text+0x3450c): undefined reference to `__tracepoint_memory_failure_event'

The root cause of this error is the lack of dependency between CONFIG_RAS and
CONFIG_MEMORY_FAILURE.
"CONFIG_RAS=n and CONFIG_MEMORY_FAILURE=y" can happen on 32-bit systems with
CONFIG_SPARSEMEM=n (and all other dependencies of CONFIG_RAS from ACPI_EXTLOG/
PCIEAER/EDAC are false), but that's not supposed to happen.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 52ffb863383c..e79de2bd12cd 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -368,6 +368,7 @@ config MEMORY_FAILURE
 	depends on ARCH_SUPPORTS_MEMORY_FAILURE
 	bool "Enable recovery from hardware memory errors"
 	select MEMORY_ISOLATION
+	select RAS
 	help
 	  Enables code to recover from some memory failures on systems
 	  with MCA recovery. This allows a system to continue running
-- 
2.1.0
