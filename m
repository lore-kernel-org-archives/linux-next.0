From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for July 1 (fix CONFIG_AUDIT_WATCH=n build)
Date: Wed, 1 Jul 2009 15:06:14 +0200
Message-ID: <200907011506.16145.bzolnier@gmail.com>
References: <20090701183903.bd203c62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f225.google.com ([209.85.218.225]:54750 "EHLO
	mail-bw0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557AbZGANA3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2009 09:00:29 -0400
In-Reply-To: <20090701183903.bd203c62.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>


Hi,

On Wednesday 01 July 2009 10:39:03 Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20090630:

=46rom: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] audit: fix CONFIG_AUDIT_WATCH=3Dn build

=46ix:

kernel/auditfilter.c: In function =E2=80=98audit_data_to_entry=E2=80=99=
:
kernel/auditfilter.c:501: error: expected expression before =E2=80=98{=E2=
=80=99 token
kernel/auditfilter.c: In function =E2=80=98audit_add_rule=E2=80=99:
kernel/auditfilter.c:891: error: expected expression before =E2=80=98{=E2=
=80=99 token
make[1]: *** [kernel/auditfilter.o] Error 1
make: *** [kernel/auditfilter.o] Error 2

introduced by commit de85e5bc3690c3063aea790279e898adb5bac0ba
("Audit: split audit watch Kconfig").

Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
BTW defines are pass=C3=A9 (using static inlines instead for CONFIG_AUD=
IT=3Dn
and CONFIG_AUDIT_WATCH=3Dn stuff would be an even better solution)..

 kernel/audit.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

Index: b/kernel/audit.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -117,12 +117,11 @@ extern int audit_watch_compare(struct au
 #else
 #define audit_put_watch(w) {}
 #define audit_get_watch(w) {}
-#define audit_to_watch(k, p, l, o) { -EINVAL }
-#define audit_add_watch(k, l) { -EINVAL }
+#define audit_to_watch(k, p, l, o) (-EINVAL)
+#define audit_add_watch(k, l) (-EINVAL)
 #define audit_remove_watch_rule(k) BUG()
 #define audit_watch_path(w) ""
 #define audit_watch_compare(w, i, d) 0
-
 #endif /* CONFIG_AUDIT_WATCH */
=20
 #ifdef CONFIG_AUDIT_TREE
