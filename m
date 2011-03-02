From: Joe Perches <joe@perches.com>
Subject: RFC: Removing old tags, reducing the git size of -next.
Date: Tue, 01 Mar 2011 20:22:26 -0800
Message-ID: <1299039746.4208.28.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:4030 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757821Ab1CBEW2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2011 23:22:28 -0500
Received: from [192.168.1.162] (unknown [192.168.1.162])
	by mail.perches.com (Postfix) with ESMTP id 8DB8824368
	for <linux-next@vger.kernel.org>; Tue,  1 Mar 2011 20:22:19 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>

I personally do not find git history to be very useful
for the next tree.  The collected next tree history
also makes the repository fairly large and unwieldy to
use on smaller development systems.

Would it be reasonable to create a separate history tree
for -next every once in awhile and have say a maximum of
a few weeks of next history in the current tree?
