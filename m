From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the ext4 tree with the  tree
Date: Wed, 25 Feb 2009 10:43:59 +0100
Message-ID: <20090225094359.GA27960@duck.suse.cz>
References: <20090225125254.6e94f404.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54490 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752457AbZBYJoH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Feb 2009 04:44:07 -0500
Content-Disposition: inline
In-Reply-To: <20090225125254.6e94f404.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Tso <tytso@MIT.EDU>, linux-next@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>

On Wed 25-02-09 12:52:54, Stephen Rothwell wrote:
> Today's linux-next merge of the ext4 tree got a conflict in
> fs/ext4/ext4.h between commit 7c989bb2f1b18268968ce44c603f18a9854b1b85
> ("ext4: quota reservation for delayed allocation") from the quota tree
> and commit eafffefbb8cc3db4acebb75014091b473c60007d ("ext4: add
> EXT4_IOC_ALLOC_DA_BLKS ioctl") from the ext4 tree.
> 
> Just overlapping additions. I fixed it up (see below) and can carry the
> fix as necessary.
  Thanks.

									Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
