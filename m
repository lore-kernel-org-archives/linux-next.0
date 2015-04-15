From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: [PATCH 2/2] modpost: fix extable entry size calculation.
Date: Wed, 15 Apr 2015 10:54:38 +0200
Message-ID: <1429088078-23827-3-git-send-email-quentin.casasnovas@oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:39921 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754134AbbDOIwd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 04:52:33 -0400
In-Reply-To: <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Guenter Roeck <linux@roeck-us.net>
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

As Guenter pointed out, we were never really calculating the extable entry
size because the pointer arithmetic was simply wrong.  We want to check
we're handling the second relocation in __ex_table to infer an entry size,
but we were using (void*) pointers instead of Elf_Rel[a]* ones.

This fixes the problem by moving that check in the caller (since we can
deal with different types of relocations) and add is_second_extable_reloc()
to make the whole thing more readable.

Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
CC: Rusty Russell <rusty@rustcorp.com.au>
---
 scripts/mod/modpost.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 93bb87d..fd94977 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1511,8 +1511,7 @@ static int is_executable_section(struct elf_info* elf, unsigned int section_inde
  * to know the sizeof(struct exception_table_entry) for the target architecture.
  */
 static unsigned int extable_entry_size = 0;
-static void find_extable_entry_size(const char* const sec, const Elf_Rela* r,
-				    const void* start, const void* cur)
+static void find_extable_entry_size(const char* const sec, const Elf_Rela* r)
 {
 	/*
 	 * If we're currently checking the second relocation within __ex_table,
@@ -1523,10 +1522,10 @@ static void find_extable_entry_size(const char* const sec, const Elf_Rela* r,
 	 * seems to go with different sized types.  Not pretty but better than
 	 * hard-coding the size for every architecture..
 	 */
-	if (!extable_entry_size && cur == start + 1 &&
-	    strcmp("__ex_table", sec) == 0)
+	if (!extable_entry_size)
 		extable_entry_size = r->r_offset * 2;
 }
+
 static inline bool is_extable_fault_address(Elf_Rela *r)
 {
 	/*
@@ -1541,6 +1540,9 @@ static inline bool is_extable_fault_address(Elf_Rela *r)
 		(r->r_offset % extable_entry_size == 0));
 }
 
+#define is_second_extable_reloc(Start, Cur, Sec)			\
+	(((Cur) == (Start) + 1) && (strcmp("__ex_table", (Sec)) == 0))
+
 static void report_extable_warnings(const char* modname, struct elf_info* elf,
 				    const struct sectioncheck* const mismatch,
 				    Elf_Rela* r, Elf_Sym* sym,
@@ -1769,7 +1771,8 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		/* Skip special sections */
 		if (is_shndx_special(sym->st_shndx))
 			continue;
-		find_extable_entry_size(fromsec, &r, start, rela);
+		if (is_second_extable_reloc(start, rela, fromsec))
+			find_extable_entry_size(fromsec, &r);
 		check_section_mismatch(modname, elf, &r, sym, fromsec);
 	}
 }
@@ -1828,7 +1831,8 @@ static void section_rel(const char *modname, struct elf_info *elf,
 		/* Skip special sections */
 		if (is_shndx_special(sym->st_shndx))
 			continue;
-		find_extable_entry_size(fromsec, &r, start, rel);
+		if (is_second_extable_reloc(start, rel, fromsec))
+			find_extable_entry_size(fromsec, &r);
 		check_section_mismatch(modname, elf, &r, sym, fromsec);
 	}
 }
-- 
2.0.5
