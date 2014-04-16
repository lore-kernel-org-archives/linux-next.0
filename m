From: Dave Chinner <david@fromorbit.com>
Subject: Re: new 64 bit math link fail in xfs in linux-next today
Date: Thu, 17 Apr 2014 07:57:33 +1000
Message-ID: <20140416215733.GM15995@dastard>
References: <534EAB41.60901@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail06.adl2.internode.on.net ([150.101.137.129]:41000 "EHLO
	ipmail06.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751390AbaDPV6G (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Apr 2014 17:58:06 -0400
Content-Disposition: inline
In-Reply-To: <534EAB41.60901@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: xfs@oss.sgi.com, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Apr 16, 2014 at 12:09:37PM -0400, Paul Gortmaker wrote:
> Hi Dave,
> 
> Not sure if this has been reported yet, but this new failure showed
> up in the xtensa link of today's linux-next builds.
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/10938384/

fs/built-in.o: In function `__xfs_get_blocks':
/home/dave/src/build/x86-64/xfsdev/fs/xfs/xfs_aops.c:1368: undefined reference to `__divdi3'

Fmeh. The hunk that throws the error:

@@ -1354,6 +1362,12 @@ __xfs_get_blocks(
                ASSERT(mapping_size > 0);
                if (mapping_size > size)
                        mapping_size = size;
+               if (offset < i_size_read(inode) &&
+                   offset + mapping_size >= i_size_read(inode)) {
+                       /* limit mapping to block that spans EOF */
+                       mapping_size = roundup(i_size_read(inode) - offset,
+                                              1 << inode->i_blkbits);
+               }
                if (mapping_size > LONG_MAX)
                        mapping_size = LONG_MAX;

You'd think a generic function like roundup() would handle that sort
of 64/32 bit type problem, yes? But it doesn't, despite what the
comment implies:

/* The `const' in roundup() prevents gcc-3.3 from calling __divdi3 */
#define roundup(x, y) (                                 \
{                                                       \
        const typeof(y) __y = y;                        \
        (((x) + (__y - 1)) / __y) * __y;                \
}                                                       \
)

It doesn't even have type checking that might warn you of impending
problems...

<sigh>

/me looks around in the XFS code for a bit

... and finds roundup_64() in fs/xfs/xfs_linux.h. That uses do_div()
to avoid this problem. And it's a static inline function, so it has
type checking, too.

And so this hunk fixes the problem:

@@ -1365,7 +1365,7 @@ __xfs_get_blocks(
 		if (offset < i_size_read(inode) &&
 		    offset + mapping_size >= i_size_read(inode)) {
 			/* limit mapping to block that spans EOF */
-                       mapping_size = roundup(i_size_read(inode) - offset,
+                       mapping_size = roundup_64(i_size_read(inode) - offset,
 					       1 << inode->i_blkbits);
 		}
 		if (mapping_size > LONG_MAX)

Can you test it, please, and I'll push out an updated branch
hopefully in time for today's linux-next build....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
