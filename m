From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the vhost tree
Date: Wed, 31 Jan 2018 11:14:22 +1100
Message-ID: <20180131111422.7678db56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751606AbeAaAOZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Jan 2018 19:14:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Legoll <vincent.legoll@gmail.com>, Randy Dunlap <rdunlap@infradead.org>

Hi Michael,

Commit

  4824751c76a6 ("virtio: make VIRTIO a menuconfig to ease disabling it all")

is missing a Signed-off-by from its committer.

It also has 2 sets of Reviewed-by/Tested-by tags from Randy Dunlap.

-- 
Cheers,
Stephen Rothwell
