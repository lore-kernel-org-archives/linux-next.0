From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: build warning after merge of the ia64 tree
Date: Thu, 6 Jan 2011 17:04:58 -0800
Message-ID: <987664A83D2D224EAE907B061CE93D53019400FDBC@orsmsx505.amr.corp.intel.com>
References: <20110107112143.2960451d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:18141 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755004Ab1AGBFB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Jan 2011 20:05:01 -0500
In-Reply-To: <20110107112143.2960451d.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Caused by commit ca01d6dd2d7a2652000307520777538740efc286 ("pstore:
> new filesystem interface to platform persistent storage").

Thanks for the bug report.  I just pushed a patch ... so this
should be fixed when you rebuild tomorrow:

commit 168f2e14319aba3125946649604e858cbae85be6
Author: Tony Luck <tony.luck@intel.com>
Date:   Thu Jan 6 16:58:58 2011 -0800

    pstore: fix build warning for unused return value from sysfs_create_file
    
    fs/pstore/inode.c: In function 'init_pstore_fs':
    fs/pstore/inode.c:266: warning: ignoring return value of 'sysfs_create_file', declared with attribute wa
    
    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Tony Luck <tony.luck@intel.com>

-Tony
