From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 08/17] davinci: update gfp/slab.h includes
Date: Thu, 20 May 2010 01:45:54 +1000
Message-ID: <20100520014554.7bd9dbc6.sfr@canb.auug.org.au>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
	<1269885165-18617-9-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-9-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@deeprootsystems.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Kevin,

On Tue, 30 Mar 2010 02:52:36 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.

Please apply to the davinci tree (patch reposted below).

From: Tejun Heo <tj@kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>
Subject: [PATCH 08/17] davinci: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:36 +0900

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kevin Hilman <khilman@deeprootsystems.com>
---
 drivers/rtc/rtc-davinci.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-davinci.c b/drivers/rtc/rtc-davinci.c
index 92a8f6c..34647fc 100644
--- a/drivers/rtc/rtc-davinci.c
+++ b/drivers/rtc/rtc-davinci.c
@@ -29,6 +29,7 @@
 #include <linux/bcd.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 
 /*
  * The DaVinci RTC is a simple RTC with the following
-- 
1.6.4.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
