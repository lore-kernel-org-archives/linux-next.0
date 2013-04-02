From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: manual merge of the vfs tree with the ia64 tree
Date: Tue, 2 Apr 2013 16:42:27 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F1E09672C@ORSMSX108.amr.corp.intel.com>
References: <20130402112017.8c5e288cbbd31f93788df9d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:60898 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752238Ab3DBQma convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Apr 2013 12:42:30 -0400
In-Reply-To: <20130402112017.8c5e288cbbd31f93788df9d5@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>

> Today's linux-next merge of the vfs tree got a conflict in
> arch/ia64/kernel/palinfo.c between commit 40c275bd92b8 ("[IA64] Fix stack
> overflow in create_palinfo_proc_entries") from the ia64 tree and commit
> d8e904861a28 ("palinfo fixes") from the vfs tree.
>
> I fixed it up (arbitrarily choosing the vfs tree version) and can carry
> the fix as necessary (no action is required).

It looks like you picked the version from the ia64 tree - but it would have
been better to pick Al's version. He wastes less space on the stack by only
declaring cpustr[3+4+1] instead of cpustr[32], but more importantly he
checks the return value from proc_mkdir().

I'll drop 40c275bd92b8 out of my tree so Al's can go in without a conflict.

-Tony
