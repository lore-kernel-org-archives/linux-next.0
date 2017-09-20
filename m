From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Date: Wed, 20 Sep 2017 14:28:48 +1000
Message-ID: <20170920142848.24ae8a3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51629 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751000AbdITE2u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Sep 2017 00:28:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>

Hi all,

Commit

  b8b14037d451 ("cifs: show 'soft' in the mount options for !hard mounts")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
