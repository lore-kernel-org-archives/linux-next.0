From: Phillip Lougher <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH -next] libs: force lzma_wrapper to be retained
Date: Sun, 03 Jan 2010 00:55:55 +0000
Message-ID: <4B3FEB1B.7040106@lougher.demon.co.uk>
References: <20100101120737.94d4acc4.sfr@canb.auug.org.au> <20100101183344.398f2538.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752264Ab0ACA6A@vger.kernel.org>
In-Reply-To: <20100101183344.398f2538.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> When CONFIG_SQUASHFS=m and CONFIG_DECOMPRESS_LZMA=m, decompress_lzma
> is built but then discarded from the library because no built-in code
> uses it, so change it from a lib- to an obj- to force it to be kept
> in the library.
> 
> ERROR: "unlzma" [fs/squashfs/squashfs.ko] undefined!
> 

Thanks for fixing this, I should have spotted it in my various
config tests but didn't.  I could add this to my squashfs-next patches
to stop the linux-next tree breakage, however, should it go into
Michal's kbuild -next tree instead?

This patch raises a small additional issue, why is DECOMPRESS_LZMA
(and DECOMPRESS_GZIP/DECOMPRESS_BZIP2) and defined as tristate?
None of the above compressors can be built as modules.

Regards

Phillip
