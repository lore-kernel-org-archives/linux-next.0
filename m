From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] params: Fix parse_args() use in PowerPC's reserve_hugetlb_gpages()
Date: Fri, 17 Feb 2012 16:08:36 +0000
Message-ID: <1329494916-20575-1-git-send-email-pawel.moll@arm.com>
References: <20120216111513.918494b07a5331eabe3d32ac@canb.auug.org.au>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:48466 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab2BQQJQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2012 11:09:16 -0500
In-Reply-To: <20120216111513.918494b07a5331eabe3d32ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Michael Neuling <mikey@neuling.org>, galak@kernel.crashing.org, Becky Bruce <beckyb@kernel.crashing.org>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, McClintock Matthew-B29882 <B29882@freescale.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Pawel Moll <pawel.moll@arm.com>

Commit b8076966e8e1 ("params: <level>_initcall-like kernel parameters")
changed the parse_args() API without fixing all the callers. Done now.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 arch/powerpc/mm/hugetlbpage.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 57c7465..a3e6287 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -310,7 +310,8 @@ void __init reserve_hugetlb_gpages(void)
 =09int i;
=20
 =09strlcpy(cmdline, boot_command_line, COMMAND_LINE_SIZE);
-=09parse_args("hugetlb gpages", cmdline, NULL, 0, &do_gpage_early_setup);
+=09parse_args("hugetlb gpages", cmdline, NULL, 0, 0, 0,
+=09=09=09&do_gpage_early_setup);
=20
 =09/*
 =09 * Walk gpage list in reverse, allocating larger page sizes first.
--=20
1.7.5.4
