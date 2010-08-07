From: Vikas Chaudhary <vikas.chaudhary@qlogic.com>
Subject: RE: linux-next: build warnings in Linus'  tree
Date: Sat, 7 Aug 2010 01:13:12 -0700
Message-ID: <5E4F49720D0BAD499EE1F01232234BA87128E7CBE3@AVEXMB1.qlogic.org>
References: <20100807122116.e6421ea0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100807122116.e6421ea0.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Karen Higgins <karen.higgins@qlogic.com>, Ravi Anand <ravi.anand@qlogic.com>, James Bottomley <James.Bottomley@suse.de>
List-Id: linux-next.vger.kernel.org

>-----Original Message-----
>From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
>Sent: Saturday, August 07, 2010 7:51 AM
>To: Vikas Chaudhary
>Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Karen
>Higgins; Ravi Anand; James Bottomley
>Subject: linux-next: build warnings in Linus' tree
>
>Hi all,
>
>today's linux-next build (x86_64 allmodconfig) of Linus' tree produced
>these warnings:
>
>drivers/scsi/qla4xxx/ql4_nx.c: In function 'qla4_8xxx_get_flash_info':
>drivers/scsi/qla4xxx/ql4_nx.c:1952: warning: 'mid' may be used
>uninitialized in this function
>drivers/scsi/qla4xxx/ql4_nx.c:1952: note: 'mid' was declared here
>drivers/scsi/qla4xxx/ql4_nx.c:1952: warning: 'fid' may be used
>uninitialized in this function
>drivers/scsi/qla4xxx/ql4_nx.c:1952: note: 'fid' was declared here
>
>Introduced by commit f4f5df23bf72208d0c2f1d8be629839924c2f4c2 ("[SCSI]
>qla4xxx: Added support for ISP82XX").  I don't think that these are false
>positives.
>

Yes, Sorry. I am sending patch in next mail on top of latest
scsi-misc-2.6 tree to fix this warning. 

>--
>Cheers,
>Stephen Rothwell                    sfr@canb.auug.org.au
>http://www.canb.auug.org.au/~sfr/
