From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 23 Feb 2017 14:12:40 +1100
Message-ID: <20170223141240.0c15a9aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nilesh Javali <nilesh.javali@cavium.com>, Manish Rangankar <manish.rangankar@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Chad Dupuis <chad.dupuis@cavium.com>
List-Id: linux-next.vger.kernel.org

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/scsi/qedf/qedf_io.c: In function 'qedf_trace_io':
drivers/scsi/qedf/qedf_io.c:1001:33: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  io_log->refcount = atomic_read(&io_req->refcount.refcount);
                                 ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from drivers/scsi/qedf/qedf_io.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
drivers/scsi/qedf/qedf_io.c: In function 'qedf_scsi_completion':
drivers/scsi/qedf/qedf_io.c:1343:27: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
    refcount = atomic_read(&io_req->refcount.refcount);
                           ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from drivers/scsi/qedf/qedf_io.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
drivers/scsi/qedf/qedf_io.c: In function 'qedf_scsi_done':
drivers/scsi/qedf/qedf_io.c:1428:25: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  refcount = atomic_read(&io_req->refcount.refcount);
                         ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from drivers/scsi/qedf/qedf_io.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
In file included from drivers/scsi/qedf/qedf.h:28:0,
                 from drivers/scsi/qedf/qedf_io.c:11:
drivers/scsi/qedf/qedf_io.c: In function 'qedf_flush_els_req':
drivers/scsi/qedf/qedf_io.c:1559:18: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
      atomic_read(&els_req->refcount.refcount));
                  ^
drivers/scsi/qedf/qedf_dbg.h:83:13: note: in definition of macro 'QEDF_INFO'
          ## __VA_ARGS__)
             ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from drivers/scsi/qedf/qedf_io.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
drivers/scsi/qedf/qedf_els.c: In function 'qedf_rrq_compl':
drivers/scsi/qedf/qedf_els.c:186:25: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  refcount = atomic_read(&orig_io_req->refcount.refcount);
                         ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from include/linux/mm_types.h:8,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/if_ether.h:23,
                 from include/linux/etherdevice.h:25,
                 from include/scsi/libfcoe.h:24,
                 from drivers/scsi/qedf/qedf.h:12,
                 from drivers/scsi/qedf/qedf_els.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
drivers/scsi/qedf/qedf_els.c: In function 'qedf_srr_compl':
drivers/scsi/qedf/qedf_els.c:477:25: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  refcount = atomic_read(&orig_io_req->refcount.refcount);
                         ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from include/linux/mm_types.h:8,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/if_ether.h:23,
                 from include/linux/etherdevice.h:25,
                 from include/scsi/libfcoe.h:24,
                 from drivers/scsi/qedf/qedf.h:12,
                 from drivers/scsi/qedf/qedf_els.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^
drivers/scsi/qedf/qedf_els.c: In function 'qedf_rec_compl':
drivers/scsi/qedf/qedf_els.c:761:25: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
  refcount = atomic_read(&orig_io_req->refcount.refcount);
                         ^
In file included from arch/x86/include/asm/msr.h:66:0,
                 from arch/x86/include/asm/processor.h:20,
                 from arch/x86/include/asm/cpufeature.h:4,
                 from arch/x86/include/asm/thread_info.h:52,
                 from include/linux/thread_info.h:25,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:59,
                 from include/linux/spinlock.h:50,
                 from include/linux/mm_types.h:8,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/if_ether.h:23,
                 from include/linux/etherdevice.h:25,
                 from include/scsi/libfcoe.h:24,
                 from drivers/scsi/qedf/qedf.h:12,
                 from drivers/scsi/qedf/qedf_els.c:9:
arch/x86/include/asm/atomic.h:24:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'refcount_t * {aka struct refcount_struct *}'
 static __always_inline int atomic_read(const atomic_t *v)
                            ^

Caused by commit

  61d8658b4a43 ("scsi: qedf: Add QLogic FastLinQ offload FCoE driver framework")

being rebased on top of commit

  10383aea2f44 ("kref: Implement 'struct kref' using refcount_t")

and not using kref_read() to access the refcounts.

I don't understand why you would rebase you work onto Linus' tree in
the middle of the merge window in any case. :-(

I have used the scsi-mkp tree from next-20170221 again.
-- 
Cheers,
Stephen Rothwell
