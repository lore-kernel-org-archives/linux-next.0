From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Having a linux-next feed tree based on net-next
Date: Thu, 17 May 2012 19:33:02 -0400
Message-ID: <4FB58AAE.4060900@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:36914 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761133Ab2EQXdJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 May 2012 19:33:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next >> \"linux-next@vger.kernel.org\"" <linux-next@vger.kernel.org>

Hi Stephen,

The commits for deleting the MCA support have a dependency
on the net-next content from DaveM.  I checked your merge
log and since you take the moduleh feed after merging the
DaveM content, I don't think having the moduleh tree using
a baseline from net-next should be an issue  Anyway just a
heads up. If it causes you any grief, just drop the tree
for today, and I'll feed those changes back in once DaveM's
tree is merged to Linus' tree next week.

Thanks,
Paul.
