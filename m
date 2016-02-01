From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the btrfs-kdave tree
Date: Tue, 2 Feb 2016 10:39:04 +1100
Message-ID: <20160202103904.4cb77c87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45515 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750823AbcBAXjG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2016 18:39:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/reada.c:326:29: error: invalid storage class for function 'reada_find_extent'
 static struct reada_extent *reada_find_extent(struct btrfs_root *root,
                             ^

and lots of others.

Caused by commit:

  cbf8f71bc8d5 ("Merge branch 'for-next-4.6-20160201' into for-next-20160201")

The following patches appear on bothe sides of the merge and there are
following changes in the for-next-4.6-20160201.  The merge resolution
is just very bad (I don't know if git did that automatically or not)
and would have shown up if it was build tested.

4c22a2ccc220 btrfs: reada: bypass adding extent when all zones failed
d34d58265213 btrfs: reada: add all reachable mirrors into reada device list
2aafd08e648c btrfs: reada: Avoid many times of empty loop
dc9529f670fd btrfs: reada: Add missed segment checking in reada_find_zone
9f2c3244dcf1 btrfs: reada: Fix in-segment calculation for reada

e47319f6119c btrfs: reada: bypass adding extent when all zones failed
440f28b7523a btrfs: reada: add all reachable mirrors into reada device list
14a5db53a0fc btrfs: reada: Avoid many times of empty loop
730af4ef7c49 btrfs: reada: Add missed segment checking in reada_find_zone
a38b691f5d07 btrfs: reada: Fix in-segment calculation for reada

Please fix this up.

I have used the btrfs-kdave tree from next-20160201 for today.

-- 
Cheers,
Stephen Rothwell
