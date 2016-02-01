From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 1 Feb 2016 14:45:21 +1100
Message-ID: <20160201144521.0378c6a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37031 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933655AbcBADpZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 22:45:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Ricardo Ruedas <ricardo.ruedas@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/panel/panel.c

between commit:

  b64a1cbef6df ("Revert "Staging: panel: usleep_range is preferred over udelay"")

from the staging.current tree and commit:

  df44f1504b4d ("staging: panel: remove warnings line over 80 characters")

from the staging tree.

I fixed it up (I used the staging.current version) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell
