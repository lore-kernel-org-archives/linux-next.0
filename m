From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 16:43:27 -0400
Message-ID: <20150414204327.GC29810@thunk.org>
References: <20150407140035.60d2053d@canb.auug.org.au>
 <20150407070214.GA7074@lst.de>
 <20150408032646.GE21171@thunk.org>
 <20150414161841.GA8479@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:39476 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753409AbbDNUni (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 16:43:38 -0400
Content-Disposition: inline
In-Reply-To: <20150414161841.GA8479@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@huawei.com>

On Tue, Apr 14, 2015 at 06:18:41PM +0200, Christoph Hellwig wrote:
> Also for something that while only
> implemented in one filesystem has pretty broad API implications I'd
> really expect a generalist VFS review (I plan to get to it ASAP..).

There really isn't much of an API.  We have an ioctl to set the
encryption policy (which currently is only which encryption key and
the encryption modes to be used) on an empty directory, an ioctl to
fetch the encryption policy, and an ioctl to get a per-file system
password salt[1] (to protect against rainbow tables).

We *know* that the API will be need to be extended to support more
complicated encryption policies (i.e., the use of public key, files
that can be read by possessors of more than one key, etc.), but we
also know we're not smart enough to figure out what that API will look
like right now.  So that is something that will have to be extended
later, almost certainly with a new ioctl.

So I've designed the existing interface to be things that can be
easily supported into the future, and if the existing interfaces are
only supported by ext4, and someone else wants to design a new system
call, and argue about x509 vs GPG certificates for the future use of
public key crypto, that's fine.  I just don't want the patches to be
delayed while the interface bikeshedding party is going on.  :-)

					- Ted

[1] Note that the use of the password salt, and the string-to-key
algorithm specified by NIST SP800-132, is purely optional.  It's what
the e4crypt userspace tool happens to use, but if you want to use your
own string-to-key algorithm, or just use bare AES keys, a userspace
tool can always do that.
