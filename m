From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Bogus dir.c file introduced at top level.
Date: Wed, 19 Feb 2014 13:02:16 -0500
Message-ID: <5304F1A8.1030503@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:59745 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754458AbaBSSB1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2014 13:01:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Tiejun,

This merge:

commit a8fa94e0f2ab665f9aa665195618178b61ed8304
Merge: 9561a89 b28a960
Author: Tejun Heo <tj@kernel.org>
Date:   Mon Feb 10 19:34:30 2014 -0500

    Merge branch 'master' into driver-core-next-test-merge-rc2

introduces a bogus copy of fs/kernfs/dir.c at the top level of
the tree.  Seen in the Feb19th linux-next tree.

Thanks,
Paul.
