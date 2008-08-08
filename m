From: Thomas Meyer <thomas@m3y3r.de>
Subject: next-20080808: bash: fork: Resource temporarily unavailable
Date: Fri, 08 Aug 2008 19:02:15 +0200
Message-ID: <1218214935.3146.5.camel@dhcppc0>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:46715 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbYHHRCI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Aug 2008 13:02:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

Hi.

Beginning with next-20080808 after letting the system run for 5 minutes
or so, I get an error from the fork call, e.g.:

"bash: fork: Resource temporarily unavailable"

Doing an "echo c > /proc/sysrq-trigger" I was able to get an vmcore dump
of the running kernel using the kdump mechanism.

what should i do next?

with kind regards
thomas
