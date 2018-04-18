From: Long Li <longli@microsoft.com>
Subject: RE: linux-next: build warning after merge of the scsi tree
Date: Wed, 18 Apr 2018 21:52:32 +0000
Message-ID: <MWHPR2101MB072925FF18BBA2F84B2EE470CEB60@MWHPR2101MB0729.namprd21.prod.outlook.com>
References: <20180417122540.1c0a3fee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417122540.1c0a3fee@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

> Subject: linux-next: build warning after merge of the scsi tree
>=20
> Hi James,
>=20
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/scsi/storvsc_drv.c: In function 'storvsc_do_io':
> drivers/scsi/storvsc_drv.c:1402:1: warning: the frame size of 2216 bytes =
is
> larger than 2048 bytes [-Wframe-larger-than=3D]  }  ^
>=20
> Introduced by commit
>=20
>   0b9bc24b8304 ("csi: storvsc: Select channel based on available percenta=
ge of
> ring buffer to write")

Thanks for catching this. This is due to the size of struct cpumask is too =
big, when CONFIG_NR_CPUS=3D8192 is used in most kernel config.

I will fix this by moving those data structure to kmalloc pre-allocated whe=
n channel is first created.

>=20
> --
> Cheers,
> Stephen Rothwell
