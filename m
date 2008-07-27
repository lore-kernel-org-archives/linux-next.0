From: Thomas Meyer <thomas@m3y3r.de>
Subject: next-20080725: System hangs while suspending to disk
Date: Sun, 27 Jul 2008 10:02:11 +0200
Message-ID: <1217145731.3053.6.camel@dhcppc2>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:53228 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824AbYG0ICU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 27 Jul 2008 04:02:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux Kernel <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

I tried to get some console output, so i tried "test" instead of
plattform and got an oops in native_cpu_up().

When i do "echo 0 > /sys/devices/system/cpu/cpu1/online" and
"echo 1 > /sys/devices/system/cpu/cpu1/online" again, i get the
same Oops report (as compared to a "test run with state disk")

http://kerneloops.org/guilty.php?guilty=native_cpu_up&version=2.6.26-release&start=1736704&end=1769471&class=oops

What is wrong here?

Greets
thomas
