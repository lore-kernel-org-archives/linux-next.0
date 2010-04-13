From: Jing Huang <huangj@Brocade.COM>
Subject: RE: linux-next: build warnings after merge of the final tree (scsi
 tree related)
Date: Tue, 13 Apr 2010 00:30:52 -0700
Message-ID: <04391A4E90BB2149B010D22452FA1687B99CC5C1@HQ-EXCH-6.corp.brocade.com>
References: <20100413162129.d913af53.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100413162129.d913af53.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, Krishna Gudipati <kgudipat@Brocade.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is indeed introduced by this commit. I have reproduced the issue in a powerpc machine, and I will provide a fix soon.

Jing
-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Monday, April 12, 2010 11:21 PM
To: James Bottomley
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Jing Huang
Subject: linux-next: build warnings after merge of the final tree (scsi tree related)

Hi James,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

drivers/scsi/bfa/bfa_ioc.c: In function 'bfa_ioc_msgget':
drivers/scsi/bfa/bfa_ioc.c:1331: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_notify_hbfail':
drivers/scsi/bfa/bfa_ioc_ct.c:177: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_ct.c:180: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_pll_init':
drivers/scsi/bfa/bfa_ioc_ct.c:381: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_ownership_reset':
drivers/scsi/bfa/bfa_ioc_ct.c:421: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_cb.c: In function 'bfa_ioc_cb_notify_hbfail':
drivers/scsi/bfa/bfa_ioc_cb.c:99: warning: value computed is not used
drivers/scsi/bfa/bfa_ioc_cb.c: In function 'bfa_ioc_cb_ownership_reset':
drivers/scsi/bfa/bfa_ioc_cb.c:272: warning: value computed is not used

Presumably introduced by commit 077424e2e2c97c830d903891dfcd1532068b85b7
("[SCSI] bfa: sg addr big endian fix") from the scsi tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
