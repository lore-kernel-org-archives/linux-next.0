From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Date: Mon, 13 Apr 2015 12:12:11 +1000
Message-ID: <20150413021211.GP15810@dastard>
References: <20150413115737.6ec67270@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <20150413115737.6ec67270@canb.auug.org.au>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, xfs@oss.sgi.com, David Howells <dhowells@redhat.com>, Ben Myers <bpm@sgi.com>, linux-next@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 13, 2015 at 11:57:37AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/xfs/xfs_iops.c between commit e8e9ad42c1f1 ("xfs: take i_mmap_lock
> on extent manipulation operations") from the xfs tree and commit
> 5dd3dc06371a ("VFS: normal filesystems (and lustre): d_inode()
> annotations") from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc fs/xfs/xfs_iops.c
> index 015d6a366b16,54b95232d946..000000000000
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@@ -953,13 -975,9 +953,13 @@@ xfs_vn_setattr
>   		uint		iolock = XFS_IOLOCK_EXCL;
>   
>   		xfs_ilock(ip, iolock);
> - 		error = xfs_break_layouts(dentry->d_inode, &iolock);
> + 		error = xfs_break_layouts(d_inode(dentry), &iolock);
>  -		if (!error)
>  +		if (!error) {
>  +			xfs_ilock(ip, XFS_MMAPLOCK_EXCL);
>  +			iolock |= XFS_MMAPLOCK_EXCL;
>  +
>   			error = xfs_setattr_size(ip, iattr);
>  +		}
>   		xfs_iunlock(ip, iolock);
>   	} else {
>   		error = xfs_setattr_nonsize(ip, iattr, 0);

Fix looks good. FWIW, I'm just about to commit a locking fix
which adds a parameter to xfs_break_layouts() so you might need to
rework this again tomorrow...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
