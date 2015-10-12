From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: randconfig build error with next-20151009, in
 lib/zlib_deflate/deftree.c
Date: Mon, 12 Oct 2015 14:55:42 -0700
Message-ID: <20151012145542.f1ea33ea2e5a0407b667a9e8@linux-foundation.org>
References: <CA+r1ZhiS661=BBD9fbeB9pkRyJUbGHCwcJ9SagpypaK_yp2WHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhiS661=BBD9fbeB9pkRyJUbGHCwcJ9SagpypaK_yp2WHA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, yalin.wang2010@gmail.com
List-Id: linux-next.vger.kernel.org

On Fri, 9 Oct 2015 13:38:25 -0700 Jim Davis <jim.epost@gmail.com> wrote:

> Building with the attached random configuration file,
> 
> lib/built-in.o: In function `__bitrev32':
> deftree.c:(.text+0x1e799): undefined reference to `byte_rev_table'
> deftree.c:(.text+0x1e7a0): undefined reference to `byte_rev_table'
> deftree.c:(.text+0x1e7b4): undefined reference to `byte_rev_table'
> deftree.c:(.text+0x1e7c1): undefined reference to `byte_rev_table'

This is really irritating.  We save 287 bytes in kernels which don't
use bitrev.  It isn't worth the hassle, but let's keep plugging.



From: Andrew Morton <akpm@linux-foundation.org>
Subject: lib/Kconfig: ZLIB_DEFLATE must select BITREVERSE

lib/built-in.o: In function `__bitrev32':
deftree.c:(.text+0x1e799): undefined reference to `byte_rev_table'
deftree.c:(.text+0x1e7a0): undefined reference to `byte_rev_table'
deftree.c:(.text+0x1e7b4): undefined reference to `byte_rev_table'
deftree.c:(.text+0x1e7c1): undefined reference to `byte_rev_table'

Anything which uses bitrevX() has to select BITREVERSE, to grab
lib/bitrev.o.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 lib/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -puN lib/Kconfig~lib-kconfig-zlib_deflate-must-select-bitreverse lib/Kconfig
--- a/lib/Kconfig~lib-kconfig-zlib_deflate-must-select-bitreverse
+++ a/lib/Kconfig
@@ -220,6 +220,7 @@ config ZLIB_INFLATE
 
 config ZLIB_DEFLATE
 	tristate
+	select BITREVERSE
 
 config LZO_COMPRESS
 	tristate
_
