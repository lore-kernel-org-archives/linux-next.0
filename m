From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the v4l-dvb tree
Date: Tue, 18 Aug 2015 13:58:10 +1000
Message-ID: <20150818135810.2eb2dba5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54793 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751271AbbHRD6M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 23:58:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Jan Kara <jack@suse.cz>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in:

  drivers/media/v4l2-core/videobuf2-memops.c

between commit:

  6690c8c78c74 ("[media] media: vb2: Remove unused functions")

from the v4l-dvb tree and commit:

  e1c05067c323 ("treewide: fix typos in comment blocks")

from the trivial tree.

I fixed it up (the former removed the code modified by the latter)
and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
