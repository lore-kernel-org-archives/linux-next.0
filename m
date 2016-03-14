From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the mips tree
Date: Mon, 14 Mar 2016 13:18:52 +1100
Message-ID: <20160314131852.20068d5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Qais Yousef <qais.yousef@imgtec.com>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/mips/Kconfig

between commit:

  7a50e4688dab ("MIPS: Fix build error when SMP is used without GIC")

from the mips tree and commit:

  7eb8c99db26c ("MIPS: Delete smp-gic.c")

from the tip tree.

I fixed it up (I used the tip tree version since that removed the lines
updated by the mips tree patch) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell
