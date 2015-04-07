From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 7 Apr 2015 09:02:14 +0200
Message-ID: <20150407070214.GA7074@lst.de>
References: <20150407140035.60d2053d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:56873 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028AbbDGHCQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 03:02:16 -0400
Content-Disposition: inline
In-Reply-To: <20150407140035.60d2053d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@huawei.com>, Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>

On Tue, Apr 07, 2015 at 02:00:35PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in fs/ext4/inode.c between commit 72b8e0f9fa8a ("ext4: remove unused header files") from the ext4 tree and commit e2e40f2c1ed4 ("fs: move struct kiocb to fs.h") from the vfs tree.

FYI, the ext4 tree seems to have the crypto support, which I don't think is
ready for 4.1 with all the implications of it..
