From: Jing Huang <huangj@Brocade.COM>
Subject: RE: [PATCH] bfa: fix compilation warning in powerpc (resend)
Date: Thu, 22 Apr 2010 12:50:31 -0700
Message-ID: <04391A4E90BB2149B010D22452FA1687B99CCFDD@HQ-EXCH-6.corp.brocade.com>
References: <1271186549-642-1-git-send-email-huangj@brocade.com>
 <20100421161217.60d5654b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <20100421161217.60d5654b.akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-scsi-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "James.Bottomley@suse.de" <James.Bottomley@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Krishna Gudipati <kgudipat@Brocade.com>, Ramkumar Vadivelu <rvadivel@Brocade.COM>, Vinodh Ravindran <vravindr@Brocade.COM>
List-Id: linux-next.vger.kernel.org

>> Fix the compilation warning in powerpc.
>
>When fixing a warning, please quote that warning in the patch description!
>
><does a cross-build>
>
>It seems that you're referring to this:
>
>drivers/scsi/bfa/bfa_ioc.c: In function 'bfa_ioc_msgget':
>drivers/scsi/bfa/bfa_ioc.c:1331: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_notify_hbfail':
>drivers/scsi/bfa/bfa_ioc_ct.c:177: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_ct.c:180: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_pll_init':
>drivers/scsi/bfa/bfa_ioc_ct.c:381: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_ct.c: In function 'bfa_ioc_ct_ownership_reset':
>drivers/scsi/bfa/bfa_ioc_ct.c:421: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_cb.c: In function 'bfa_ioc_cb_notify_hbfail':
>drivers/scsi/bfa/bfa_ioc_cb.c:99: warning: value computed is not used
>drivers/scsi/bfa/bfa_ioc_cb.c: In function 'bfa_ioc_cb_ownership_reset':
>drivers/scsi/bfa/bfa_ioc_cb.c:272: warning: value computed is not used
>
>
>> The same change also fixes endian
>> issue we found in powerpc test.
>
>When fixing a bug, please fully describe the bug!
>
>If this driver has "endian issues" on powerpc then it's quite possible
>that this is a running-around-with-hair-on-fire,
>must-backport-to-2.6.33.x bugfix.
>
>But how would I know?  You didn't tell me!
>

Hi Andrew,

Sorry about the obscure description of the patch, I will provide detailed
description in the future patch submission.

Yes this patch is intended to fix the compilation warning you listed above.

Regarding the big endian issue I mentioned, basically I remove an
unnecessary word swap in bfa_os_reg_read() and bfa_os_reg_write()
because the kernel provided readl and writel are already doing so. The
compilation warning also goes away after this change. For
bfa_os_mem_read() and bfa_os_mem_write() macros, I add a swap since
these two macros are designed to read/write from/to a memory region
that is in BE format per ASIC spec.

Thanks

Jing

