From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the sound tree
Date: Wed, 1 Nov 2017 17:53:59 +1100
Message-ID: <20171101175359.4074a6af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  sound/oss/midibuf.c
  sound/oss/soundcard.c
  sound/oss/sys_timer.c
  sound/oss/uart6850.c

between commit:

  727dede0ba8a ("sound: Retire OSS")

from the sound tree and commit:

  1d27e3e2252b ("timer: Remove expires and data arguments from DEFINE_TIMER")

from the tip tree.

I fixed it up (I just deleted the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
