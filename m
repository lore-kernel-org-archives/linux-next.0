From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the lightnvm tree
Date: Wed, 4 May 2016 15:52:03 +1000
Message-ID: <20160504155203.0a90ee6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier =?UTF-8?B?R29uesOhbGV6?= <javier@cnexlabs.com>
List-Id: linux-next.vger.kernel.org

Hi Matias,

After merging the lightnvm tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

In file included from include/linux/swab.h:4:0,
                 from include/uapi/linux/byteorder/big_endia
n.h:12,
                 from include/linux/byteorder/big_endian.h:4
,
                 from arch/powerpc/include/uapi/asm/byteorde
r.h:13,
                 from include/asm-generic/bitops/le.h:5,
                 from arch/powerpc/include/asm/bitops.h:279,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/list.h:8,
                 from include/linux/pci.h:25,
                 from drivers/nvme/host/nvme.h:18,
                 from drivers/nvme/host/lightnvm.c:23:
drivers/nvme/host/lightnvm.c: In function 'nvme_nvm_rqtocmd'
:
include/uapi/linux/byteorder/big_endian.h:30:52: warning: passing argument 1 of '__fswab64' makes integer from pointer without a cast [-Wint-conversion]
 #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
                                                    ^
include/uapi/linux/swab.h:126:12: note: in definition of macro '__swab64'
  __fswab64(x))
            ^
include/linux/byteorder/generic.h:85:21: note: in expansion of macro '__cpu_to_le64'
 #define cpu_to_le64 __cpu_to_le64
                     ^
drivers/nvme/host/lightnvm.c:472:22: note: in expansion of macro 'cpu_to_le64'
  c->ph_rw.metadata = cpu_to_le64(rqd->meta_list);
                      ^
include/uapi/linux/swab.h:68:41: note: expected '__u64 {aka long long unsigned int}' but argument is of type 'void *'
 static inline __attribute_const__ __u64 __fswab64(__u64 val)
                                         ^

Introduced by commit

  a34b1eb78e21 ("lightnvm: enable metadata to be sent to device")

-- 
Cheers,
Stephen Rothwell
