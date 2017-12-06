From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Date: Thu, 7 Dec 2017 09:40:16 +1100
Message-ID: <20171207094016.32774ae8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Commit

  0b44cfb8e40f ("tools/headers: Synchronize kernel x86 UAPI headers")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
