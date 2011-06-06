From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: l2-mtd-2.6.git to linux-next
Date: Mon, 06 Jun 2011 10:37:30 +0300
Message-ID: <1307345850.3135.24.camel@localhost>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:45288 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755115Ab1FFHlr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2011 03:41:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>

Stephen,

as we've discussed, please, include l2-mtd-2.6.git tree to linux-next:

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git master

David, Stephen would like to see your explicit ack.

To make a long story short, currently the MTD subsystem maintenance is =
a
team work:

1. David is the maintainer who has the ultimate authority to merge or
   reject patches, and who holds the biggest MTD experience/knowledge.

2. David is busy with other projects and has no time to routinely
   review patches and merge them to the mtd-2.6.git tree. And I help hi=
m
   with my "level 2" l2-mtd-2.6.git tree.

By including l2-mtd-2.6.git into linux-next we want to solve the
following problem: because of lack of time dwmw2 does not always merges
patches to the mtd-2.6.git tree, and often we are in a situation when
MTD patches are exposed to linux-next for a day or 2, during the merge
window, and then they are merged.

Thanks!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
