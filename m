From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the pm tree with the xfs tree
Date: Mon, 19 Dec 2011 16:01:48 +1100
Message-ID: <20111219050148.GP23662@dastard>
References: <20111219151145.dba82854f65671a877db8ed3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111219151145.dba82854f65671a877db8ed3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Eric Sandeen <sandeen@sandeen.net>, Ben Myers <bpm@sgi.com>, xfs-masters@oss.sgi.com
List-Id: linux-next.vger.kernel.org

On Mon, Dec 19, 2011 at 03:11:45PM +1100, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> fs/xfs/xfs_buf.c between commit 687d1c5e8e26 ("xfs: remove unused
> XBT_FORCE_SLEEP bit") from the xfs tree and commit a0acae0e886d
> ("freezer: unexport refrigerator() and update try_to_freeze() slightly")
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks correct from the XFS POV, Stephen. Thanks.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
