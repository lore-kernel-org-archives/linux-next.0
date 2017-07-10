From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rtc tree with Linus' tree
Date: Mon, 10 Jul 2017 13:57:01 +1000
Message-ID: <20170710135701.01b446e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53591 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753069AbdGJD5J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Jul 2017 23:57:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, John Stultz <john.stultz@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>

Hi Alexandre,

Today's linux-next merge of the rtc tree got a conflict in:

  tools/testing/selftests/timers/Makefile

between commit:

  767392565a3e ("kselftests: timers: Add test for frequency step")

from Linus' tree and commit:

  c96396f0780e ("tools: timer: add rtctest_setdate")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/timers/Makefile
index 5801bbefbe89,54481f17518a..000000000000
--- a/tools/testing/selftests/timers/Makefile
+++ b/tools/testing/selftests/timers/Makefile
@@@ -8,8 -8,8 +8,8 @@@ TEST_GEN_PROGS = posix_timers nanoslee
  	     inconsistency-check raw_skew threadtest rtctest
  
  TEST_GEN_PROGS_EXTENDED = alarmtimer-suspend valid-adjtimex adjtick change_skew \
 -		      skew_consistency clocksource-switch leap-a-day \
 +		      skew_consistency clocksource-switch freq-step leap-a-day \
- 		      leapcrash set-tai set-2038 set-tz
+ 		      leapcrash set-tai set-2038 set-tz rtctest_setdate
  
  
  include ../lib.mk
