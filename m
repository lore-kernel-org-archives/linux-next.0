From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Mon, 27 Feb 2017 08:27:48 +0000
Message-ID: <30396.1488184068@warthog.procyon.org.uk>
References: <20170227110553.0bb24b02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170227110553.0bb24b02@canb.auug.org.au>
Content-ID: <30395.1488184068.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, DongOh Shin <doscode.kr@gmail.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> ++int f2fs_getattr(const struct path *path, struct kstat *stat, u32 request_mask,
> ++		 unsigned int query_flags);

This looks correct.  I see someone replaced all the function declarations with
ones with named arguments, hence the collision.

David
