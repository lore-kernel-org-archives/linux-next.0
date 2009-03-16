From: "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>
Subject: RE: linux-next: manual merge of the net tree with the net-current
 tree
Date: Sun, 15 Mar 2009 23:41:04 -0700
Message-ID: <A78C6259B11833419567082E2DC0C256C3D52894@orsmsx508.amr.corp.intel.com>
References: <20090316160501.6b20c544.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:15679 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751419AbZCPGlI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 02:41:08 -0400
In-Reply-To: <20090316160501.6b20c544.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Duyck, Alexander H" <alexander.h.duyck@intel.com>

>-----Original Message-----
>From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
>Sent: Sunday, March 15, 2009 10:05 PM
>To: David Miller
>Cc: linux-next@vger.kernel.org; Duyck, Alexander H; Kirsher, Jeffrey T
>Subject: linux-next: manual merge of the net tree with the net-current tree
>
>Hi David,
>
>Today's linux-next merge of the net tree got a conflict in
>drivers/net/igb/igb_main.c between commit
>682337fe062e939578d933c74157ae9a36baa4ce ("igb: remove ASPM L0s
>workaround") from the net-current tree and commits
>aed5dec370e294233d647251ce1e5f74d70b09c9 ("igb: remove check for needing
>an io port") and 450c87c8d28aeaf83889389ceeb01457c1a6f3e9 ("igb: remove
>redundant count set and err_hw_init") from the net tree.
>
>I fixed it up (see below) and can carry the fix as necessary.
>--
>Cheers,
>Stephen Rothwell                    sfr@canb.auug.org.au
>http://www.canb.auug.org.au/~sfr/
>

Ack, the fix.  I figured this might happen.

Cheers,
Jeff
