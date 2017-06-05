From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: strange update of the sound tree
Date: Tue, 6 Jun 2017 00:17:23 +1000
Message-ID: <20170606001723.7950a514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Takashi,

I don't think you have the result in the sound tree
(git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
branch for-next).  Yesterday it was a fairly linear tree with head
commit 7421a1671abe ("ALSA: pcm: include pcm_local.h and remove some
extraneous tabs") based on commit f83914fdfcc3 ("ALSA: usb-audio: fix
Amanero Combo384 quirk on big-endian hosts").  Now it is a tree with
687 commits (realative to Linus' tree) with 651 merge commits in it. :-(

-- 
Cheers,
Stephen Rothwell
