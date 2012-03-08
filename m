From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next broken by "ARM: S3C2440: move mach-s3c2440/* into
 mach-s3c24xx/"
Date: Thu, 8 Mar 2012 11:23:26 -0500
Message-ID: <20120308162326.GA30941@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:35077 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754216Ab2CHQX6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 11:23:58 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, tiwai@suse.de, linux-next@vger.kernel.org

Something bad happened in this commit (dd6f01b5cc).  It looks like
the moved file is truncated, causing this failure:

http://kisskb.ellerman.id.au/kisskb/buildresult/5818815/

I believe it came in via the fix/asoc tree.

Paul.
--

paul@yow-lpgnfs-02:~/git/linux-head$ git show `git rev-list --merges dd6f01b5cc..mar8|tail -n1`
commit 79ad0a5e9210b165c62e269eb48ade9361c630f3
Merge: 94a8d5c 539d3d8
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Sep 24 09:16:15 2009 +0200

    Merge branch 'fix/asoc' into for-next

paul@yow-lpgnfs-02:~/git/linux-head$ 
