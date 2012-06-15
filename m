From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH -next] pstore: fix printk format warning in ram.c
Date: Fri, 15 Jun 2012 12:32:30 -0700
Message-ID: <CAGXu5j+VixgdQgvxkM1SHOC_vSwD0jwSdY36vG1n+d8VE0_7EQ@mail.gmail.com>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au>
	<4FDB8AB8.6060703@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FDB8AB8.6060703@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marco Stornelli <marco.stornelli@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 15, 2012 at 12:19 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> Fix printk format warning (on i386) in pstore:
>
> fs/pstore/ram.c:378:3: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'size_t'
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

I thought Greg already pulled this into his tree? Regardless:

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Chrome OS Security
