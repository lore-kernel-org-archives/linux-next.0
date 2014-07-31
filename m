From: Michal Hocko <mhocko@suse.cz>
Subject: [PATCH] kexec-export-free_huge_page-to-vmcoreinfo-fix (was: Re:
 mmotm 2014-07-30-15-57 uploaded)
Date: Thu, 31 Jul 2014 11:24:52 +0200
Message-ID: <20140731092452.GB13561@dhcp22.suse.cz>
References: <53d978aa.dtIIGjOqrXXmAm4e%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55153 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932262AbaGaJY5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Jul 2014 05:24:57 -0400
Content-Disposition: inline
In-Reply-To: <53d978aa.dtIIGjOqrXXmAm4e%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Atsushi Kumagai <kumagai-atsushi@mxc.nes.nec.co.jp>, Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>

On Wed 30-07-14 15:58:50, Andrew Morton wrote:
> * kexec-export-free_huge_page-to-vmcoreinfo.patch

This one seems to be missing ifdef for CONFIG_HUGETLBFS
---
=46rom bcccb6696b89c700712421858b05dd89ea0d1ec5 Mon Sep 17 00:00:00 200=
1
=46rom: Michal Hocko <mhocko@suse.cz>
Date: Thu, 31 Jul 2014 11:18:57 +0200
Subject: [PATCH] kexec-export-free_huge_page-to-vmcoreinfo-fix
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

free_huge_page is not defined for !CONFIG_HUGETLBFS. Fix the following
compilation error:

kernel/kexec.c: In function =E2=80=98crash_save_vmcoreinfo_init=E2=80=99=
:
kernel/kexec.c:1628:20: error: =E2=80=98free_huge_page=E2=80=99 undecla=
red (first use in this function)
  VMCOREINFO_SYMBOL(free_huge_page);

Signed-off-by: Michal Hocko <mhocko@suse.cz>
---
 kernel/kexec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index a3ccf9d7174b..507614acf938 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -1625,7 +1625,9 @@ static int __init crash_save_vmcoreinfo_init(void=
)
 #endif
 	VMCOREINFO_NUMBER(PG_head_mask);
 	VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);
+#ifdef CONFIG_HUGETLBFS
 	VMCOREINFO_SYMBOL(free_huge_page);
+#endif
=20
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
--=20
2.0.1

--=20
Michal Hocko
SUSE Labs
