From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: lib/string.h build failure in linux-next
Date: Tue, 6 Mar 2012 16:02:23 +0000
Message-ID: <201203061602.23512.arnd@arndb.de>
References: <1331048540.17099.9.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1331048540.17099.9.camel@deneb.redhat.com>
Sender: linux-arch-owner@vger.kernel.org
To: Mark Salter <msalter@redhat.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tuesday 06 March 2012, Mark Salter wrote:
> I'm seeing a build failure in lib/string.h in linux-next:
> 
> /es/linux/linux-next/lib/string.c: In function 'strlcat':
> /es/linux/linux-next/lib/string.c:225:2: error: implicit declaration of function 'printk'
> /es/linux/linux-next/lib/string.c:225:2: error: implicit declaration of function 'panic'
> 
> Commit e2950c2b6ecb928bfd3a13dd237df1f29f712704 removed an include of
> linux/module.h which triggered the problem for arch/c6x and probably
> other architectures using the asm-generic BUG macro.
> 
> I think this needs fixing in asm-generic/bug.h which should include
> linux/kernel.h for panic and linux/printk.h for printk.

I think you cannot do that as long as linux/kernel.h includes asm/bug.h,
or you will get a lot of other build failures.

The safer option is probably to add the two missing headers separately
to string.c.

	Arnd
