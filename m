From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.8-rc1)
Date: Tue, 9 Aug 2016 10:19:25 +1000
Message-ID: <20160809101925.47fad115@canb.auug.org.au>
References: <CA+55aFxeWy9FVYwFkQvjhbs5K+YEj+Rk3VCkFCRVuJoVSuQ_iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50215 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929AbcHIAT1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Aug 2016 20:19:27 -0400
In-Reply-To: <CA+55aFxeWy9FVYwFkQvjhbs5K+YEj+Rk3VCkFCRVuJoVSuQ_iA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20160725 was the first linux-next after
the merge window opened.)

Commits in v4.8-rc1 (relative to v4.7):            11618
Commits in next-20160725:                          11061
Commits with the same SHA1:                         9962
Commits with the same patch_id:                      531 (1)
Commits with the same subject line:                   70 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20160725:     10563 90%

Some breakdown of the list of extra commits (relative to next-20160725)
in -rc1:

Top ten first word of commit summary:

     99 ib
     99 drm
     52 xfs
     52 powerpc
     47 mips
     33 pci
     33 net
     26 ceph
     21 drivers
     19 mm

Top ten authors:

     52 darrick.wong@oracle.com
     31 james.hogan@imgtec.com
     24 dean.luick@intel.com
     23 christian.koenig@amd.com
     22 zyan@redhat.com
     17 paul.gortmaker@windriver.com
     17 mpe@ellerman.id.au
     16 ira.weiny@intel.com
     15 weiyj.lk@gmail.com
     15 peter.chen@nxp.com

Top ten commiters:

    142 davem@davemloft.net
    117 dledford@redhat.com
     85 alexander.deucher@amd.com
     60 torvalds@linux-foundation.org
     56 mpe@ellerman.id.au
     52 david@fromorbit.com
     35 ralf@linux-mips.org
     35 bhelgaas@google.com
     34 idryomov@gmail.com
     27 pbonzini@redhat.com

There are also 498 commits in next-20160725 that didn't make it into
v4.8-rc1.

Top ten first word of commit summary:

    144 thermal
     33 arm
     22 mm
     14 coresight
     14 btrfs
     13 rcu
     12 arm64
      9 keys
      8 extcon
      6 fs

Top ten authors:

    127 edubezval@gmail.com
     44 k.kozlowski@samsung.com
     21 paulmck@linux.vnet.ibm.com
     20 akpm@linux-foundation.org
     14 keescook@chromium.org
     12 olof@lixom.net
     11 dhowells@redhat.com
     11 dalias@libc.org
      9 arnd@arndb.de
      8 suzuki.poulose@arm.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

    135 sfr@canb.auug.org.au
     81 edubezval@gmail.com
     63 rui.zhang@intel.com
     31 paulmck@linux.vnet.ibm.com
     22 keescook@chromium.org
     17 mathieu.poirier@linaro.org
     16 steven@ubuntu-virtualbox.(none)
     13 dhowells@redhat.com
     12 olof@lixom.net
     10 fdmanana@suse.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

-- 
Cheers,
Stephen Rothwell
