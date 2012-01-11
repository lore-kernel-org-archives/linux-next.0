From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the ceph tree with Linus' tree
Date: Wed, 11 Jan 2012 01:31:27 +0000
Message-ID: <20120111013127.GE23916@ZenIV.linux.org.uk>
References: <20120111122744.7db3bfb91d79b1307db02228@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120111122744.7db3bfb91d79b1307db02228@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sage Weil <sage@newdream.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@dreamhost.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 11, 2012 at 12:27:44PM +1100, Stephen Rothwell wrote:
> Hi Sage,
> 
> Today's linux-next merge of the ceph tree got a conflict in
> fs/ceph/super.c between commit 3c5184ef1216 ("ceph: d_alloc_root() may
> fail") from Linus' tree and commit 26d913cdd955 ("ceph: always initialize
> the dentry in open_root_dentry()") from the ceph tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Ahem...  

>  +			root = d_obtain_alias(inode);
>  +		}
> + 		ceph_init_dentry(root);

What will happen if dentry returned by d_obtain_alias() had already existed?
