From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with Linus' tree
Date: Fri, 24 Jul 2015 13:59:21 +1000
Message-ID: <20150724135921.0a2c3bef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52618 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751910AbbGXD7X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 23:59:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Mammedov <imammedo@redhat.com>

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/vhost/vhost.c

between commit:

  4de7255f7d2b ("vhost: extend memory regions allocation to vmalloc")

from Linus' tree and commit:

  a4883f62470c ("vhost: extend memory regions allocation to vmalloc")

from the vhost tree.

These are two slightly different versions of the same patch.  I used
the version from Linus' tree.  Please clean your tree up.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
