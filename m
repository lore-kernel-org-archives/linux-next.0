From: "Madhani, Himanshu" <Himanshu.Madhani@cavium.com>
Subject: Re: linux-next: build warnings after merge of the scsi-mkp tree
Date: Thu, 29 Jun 2017 18:35:35 +0000
Message-ID: <F7325129-BC4E-43C1-8E33-C5C36C4BB2BF@cavium.com>
References: <20170628155510.10f4ccfb@canb.auug.org.au>
 <20170629150752.4ef9a713@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-by2nam03on0047.outbound.protection.outlook.com ([104.47.42.47]:11264
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751936AbdF2Sfk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jun 2017 14:35:40 -0400
In-Reply-To: <20170629150752.4ef9a713@canb.auug.org.au>
Content-Language: en-US
Content-ID: <87A48DD4432BEA41B8BF9DEEAB13BBAB@namprd07.prod.outlook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Trapp, Darren" <Darren.Trapp@cavium.com>, "Grigsby, Duane" <Duane.Grigsby@cavium.com>, Anil Gurumurthy <anil.gurumurhty@cavium.com>, "Malavali, Giridhar" <Giridhar.Malavali@cavium.com>, Hannes Reinecke <hare@suse.com>

Hi Stephen, James,

> On Jun 28, 2017, at 10:07 PM, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>=20
> Hi James,
>=20
> This has now migrated to the scsi tree.
>=20
> On Wed, 28 Jun 2017 15:55:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>>=20
>> After merging the scsi-mkp tree, today's linux-next build
>> (powerpc_ppc64_defconfig) produced these warnings:
>>=20
>> In file included from include/linux/byteorder/big_endian.h:4:0,
>>                 from arch/powerpc/include/uapi/asm/byteorder.h:13,
>>                 from include/asm-generic/bitops/le.h:5,
>>                 from arch/powerpc/include/asm/bitops.h:246,
>>                 from include/linux/bitops.h:36,
>>                 from include/linux/kernel.h:10,
>>                 from include/asm-generic/bug.h:15,
>>                 from arch/powerpc/include/asm/bug.h:127,
>>                 from include/linux/bug.h:4,
>>                 from arch/powerpc/include/asm/mmu.h:125,
>>                 from arch/powerpc/include/asm/lppaca.h:36,
>>                 from arch/powerpc/include/asm/paca.h:21,
>>                 from arch/powerpc/include/asm/current.h:16,
>>                 from include/linux/sched.h:11,
>>                 from include/linux/blkdev.h:4,
>>                 from include/linux/blk-mq.h:4,
>>                 from drivers/scsi/qla2xxx/qla_nvme.h:10,
>>                 from drivers/scsi/qla2xxx/qla_nvme.c:7:
>> drivers/scsi/qla2xxx/qla_nvme.c: In function 'qla2x00_start_nvme_mq':
>> include/uapi/linux/byteorder/big_endian.h:32:26: warning: large integer =
implicitly truncated to unsigned type [-Woverflow]
>> #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
>>                          ^
>> include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__=
cpu_to_le32'
>> #define cpu_to_le32 __cpu_to_le32
>>                     ^
>> drivers/scsi/qla2xxx/qla_nvme.c:444:27: note: in expansion of macro 'cpu=
_to_le32'
>>    cont_pkt->entry_type =3D cpu_to_le32(CONTINUE_A64_TYPE);
>>                           ^
>> drivers/scsi/qla2xxx/qla_nvme.c: At top level:
>> drivers/scsi/qla2xxx/qla_nvme.c:667:13: warning: 'qla_nvme_unregister_re=
mote_port' defined but not used [-Wunused-function]
>> static void qla_nvme_unregister_remote_port(struct work_struct *work)
>>             ^
>> drivers/scsi/qla2xxx/qla_nvme.c:604:12: warning: 'qla_nvme_wait_on_rport=
_del' defined but not used [-Wunused-function]
>> static int qla_nvme_wait_on_rport_del(fc_port_t *fcport)
>>            ^
>> drivers/scsi/qla2xxx/qla_nvme.c:634:13: warning: 'qla_nvme_abort_all' de=
fined but not used [-Wunused-function]
>> static void qla_nvme_abort_all(fc_port_t *fcport)
>>             ^
>>=20
>> Introduced by commit
>>=20
>>  e84067d74301 ("scsi: qla2xxx: Add FC-NVMe F/W initialization and transp=
ort registration")
>=20
> --=20
> Cheers,
> Stephen Rothwell


Would it be okay if we send patch to address this warnings in couple days?=
=20

Thanks,
- Himanshu
