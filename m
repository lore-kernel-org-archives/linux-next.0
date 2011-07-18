From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 18 (mm/truncate.c)
Date: Mon, 18 Jul 2011 08:18:16 -0700
Message-ID: <20110718081816.2106117e.rdunlap@xenotime.net>
References: <20110718203501.232bd176e83ff65f056366e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20110718203501.232bd176e83ff65f056366e6@canb.auug.org.au>
Sender: owner-linux-mm@kvack.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, 18 Jul 2011 20:35:01 +1000 Stephen Rothwell wrote:

> Hi all,

mm/truncate.c:612: error: implicit declaration of function 'inode_dio_wait'

mm/truncate.c should be #include-ing <linux/fs.h> for that function's
prototype, but that doesn't help when CONFIG_BLOCK is not enabled,
which is the case in this build failure.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
