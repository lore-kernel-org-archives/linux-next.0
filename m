From: Guenter Roeck <linux@roeck-us.net>
Subject: crisv32 runtime failure in -next due to 'page-flags: define behavior
 SL*B-related flags on compound pages'
Date: Thu, 17 Sep 2015 09:29:27 -0700
Message-ID: <55FAEA67.9000102@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58787 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751797AbbIQQ3b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2015 12:29:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com

Hi,

my crisv32 qemu test fails with next-20150917 as follows.

NET: Registered protocol family 16
kernel BUG at mm/slab.c:1648!
Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
Oops: 0000

[ register dump follows ]

See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/8=
3/steps/qemubuildcommand/logs/stdio
for a complete log.

Bisect points to 'page-flags: define behavior SL*B-related flags on com=
pound pages'.

One of the bisect steps, at 'mm: support madvise(MADV_FREE)', causes a =
build failure,
but that did not seem to affect the overall bisect results. Just for co=
mpleteness,
here is the reported build failure.

mm/vmscan.c: In function =E2=80=98shrink_page_list=E2=80=99:
mm/vmscan.c:1093:5: error: implicit declaration of function =E2=80=98__=
clear_page_locked=E2=80=99 [-Werror=3Dimplicit-function-declaration]
      __clear_page_locked(page);
      ^

Guenter

---
Bisect log:

# bad: [01c8787d7f7ea56c16d94cf7133022189be231ad] Add linux-next specif=
ic files for 20150917
# good: [6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f] Linux 4.3-rc1
git bisect start 'HEAD' 'v4.3-rc1'
# good: [5b986ec423c0e7615824a46b48e6d5cfa45ac82d] Merge remote-trackin=
g branch 'battery/master'
git bisect good 5b986ec423c0e7615824a46b48e6d5cfa45ac82d
# good: [d4cb33477f815c8a0c8b1c28e986c79d89d37491] Merge remote-trackin=
g branch 'staging/staging-next'
git bisect good d4cb33477f815c8a0c8b1c28e986c79d89d37491
# good: [b73c6555e0733dc811d6f7b533183c518d6c7bb2] Merge remote-trackin=
g branch 'livepatching/for-next'
git bisect good b73c6555e0733dc811d6f7b533183c518d6c7bb2
# good: [5c74cd46dcbc65a682b2bdfc74d51feac91c0e0f] mm-introduce-vm_lock=
onfault-v9
git bisect good 5c74cd46dcbc65a682b2bdfc74d51feac91c0e0f
# bad: [b928350d7f112a2525516c444ebac84ed53e937e] mm: support madvise(M=
ADV_FREE)
git bisect bad b928350d7f112a2525516c444ebac84ed53e937e
# good: [8129659afb03679ae08e6bc862c78bc571a10170] page-flags-introduce=
-page-flags-policies-wrt-compound-pages-fix
git bisect good 8129659afb03679ae08e6bc862c78bc571a10170
# bad: [f285037c71068de549f2432c9d275844575707de] page-flags: look at h=
ead page if the flag is encoded in page->mapping
git bisect bad f285037c71068de549f2432c9d275844575707de
# bad: [ceba84a8eac816c92d1f1789b1273f812ac9af80] page-flags: define PG=
_reserved behavior on compound pages
git bisect bad ceba84a8eac816c92d1f1789b1273f812ac9af80
# good: [40774838143f84a5c38ecee2f142bbd6b9a0687a] page-flags: define b=
ehavior of LRU-related flags on compound pages
git bisect good 40774838143f84a5c38ecee2f142bbd6b9a0687a
# bad: [fcd079cce0714accc45d35ffad59bf05ddb37893] page-flags: define be=
havior of Xen-related flags on compound pages
git bisect bad fcd079cce0714accc45d35ffad59bf05ddb37893
# bad: [2c42f049fc7aa8198514707bce436c7f9f2c318f] page-flags: define be=
havior SL*B-related flags on compound pages
git bisect bad 2c42f049fc7aa8198514707bce436c7f9f2c318f
# first bad commit: [2c42f049fc7aa8198514707bce436c7f9f2c318f] page-fla=
gs: define behavior SL*B-related flags on compound pages
