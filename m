From: Noah Watkins <jayhawk@soe.ucsc.edu>
Subject: regression: wireless authentication
Date: Thu, 16 Jul 2009 20:57:06 -0700
Message-ID: <20090717035706.GA5923@martini>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-01.cse.ucsc.edu ([128.114.48.32]:39062 "EHLO
	mail-01.cse.ucsc.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269AbZGQEFw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2009 00:05:52 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: jayhawk@soe.ucsc.edu

With 2.6.31-rc3-next-20090716 all wireless access points are detected, but
authentication fails. I haven't verified on an access point w/o WPA.

2.6.31-rc3 functions fine. I haven't been able to complete a bisect yet.

05:01.0 Network controller: Atheros Communications Inc. AR5008 Wireless Network
Adapter (rev 01)

noah
