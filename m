From: Jason Baron <jbaron@redhat.com>
Subject: Re: linux-next: driver-core tree build failure
Date: Tue, 10 Mar 2009 16:02:00 -0400
Message-ID: <20090310200200.GB3091@redhat.com>
References: <20090310192440.949884a1.sfr@canb.auug.org.au> <alpine.LRH.2.00.0903101423200.25436@vixen.sonytel.be> <20090310145311.6bf9d9e9@skybase> <alpine.LRH.2.00.0903101626450.25436@vixen.sonytel.be> <20090310170841.2257de86@skybase>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756864AbZCJUF0@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090310170841.2257de86@skybase>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Greg Banks <gnb@sgi.com>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Kernel Development <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 10, 2009 at 05:08:41PM +0100, Martin Schwidefsky wrote:
> On Tue, 10 Mar 2009 16:29:50 +0100 (CET)
> Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:
> 
> > > The same could be done with the problematic pr_fmt definition:
> > > 
> > > #define pr_fmt(fmt)     __func__ ": " fmt
> > 
> > No, that also doesn't work:
> > 
> > | crypto/zlib.c:150: error: expected '}' before string constant
> > | crypto/zlib.c:150: error: expected ')' before '__func__'
> > | crypto/zlib.c:162: error: expected '}' before string constant
> > | crypto/zlib.c:162: error: expected ')' before '__func__'
> > | crypto/zlib.c:166: error: expected '}' before string constant
> > | crypto/zlib.c:166: error: expected ')' before '__func__'
> > | crypto/zlib.c:170: error: expected '}' before string constant
> > | crypto/zlib.c:170: error: expected ')' before '__func__'
> > 
> > > > BTW, Martin: Is `#define pr_fmt(fmt)     "%s: " fmt, __func__' a valid and
> > > > intended usage of your pr_fmt() infrastructure?
> > > 
> > > The indended use is a simple prefix to the format string. To paste an
> > > additional parameter is an interesting use of the pr_fmt macro ..
> > 
> > Bummer, I was so happy I could do things like
> > 
> > | #define pr_fmt(fmt)	"%s:%u: " fmt, __func__, __LINE__
> 
> Actually that seem like a nice thing to have. With the upstream version of
> dynamic_pr_debug this works, there the format string is used only on a printk.
> git commit 25b67b75587d43ff3f09ad88c03c70a38372d95d introduces the code
> that pastes the format string to the _ddebug structure.
> 

hmmm...yeah, some macro magic in include/linux/dynamic_debug.h converts
the 'fmt' arg into a series of strings. It doesn't look as pretty in the
dynamic debug control file:

crypto/zlib.c:333 [zlib]zlib_decompress_final - "\042%s: \042
\042avail_in %u, avail_out %u (consumed %u, produced %u)\n\042,
__func__"

with all those '\042' there, which are the '"' characters, but we
probably could live with it.

patch below.

thanks,

-Jason



Signed-off-by: Jason Baron <jbaron@redhat.com>


diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 07781aa..16cf212 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -50,28 +50,30 @@ extern int ddebug_remove_module(char *mod_name);
 					__ret = 1;			     \
 	__ret; })
 
-#define dynamic_pr_debug(fmt, ...) do {					\
-	static struct _ddebug descriptor				\
-	__used								\
-	__attribute__((section("__verbose"), aligned(8))) =		\
-	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
-		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
-	if (__dynamic_dbg_enabled(descriptor))				\
-		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		\
-				##__VA_ARGS__);				\
+#define STRINGIFY(args...) #args
+
+#define dynamic_pr_debug(fmt, ...) do {					  \
+	static struct _ddebug descriptor				  \
+	__used								  \
+	__attribute__((section("__verbose"), aligned(8))) =		  \
+	{ KBUILD_MODNAME, __func__, __FILE__, STRINGIFY(fmt), DEBUG_HASH, \
+		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	  \
+	if (__dynamic_dbg_enabled(descriptor))				  \
+		printk(KERN_DEBUG KBUILD_MODNAME ":" fmt,		  \
+				##__VA_ARGS__);				  \
 	} while (0)
 
 
-#define dynamic_dev_dbg(dev, fmt, ...) do {				\
-	static struct _ddebug descriptor				\
-	__used								\
-	__attribute__((section("__verbose"), aligned(8))) =		\
-	{ KBUILD_MODNAME, __func__, __FILE__, fmt, DEBUG_HASH,	\
-		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	\
-	if (__dynamic_dbg_enabled(descriptor))				\
-			dev_printk(KERN_DEBUG, dev,			\
-					KBUILD_MODNAME ": " fmt,	\
-					##__VA_ARGS__);			\
+#define dynamic_dev_dbg(dev, fmt, ...) do {				  \
+	static struct _ddebug descriptor				  \
+	__used								  \
+	__attribute__((section("__verbose"), aligned(8))) =		  \
+	{ KBUILD_MODNAME, __func__, __FILE__, STRINGIFY(fmt), DEBUG_HASH, \
+		DEBUG_HASH2, __LINE__, _DPRINTK_FLAGS_DEFAULT };	  \
+	if (__dynamic_dbg_enabled(descriptor))				  \
+			dev_printk(KERN_DEBUG, dev,			  \
+					KBUILD_MODNAME ": " fmt,	  \
+					##__VA_ARGS__);			  \
 	} while (0)
 
 #else
