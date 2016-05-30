From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: stats (Was: Linux 4.7-rc1)
Date: Mon, 30 May 2016 10:46:48 +1000
Message-ID: <20160530104648.49081367@canb.auug.org.au>
References: <CA+55aFzJn7PzgmzwSH4w8qYspTr9BvjAPn5dQMdbJssri-4BDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzJn7PzgmzwSH4w8qYspTr9BvjAPn5dQMdbJssri-4BDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

I have been a bit remiss in publishing these stats and maybe that has
lead to the current lower result for commits in linux-next before the
merge window opened ...

As usual, the executive friendly graph is at
http://neuling.org/linux-next-size.html :-)

(No merge commits counted, next-20160516 was the first linux-next after
the merge window opened.)

Commits in v4.7-rc1 (relative to v4.6):            10707
Commits in next-20160516:                          10067
Commits with the same SHA1:                         9073
Commits with the same patch_id:                      497 (1)
Commits with the same subject line:                   64 (1)

(1) not counting those in the lines above.

So commits in -rc1 that were in next-20160516:      9634 89%

Some breakdown of the list of extra commits (relative to next-20160516)
in -rc1:

Top ten first word of commit summary:

    171 drm
     73 kvm
     67 ib
     49 mips
     47 net
     38 libceph
     34 perf
     30 ceph
     29 mm
     22 xfs

Top ten authors:

     44 bskeggs@redhat.com
     40 idryomov@gmail.com
     30 zyan@redhat.com
     29 andre.przywara@arm.com
     22 emil.l.velikov@gmail.com
     22 andrea.gelmini@gelma.net
     21 chuck.lever@oracle.com
     19 jack@suse.cz
     16 tom@herbertland.com
     16 jlayton@poochiereds.net

Top ten commiters:

    142 davem@davemloft.net
     82 dledford@redhat.com
     72 torvalds@linux-foundation.org
     71 idryomov@gmail.com
     61 anna.schumaker@netapp.com
     59 christoffer.dall@linaro.org
     59 alexander.deucher@amd.com
     58 ralf@linux-mips.org
     51 bskeggs@redhat.com
     31 acme@redhat.com

There are also 435 commits in next-20160516 that didn't make it into
v4.7-rc1.

Top ten first word of commit summary:

     57 tpm
     39 coresight
     32 rdma
     27 lightnvm
     23 ib
     19 arm
     17 btrfs
     14 mm
     13 asoc
      9 xen

Top ten authors:

     34 mathieu.poirier@linaro.org
     34 christophe.ricard@gmail.com
     28 akpm@linux-foundation.org
     26 paulmck@linux.vnet.ibm.com
     16 mustafa.ismail@intel.com
     15 shannon.zhao@linaro.org
     15 m@bjorling.me
     15 jbacik@fb.com
     13 dean.luick@intel.com
     11 arnd@arndb.de

Some of Andrew's patches are fixes for other patches in his tree (and
have been merged into those).

Top ten commiters:

     82 sfr@canb.auug.org.au
     59 jarkko.sakkinen@linux.intel.com
     55 leon@kernel.org
     40 mathieu.poirier@linaro.org
     32 paulmck@linux.vnet.ibm.com
     28 m@bjorling.me
     16 steven@ubuntu-virtualbox.(none)
     15 sstabellini@kernel.org
     15 dsterba@suse.com
     13 broonie@kernel.org

Those commits by me are from the quilt series (mainly Andrew's mmotm
tree).

-- 
Cheers,
Stephen Rothwell
