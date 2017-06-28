From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the scsi-mkp tree
Date: Wed, 28 Jun 2017 15:55:10 +1000
Message-ID: <20170628155510.10f4ccfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41773 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751533AbdF1FzM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 01:55:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Trapp <darren.trapp@cavium.com>, Duane Grigsby <duane.grigsby@cavium.com>, Anil Gurumurthy <anil.gurumurhty@cavium.com>, Giridhar Malavali <giridhar.malavali@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>, Hannes Reinecke <hare@suse.com>

Hi Martin,

After merging the scsi-mkp tree, today's linux-next build
(powerpc_ppc64_defconfig) produced these warnings:

In file included from include/linux/byteorder/big_endian.h:4:0,
                 from arch/powerpc/include/uapi/asm/byteorder.h:13,
                 from include/asm-generic/bitops/le.h:5,
                 from arch/powerpc/include/asm/bitops.h:246,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/asm-generic/bug.h:15,
                 from arch/powerpc/include/asm/bug.h:127,
                 from include/linux/bug.h:4,
                 from arch/powerpc/include/asm/mmu.h:125,
                 from arch/powerpc/include/asm/lppaca.h:36,
                 from arch/powerpc/include/asm/paca.h:21,
                 from arch/powerpc/include/asm/current.h:16,
                 from include/linux/sched.h:11,
                 from include/linux/blkdev.h:4,
                 from include/linux/blk-mq.h:4,
                 from drivers/scsi/qla2xxx/qla_nvme.h:10,
                 from drivers/scsi/qla2xxx/qla_nvme.c:7:
drivers/scsi/qla2xxx/qla_nvme.c: In function 'qla2x00_start_nvme_mq':
include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer implicitly truncated to unsigned type [-Woverflow]
 #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
                          ^
include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__cpu_to_le32'
 #define cpu_to_le32 __cpu_to_le32
                     ^
drivers/scsi/qla2xxx/qla_nvme.c:444:27: note: in expansion of macro 'cpu_to_le32'
    cont_pkt->entry_type = cpu_to_le32(CONTINUE_A64_TYPE);
                           ^
drivers/scsi/qla2xxx/qla_nvme.c: At top level:
drivers/scsi/qla2xxx/qla_nvme.c:667:13: warning: 'qla_nvme_unregister_remote_port' defined but not used [-Wunused-function]
 static void qla_nvme_unregister_remote_port(struct work_struct *work)
             ^
drivers/scsi/qla2xxx/qla_nvme.c:604:12: warning: 'qla_nvme_wait_on_rport_del' defined but not used [-Wunused-function]
 static int qla_nvme_wait_on_rport_del(fc_port_t *fcport)
            ^
drivers/scsi/qla2xxx/qla_nvme.c:634:13: warning: 'qla_nvme_abort_all' defined but not used [-Wunused-function]
 static void qla_nvme_abort_all(fc_port_t *fcport)
             ^

Introduced by commit

  e84067d74301 ("scsi: qla2xxx: Add FC-NVMe F/W initialization and transport registration")

-- 
Cheers,
Stephen Rothwell
