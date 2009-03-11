From: Greg Banks <gnb@sgi.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Wed, 11 Mar 2009 21:07:28 +1100
Message-ID: <49B78D60.2070402@sgi.com>
References: <20090310192440.949884a1.sfr@canb.auug.org.au> <alpine.LRH.2.00.0903101423200.25436@vixen.sonytel.be> <20090310145311.6bf9d9e9@skybase> <alpine.LRH.2.00.0903101626450.25436@vixen.sonytel.be> <20090310170841.2257de86@skybase> <20090310200200.GB3091@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755684AbZCKKDu@vger.kernel.org>
In-Reply-To: <20090310200200.GB3091@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Baron <jbaron@redhat.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Jason Baron wrote:
> On Tue, Mar 10, 2009 at 05:08:41PM +0100, Martin Schwidefsky wrote:
>   
>> On Tue, 10 Mar 2009 16:29:50 +0100 (CET)
>> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
>>
>>     
>>>> The same could be done with the problematic pr_fmt definition:
>>>>
>>>> #define pr_fmt(fmt)     __func__ ": " fmt
>>>>         
>>> No, that also doesn't work:
>>>
>>> | crypto/zlib.c:150: error: expected '}' before string constant
>>> | crypto/zlib.c:150: error: expected ')' before '__func__'
>>> | crypto/zlib.c:162: error: expected '}' before string constant
>>> | crypto/zlib.c:162: error: expected ')' before '__func__'
>>> | crypto/zlib.c:166: error: expected '}' before string constant
>>> | crypto/zlib.c:166: error: expected ')' before '__func__'
>>> | crypto/zlib.c:170: error: expected '}' before string constant
>>> | crypto/zlib.c:170: error: expected ')' before '__func__'
>>>
>>>       
>>>>> BTW, Martin: Is `#define pr_fmt(fmt)     "%s: " fmt, __func__' a valid and
>>>>> intended usage of your pr_fmt() infrastructure?
>>>>>           
>>>> The indended use is a simple prefix to the format string. To paste an
>>>> additional parameter is an interesting use of the pr_fmt macro ..
>>>>         
>>> Bummer, I was so happy I could do things like
>>>
>>> | #define pr_fmt(fmt)	"%s:%u: " fmt, __func__, __LINE__
>>>       
>> Actually that seem like a nice thing to have. With the upstream version of
>> dynamic_pr_debug this works, there the format string is used only on a printk.
>> git commit 25b67b75587d43ff3f09ad88c03c70a38372d95d introduces the code
>> that pastes the format string to the _ddebug structure.
>>
>>     
>
> hmmm...yeah, some macro magic in include/linux/dynamic_debug.h converts
> the 'fmt' arg into a series of strings. It doesn't look as pretty in the
> dynamic debug control file:
>
> crypto/zlib.c:333 [zlib]zlib_decompress_final - "\042%s: \042
> \042avail_in %u, avail_out %u (consumed %u, produced %u)\n\042,
> __func__"
>
> with all those '\042' there, which are the '"' characters, but we
> probably could live with it.
>
> patch below.
>
>   

I think this patch does the same thing more cleanly.

When CONFIG_DYNAMIC_DEBUG is enabled, allow callers of pr_debug()
to provide their own definition of pr_fmt() even if that definition
uses tricks like

#define pr_fmt(fmt) "%s:" fmt, __func__

Signed-off-by: Greg Banks <gnb@sgi.com>
---

 include/linux/dynamic_debug.h |    4 ++--
 include/linux/kernel.h        |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

Index: linux-git/include/linux/dynamic_debug.h
===================================================================
--- linux-git.orig/include/linux/dynamic_debug.h
+++ linux-git/include/linux/dynamic_debug.h
@@ -57,7 +57,7 @@ extern int ddebug_remove_module(char *mo
 	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
 		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
 	if (__dynamic_dbg_enabled(descriptor))				\
-		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		\
+		printk(KERN_DEBUG KBUILD_MODNAME ":" pr_fmt(fmt),	\
 				##__VA_ARGS__);				\
 	} while (0)
 
@@ -70,7 +70,7 @@ extern int ddebug_remove_module(char *mo
 		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
 	if (__dynamic_dbg_enabled(descriptor))				\
 			dev_printk(KERN_DEBUG, dev,			\
-					KBUILD_MODNAME ": " fmt,	\
+					KBUILD_MODNAME ": " pr_fmt(fmt),\
 					##__VA_ARGS__);			\
 	} while (0)
 
Index: linux-git/include/linux/kernel.h
===================================================================
--- linux-git.orig/include/linux/kernel.h
+++ linux-git/include/linux/kernel.h
@@ -359,8 +359,9 @@ static inline char *pack_hex_byte(char *
 #define pr_debug(fmt, ...) \
 	printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #elif defined(CONFIG_DYNAMIC_DEBUG)
+/* dynamic_pr_debug() uses pr_fmt() internally so we don't need it here */
 #define pr_debug(fmt, ...) do { \
-	dynamic_pr_debug(pr_fmt(fmt), ##__VA_ARGS__); \
+	dynamic_pr_debug(fmt, ##__VA_ARGS__); \
 	} while (0)
 #else
 #define pr_debug(fmt, ...) \



-- 
Greg Banks, P.Engineer, SGI Australian Software Group.
the brightly coloured sporks of revolution.
I don't speak for SGI.
