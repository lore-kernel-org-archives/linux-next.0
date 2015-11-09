From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the h8300
 tree
Date: Tue, 10 Nov 2015 10:49:47 +1100
Message-ID: <20151110104947.53fb4f84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  arch/h8300/include/asm/io.h

between commit:

  a795239b698d ("h8300: bit io fix")

from the h8300 tree and commit:

  fcd51e13e368 ("h8300: Rename ctlr_out/in[bwl] to raw_read/write[bwl]")

from the clockevents tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/h8300/include/asm/io.h
index bb837cded268,2d15508015ed..000000000000
--- a/arch/h8300/include/asm/io.h
+++ b/arch/h8300/include/asm/io.h
@@@ -3,55 -3,62 +3,62 @@@
  
  #ifdef __KERNEL__
  
- #include <asm-generic/io.h>
- 
  /* H8/300 internal I/O functions */
- static inline unsigned char ctrl_inb(unsigned long addr)
+ 
+ #define __raw_readb __raw_readb
+ static inline u8 __raw_readb(const volatile void __iomem *addr)
  {
- 	return *(volatile unsigned char *)addr;
+ 	return *(volatile u8 *)addr;
  }
  
- static inline unsigned short ctrl_inw(unsigned long addr)
+ #define __raw_readw __raw_readw
+ static inline u16 __raw_readw(const volatile void __iomem *addr)
  {
- 	return *(volatile unsigned short *)addr;
+ 	return *(volatile u16 *)addr;
  }
  
- static inline unsigned long ctrl_inl(unsigned long addr)
+ #define __raw_readl __raw_readl
+ static inline u32  __raw_readl(const volatile void __iomem *addr)
  {
- 	return *(volatile unsigned long *)addr;
+ 	return *(volatile u32 *)addr;
  }
  
- static inline void ctrl_outb(unsigned char b, unsigned long addr)
+ #define __raw_writeb __raw_writeb
+ static inline void __raw_writeb(u8 b, const volatile void __iomem *addr)
  {
- 	*(volatile unsigned char *)addr = b;
+ 	*(volatile u8 *)addr = b;
  }
  
- static inline void ctrl_outw(unsigned short b, unsigned long addr)
+ #define __raw_writew __raw_writew
+ static inline void __raw_writew(u16 b, const volatile void __iomem *addr)
  {
- 	*(volatile unsigned short *)addr = b;
+ 	*(volatile u16 *)addr = b;
  }
  
- static inline void ctrl_outl(unsigned long b, unsigned long addr)
+ #define __raw_writel __raw_writel
+ static inline void __raw_writel(u32 b, const volatile void __iomem *addr)
  {
- 	*(volatile unsigned long *)addr = b;
+ 	*(volatile u32 *)addr = b;
  }
  
- static inline void ctrl_bclr(int b, unsigned char *addr)
+ static inline void ctrl_bclr(int b, void __iomem *addr)
  {
  	if (__builtin_constant_p(b))
 -		__asm__("bclr %1,%0" : : "WU"(addr), "i"(b));
 +		__asm__("bclr %1,%0" : "+WU"(*addr): "i"(b));
  	else
 -		__asm__("bclr %w1,%0" : : "WU"(addr), "r"(b));
 +		__asm__("bclr %w1,%0" : "+WU"(*addr): "r"(b));
  }
  
- static inline void ctrl_bset(int b, unsigned char *addr)
+ static inline void ctrl_bset(int b, void __iomem *addr)
  {
  	if (__builtin_constant_p(b))
 -		__asm__("bset %1,%0" : : "WU"(addr), "i"(b));
 +		__asm__("bset %1,%0" : "+WU"(*addr): "i"(b));
  	else
 -		__asm__("bset %w1,%0" : : "WU"(addr), "r"(b));
 +		__asm__("bset %w1,%0" : "+WU"(*addr): "r"(b));
  }
  
+ #include <asm-generic/io.h>
+ 
  #endif /* __KERNEL__ */
  
  #endif /* _H8300_IO_H */
