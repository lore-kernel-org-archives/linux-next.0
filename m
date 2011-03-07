From: Mariusz Kozlowski <mk@lab.zgora.pl>
Subject: [PATCH] staging/hv: add missing include causing build error
Date: Mon,  7 Mar 2011 20:34:30 +0100
Message-ID: <1299526470-8988-1-git-send-email-mk@lab.zgora.pl>
References: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from unix.wroclaw.pl ([94.23.28.62]:38813 "EHLO unix.wroclaw.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755627Ab1CGTen (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Mar 2011 14:34:43 -0500
In-Reply-To: <20110307180547.0cd7b9eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Hank Janssen <hjanssen@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Mariusz Kozlowski <mk@lab.zgora.pl>

This fixes following build error:

In file included from drivers/staging/hv/channel.h:28,
                 from drivers/staging/hv/vmbus_private.h:30,
                 from drivers/staging/hv/hv.c:28:
drivers/staging/hv/channel_mgmt.h:234: error: field =E2=80=98work=E2=80=
=99 has incomplete type

Signed-off-by: Mariusz Kozlowski <mk@lab.zgora.pl>
---

=46ound with randconfig on x86.

 drivers/staging/hv/channel_mgmt.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/hv/channel_mgmt.h b/drivers/staging/hv/cha=
nnel_mgmt.h
index 3368bf1..96f74e2 100644
--- a/drivers/staging/hv/channel_mgmt.h
+++ b/drivers/staging/hv/channel_mgmt.h
@@ -27,6 +27,7 @@
=20
 #include <linux/list.h>
 #include <linux/timer.h>
+#include <linux/workqueue.h>
 #include "ring_buffer.h"
 #include "vmbus_channel_interface.h"
 #include "vmbus_packet_format.h"
--=20
1.7.0.4
