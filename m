From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Sept 17 (jfs)
Date: Mon, 17 Sep 2012 08:46:23 -0700
Message-ID: <505745CF.8040202@xenotime.net>
References: <20120917215938.11c456c113ac3b015cb2d5ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120917215938.11c456c113ac3b015cb2d5ae@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dave.kleikamp@oracle.com
List-Id: linux-next.vger.kernel.org

On 09/17/2012 04:59 AM, Stephen Rothwell wrote:

> Hi all,
> 
> OK, so this was a bad one :-(
> 
> Changes since 201209014:
> 
> New tree: jfs
> 



on i386:

modular build:
ERROR: "__divdi3" [fs/jfs/jfs.ko] undefined!

or builtin:
fs/built-in.o: In function `dbDiscardAG':
(.text+0x12988b): undefined reference to `__divdi3'


-- 
~Randy
