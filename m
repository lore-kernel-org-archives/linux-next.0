From: Sage Weil <sage@newdream.net>
Subject: Re: linux-next: vfs tree build warning
Date: Sun, 17 Jan 2010 20:34:29 -0800 (PST)
Message-ID: <Pine.LNX.4.64.1001172032590.16533@cobra.newdream.net>
References: <20100118131139.1ef42c6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755735Ab0AREeP@vger.kernel.org>
In-Reply-To: <20100118131139.1ef42c6f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, 18 Jan 2010, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next build (x86_64_allmodconfig) produced this warning:
> 
> fs/ceph/super.c:216: warning: initialization from incompatible pointer type
> 
> Introduced by commit bc39e28236344af617473df80abb7de43176511e ("pass
> writeback_control to ->write_inode") from the vfs tree interacting with
> commit 16725b9d2a2e3d0fd2b0034482e2eb0a2d78050f ("ceph: super.c") from
> the ceph tree.
> 
> This will need a fixup patch (see below) which I can carry in the
> linux-next tree.  There may, of course, be a better fix (which I can
> carry if someone sends it to me).

I can put this in the for-next branch of the ceph tree.

Thanks-
sage
