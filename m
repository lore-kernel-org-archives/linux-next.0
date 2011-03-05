From: Jesper Juhl <jj@chaosbits.net>
Subject: Duplicate patches in the tree
Date: Sat, 5 Mar 2011 21:45:19 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1103052113270.32044@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from swampdragon.chaosbits.net ([90.184.90.115]:13345 "EHLO
	swampdragon.chaosbits.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752197Ab1CEUpx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Mar 2011 15:45:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen

I noticed something currious today in linux-next. 
There are, what looks to me like, duplicate patches with different commit 
id's but identical contents. Perhaps this is just a git artefact that I 
don't know about, but it seemed currious enough that I thought I'd ask.

The two patches are these (from 'git log'):

commit a9c3809db31be860db4e8ecf8ab359159c935a3b
Author: Jesper Juhl <jj@chaosbits.net>
Date:   Wed Feb 23 23:45:55 2011 +0100

commit 4b2f67d756cf4a5ed8e8d11caa7dcea06c41a09e
Author: Jesper Juhl <jj@chaosbits.net>
Date:   Wed Feb 23 23:45:55 2011 +0100

They are completely identical except for the commit id.

If I do a 'git log drivers/regulator/mc13xxx-regulator-core.c' I only see 
commit 4b2f67d756cf4a5ed8e8d11caa7dcea06c41a09e .

Please enlighten me if this is perfectly normal and not a problem. 
Currently I'm a bit puzzled by two commit id's showing up for the same 
change..

-- 
Jesper Juhl <jj@chaosbits.net>            http://www.chaosbits.net/
Plain text mails only, please.
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
