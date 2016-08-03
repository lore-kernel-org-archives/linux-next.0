From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: please clean up the fscache tree
Date: Wed, 03 Aug 2016 14:30:32 +0100
Message-ID: <30818.1470231032@warthog.procyon.org.uk>
References: <20160803111510.65620fc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160803111510.65620fc7@canb.auug.org.au>
Content-ID: <30817.1470231032.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> The fscache tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git#fscache)
> only contains 2 commits:
> 
> b00c2ae2ed3c FS-Cache: Don't override netfs's primary_index if registering failed
> 3c9b3b74606d FS-Cache: Increase reference of parent after registering, netfs success
> 
> which also exist in Linus' tree as other commits (they were merged in
> Nov, 2015 via Al Viro).
> 
> Please clean this up, or let me know if it is not going to be used any
> more and I will delete the tree from linux-next.

Done.

David
