From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: linux-next: manual merge of the limits tree with the tile tree
Date: Tue, 20 Jul 2010 00:18:33 -0400
Message-ID: <4C452399.3050708@tilera.com>
References: <20100720134833.4082eed4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100720134833.4082eed4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Slaby <jirislaby@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

On 7/19/2010 11:48 PM, Stephen Rothwell wrote:
> Hi Jiri,
>
> Today's linux-next merge of the limits tree got a conflict in
> include/asm-generic/unistd.h between commits
> 5360bd776f73d0a7da571d72a09a03f237e99900 ("Fix up the "generic" unistd.h
> ABI to be more useful") and b51cae21ee66f77a368428e6bdf75a0c012c9fd7
> ("Add wait4() back to the set of <asm-generic/unistd.h> syscalls") from
> the tile tree and commit f33ebbe9da2c3c24664a0ad4f8fd83f293547e63
> ("unistd: add __NR_prlimit64 syscall numbers") from the limits tree.
>
> I fixed it up (see below) and can carry the fix as necessary.
>   

Jiri, would it be possible to put __NR_prlimit64 as number 261 in
<asm-generic/syscall.h>?  This would avoid the requirement for Tilera
users to have a "flag day" to renumber some of our syscalls.  I assume
there are no users at all of this flavor of the __NR_prlimit64 syscall
number yet otherwise, except the "score" architecture folks who
presumably wouldn't have started trying to use the syscall yet.

Thanks, and Stephen, thanks for the fixup.

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
