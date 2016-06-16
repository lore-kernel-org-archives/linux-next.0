From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: linux-next: Tree for Jun 16 (linux/firmware.h)
Date: Thu, 16 Jun 2016 11:12:47 -0700
Message-ID: <146610076777.8942.6261908779926362192@sboyd-linaro>
References: <20160616154924.1c391bfb@canb.auug.org.au> <5762BF6D.2070604@infradead.org>
 <5762D7F3.50802@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5762D7F3.50802@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Quoting Randy Dunlap (2016-06-16 09:46:43)
> [adding Stephen Boyd]
> 
> On 06/16/16 08:02, Randy Dunlap wrote:
> > On 06/15/16 22:49, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20160615:
> >>
> > 
> > on i386 and/or x86_64:
> > 
> > In file included from ../drivers/fpga/fpga-mgr.c:21:0:
> > ../include/linux/firmware.h:82:1: error: expected identifier or ( before { token
> >  {
> >  ^
> > 
> > 
> 
> See:
> 
> static inline int request_firmware_into_buf(const struct firmware **firmware_p,
>         const char *name, struct device *device, void *buf, size_t size);
> {
>         return -EINVAL;
> }
> 

Urgh sorry about that. The semicolon should go away. Andrew can you
squash this in? I tested compilation without this config enabled.

---8<---
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index bdc24ee92823..b1f9f0ccb8ac 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -78,7 +78,7 @@ static inline int request_firmware_direct(const struct firmware **fw,
 }
 
 static inline int request_firmware_into_buf(const struct firmware **firmware_p,
-	const char *name, struct device *device, void *buf, size_t size);
+	const char *name, struct device *device, void *buf, size_t size)
 {
 	return -EINVAL;
 }
