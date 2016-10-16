From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.9-rc1)
Date: Sun, 16 Oct 2016 23:05:29 +1100
Message-ID: <20161016230529.0d7d7de7@canb.auug.org.au>
References: <CA+55aFwSp+jtxqazc0vGajnjQNrjQhebECnTYL8dtbS5eNASBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752356AbcJPMFf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Oct 2016 08:05:35 -0400
In-Reply-To: <CA+55aFwSp+jtxqazc0vGajnjQNrjQhebECnTYL8dtbS5eNASBA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

Hi all,

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20161004 was the first linux-next after
the merge window opened.)

Commits in v4.9-rc1 (relative to v4.8):            14308
Commits in next-20161004:                          13539
Commits with the same SHA1:                        12716
Commits with the same patch_id:                      485 (1)
Commits with the same subject line:                   33 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20161004:     13234 92%

Some breakdown of the list of extra commits (relative to next-20161004)
in -rc1:

Top ten first word of commit summary:

    110 pci
     96 ib
     75 powerpc
     69 xfs
     57 media
     52 drm
     37 net
     28 perf
     25 mips
     22 scsi

Top ten authors:

    104 bhelgaas@google.com
     73 darrick.wong@oracle.com
     42 npiggin@gmail.com
     40 trond.myklebust@primarydata.com
     28 oulijun@huawei.com
     24 bhaktipriya96@gmail.com
     22 chuck.lever@oracle.com
     21 paul.burton@imgtec.com
     21 cyrilbur@gmail.com
     19 boris.brezillon@free-electrons.com

Top ten commiters:

    127 dledford@redhat.com
    113 bhelgaas@google.com
    100 anna.schumaker@netapp.com
     94 mpe@ellerman.id.au
     92 davem@davemloft.net
     63 darrick.wong@oracle.com
     57 mchehab@kernel.org
     40 torvalds@linux-foundation.org
     35 acme@redhat.com
     28 ralf@linux-mips.org

There are also 305 commits in next-20161004 that didn't make it into
v4.9-rc1.

Top ten first word of commit summary:

     37 drm
     28 coresight
     19 arm
     12 powerpc
     11 arm64
     11 arm-soc
      9 keys
      8 mm
      8 ima
      6 bf609

Top ten authors:

     17 bauerman@linux.vnet.ibm.com
     17 akpm@linux-foundation.org
     14 paulmck@linux.vnet.ibm.com
     14 jani.nikula@intel.com
     13 arnd@arndb.de
     12 mathieu.poirier@linaro.org
     11 dhowells@redhat.com
      8 tj@kernel.org
      8 suzuki.poulose@arm.com
      8 javier@osg.samsung.com

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

     71 sfr@canb.auug.org.au
     31 mathieu.poirier@linaro.org
     22 paulmck@linux.vnet.ibm.com
     17 jani.nikula@intel.com
     16 steven@ubuntu-virtualbox.(none)
     16 arnd@arndb.de
     14 heiko@sntech.de
     11 dhowells@redhat.com
      8 tj@kernel.org
      6 rodrigo.vivi@intel.com

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

-- 
Cheers,
Stephen Rothwell
