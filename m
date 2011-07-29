From: Mike Frysinger <vapier.adi@gmail.com>
Subject: atomic_set_mask duplication
Date: Fri, 29 Jul 2011 00:47:03 -0700
Message-ID: <CAMjpGUejy+p2+86DT8-LDMzWYxKKBp=2SQTNZ=7KaFoPMRiJ4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:61305 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754999Ab1G2HrY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 03:47:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

seems that my atomic_set_mask() patch for asm-generic/atomic.h has
made it into linux-next but duplicated ?  any idea what's going on ?

commit 00b3c28bd753 is correct.  but then we also have 49472be55954
which should not exist ...
-mike
