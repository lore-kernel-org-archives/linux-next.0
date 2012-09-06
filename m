From: Alan Cox <alan@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 6 Sep 2012 12:47:52 +0100
Message-ID: <20120906124752.13831179@bob.linux.org.uk>
References: <20120906151014.c5b6be5dfbbcf3e516d7d70c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120906151014.c5b6be5dfbbcf3e516d7d70c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: linux-next.vger.kernel.org

On Thu, 6 Sep 2012 15:10:14 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/tty/serial/sccnxp.c:20:0:
> include/linux/serial_core.h: In function 'uart_handle_break':
> include/linux/serial_core.h:543:30: error: dereferencing pointer to
> incomplete type
> 
> Caused by commit 1d65c0b12656 ("serial: New serial driver SCCNXP").
> This seems to be just exposing a preexisting problem with
> linux/serial_core.h: when SUPPORT_SYSRQ is defined, this header
> depends on linux/console.h.  I can only imagein that every other use
> of serial_core.h pre-includes (maybe indirectly) console.h (or
> doesn't define SUPPORT_SYSRQ).
> 
> I have applied the following patch, but a better solution should be
> figured out.


I think thats actually probably the right patch. Better to keep the
header explicit than try and build some tangled mess of recursive
includes.

Acked-by: Alan Cox <alan@linux.intel.com>
