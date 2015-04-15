From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: [PATCH 1/2] modpost: fix inverted logic in is_extable_fault_address().
Date: Wed, 15 Apr 2015 10:54:37 +0200
Message-ID: <1429088078-23827-2-git-send-email-quentin.casasnovas@oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
 <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:39913 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753434AbbDOIwc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2015 04:52:32 -0400
In-Reply-To: <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Guenter Roeck <linux@roeck-us.net>
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

As Guenter pointed out, we want to assert that extable_entry_size has been
discovered and not the other way around.  Moreover, this sanity check is
only valid when we're not dealing with the first relocation in __ex_table,
since we have not discovered the extable entry size at that point.

This was leading to a divide-by-zero on some architectures and make the
build fail.

Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
CC: Rusty Russell <rusty@rustcorp.com.au>
---
 scripts/mod/modpost.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 22dbc60..93bb87d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1529,7 +1529,12 @@ static void find_extable_entry_size(const char* const sec, const Elf_Rela* r,
 }
 static inline bool is_extable_fault_address(Elf_Rela *r)
 {
-	if (!extable_entry_size == 0)
+	/*
+	 * extable_entry_size is only discovered after we've handled the
+	 * _second_ relocation in __ex_table, so only abort when we're not
+	 * handling the first reloc and extable_entry_size is zero.
+	 */
+	if (r->r_offset && extable_entry_size == 0)
 		fatal("extable_entry size hasn't been discovered!\n");
 
 	return ((r->r_offset == 0) ||
-- 
2.0.5
