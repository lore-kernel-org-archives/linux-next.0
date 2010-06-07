From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: linux-next: build failure after merge of the final tree (tile
 tree related)
Date: Mon, 07 Jun 2010 08:56:57 -0400
Message-ID: <4C0CEC99.3020909@tilera.com>
References: <20100607140140.870c0fb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100607140140.870c0fb5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On 6/7/2010 12:01 AM, Stephen Rothwell wrote:
> I applied this patch for today.  Something better could probably be
> done.  I note that there is already a declaration of sys_rt_sigaction in
> include/asm-generic/syscalls.h ...
>   

Yes, thanks for the pointer.  In fact by adjusting a couple of tile
syscalls slightly I can just use <asm-generic/syscalls.h> wholesale.  I
reverted the addition of sys_rt_sigaction() and sys_rt_sigsuspend() to
<linux/syscalls.h> and cleaned up the arch/tile/include/asm/syscalls.h
as well.  I mailed the patch as another reply-to to Stephen's original
message.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
