From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for Nov 8 (various vfs)
Date: Fri, 8 Nov 2013 19:35:52 +0000
Message-ID: <20131108193552.GQ13318@ZenIV.linux.org.uk>
References: <20131108194753.c45ecb7db2fdd59e156d8acd@canb.auug.org.au>
 <527D3215.5020909@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <527D3215.5020909@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 08, 2013 at 10:48:53AM -0800, Randy Dunlap wrote:
> vfs build errors:
> 
> fs/open.c:486:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]
> fs/namei.c:3726:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]
> fs/utimes.c:110:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]

... when FILE_LOCKING isn't set.  Yes, break_deleg_wait() is not defined in
that case (and its call sites are unreachable).  Fixed and pushed...
