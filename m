From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build failure after merge of the rr tree
Date: Wed, 19 Jan 2011 20:29:57 +1030
Message-ID: <201101192029.57595.rusty@rustcorp.com.au>
References: <20110119154210.435453e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110119154210.435453e4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>
List-Id: linux-next.vger.kernel.org

On Wed, 19 Jan 2011 03:12:10 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> After merging the rr tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> net/dsa/dsa.c:432: error: two or more data types in declaration specifiers
> 
> Lines 431-433 of that file are:
> 
> MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>")
> MODULE_DESCRIPTION("Driver for Distributed Switch Architecture switch chips");
> MODULE_LICENSE("GPL");
> 
> Presumably caused by commit b64781e8e2b0f480affb170460cbfb3b11fa9e5d
> ("param: add null statement to compiled-in module params").  I wonder how
> many more build errors this change may provoke.  Please try to find them
> and fix them before adding this change, thanks.

Sorry, I did a quick grep on MODULE_PARAM and found none, and didn't
realize the pervasiveness of the change.  A more thorough search has
revealed one other.

As such code won't compile as a module, it means we're only going to find
things in code which has these declarations and is only ever built-in.

I've updated my series, and patch FYI below.

Thanks,
Rusty.

module: fix missing semicolons in MODULE macro usage

You always needed them when you were a module, but the builtin versions
of the macros used to be more lenient.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
---
 drivers/net/arm/ks8695net.c |    2 +-
 net/dsa/dsa.c               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/arm/ks8695net.c b/drivers/net/arm/ks8695net.c
--- a/drivers/net/arm/ks8695net.c
+++ b/drivers/net/arm/ks8695net.c
@@ -1644,7 +1644,7 @@ ks8695_cleanup(void)
 module_init(ks8695_init);
 module_exit(ks8695_cleanup);
 
-MODULE_AUTHOR("Simtec Electronics")
+MODULE_AUTHOR("Simtec Electronics");
 MODULE_DESCRIPTION("Micrel KS8695 (Centaur) Ethernet driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" MODULENAME);
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -428,7 +428,7 @@ static void __exit dsa_cleanup_module(vo
 }
 module_exit(dsa_cleanup_module);
 
-MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>")
+MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>");
 MODULE_DESCRIPTION("Driver for Distributed Switch Architecture switch chips");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:dsa");
