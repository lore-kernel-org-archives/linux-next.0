From: Richard Zhu <hongxing.zhu@nxp.com>
Subject: RE: linux-next: build warning after merge of the libata tree
Date: Tue, 20 Mar 2018 04:59:56 +0000
Message-ID: <DB6PR0402MB285693C27664F40857CF24458CAB0@DB6PR0402MB2856.eurprd04.prod.outlook.com>
References: <20180320155701.1122cef9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320155701.1122cef9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen:
Sorry to introduce this build warning.
I'm preparing one commit to fix it.

Best Regards
Richard Zhu

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]=20
Sent: Tuesday, March 20, 2018 12:57 PM
To: Tejun Heo <tj@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mail=
ing List <linux-kernel@vger.kernel.org>; Richard Zhu <hongxing.zhu@nxp.com>
Subject: linux-next: build warning after merge of the libata tree

Hi Tejun,

After merging the libata tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/ata/ahci_imx.c: In function 'imx_sata_disable':
drivers/ata/ahci_imx.c:478:2: warning: enumeration value 'AHCI_IMX53' not h=
andled in switch [-Wswitch]
  switch (imxpriv->type) {
  ^~~~~~

Introduced by commit

  e5878732a521 ("ahci: imx: add the imx6qp ahci sata support")

--=20
Cheers,
Stephen Rothwell
