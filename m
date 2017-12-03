From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 4 Dec 2017 10:16:36 +1100
Message-ID: <20171204101636.15953396@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35735 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752233AbdLCXQi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Dec 2017 18:16:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'hva_to_pfn_slow=
':
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1379:35: error: 'start' undec=
lared (first use in this function)
  npages =3D get_user_pages_unlocked(start, 1, &page, flags);
                                   ^

Caused by commit

  eeb7c213c804 ("kvm: switch get_user_page_nowait() to get_user_pages_unloc=
ked()")

I have applied the following fix patch for today:

=46rom e9cc05c8ba9b9f19c62b74e81e4beb67ec9fc09e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 4 Dec 2017 10:13:38 +1100
Subject: [PATCH] kvm: fix for "switch get_user_page_nowait() to get_user_pa=
ges_unlocked()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4f0f0045e634..7b4d46432c85 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1376,7 +1376,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *=
async, bool write_fault,
 	if (async)
 		flags |=3D FOLL_NOWAIT;
=20
-	npages =3D get_user_pages_unlocked(start, 1, &page, flags);
+	npages =3D get_user_pages_unlocked(addr, 1, &page, flags);
 	if (npages !=3D 1)
 		return npages;
=20
--=20
2.15.0

--=20
Cheers,
Stephen Rothwell
