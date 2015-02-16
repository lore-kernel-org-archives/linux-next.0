From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: make mandocs build failure with next-20150210
Date: Mon, 16 Feb 2015 12:25:04 -0700
Message-ID: <20150216122504.36620b6f@lwn.net>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
	<20150211072757.166344e7@canb.auug.org.au>
	<1423664340.10724.40.camel@linux.intel.com>
	<20150211154844.GA18637@kroah.com>
	<CALLJCT11o3CkhmsDF7nJxg-r0zoEaee4eScy9Xc5LVEg7Vg4Yg@mail.gmail.com>
	<1424103690.10724.62.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424103690.10724.62.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <alan@linux.intel.com>
Cc: Masanari Iida <standby24x7@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 16 Feb 2015 16:21:30 +0000
Alan Cox <alan@linux.intel.com> wrote:

> > This warning started to appear on Linus's tree, after staging pull
> > request was merged.  
> 
> I sent GregKH a fix for it a while ago

He seemed to indicate that he doesn't have it.  The following would seem
to fit the bill; unless somebody objects I'll send it upward so that docs
builds start working again.

Thanks,

jon

>From a984e29fbe72371b203c43a33b66df44b4c8a948 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 16 Feb 2015 12:21:42 -0700
Subject: [PATCH] Fix docs build failure caused by i2o removal

The movement of the I2O tree into staging broke the DocBook build.  Rather
than redirect the i2o references into staging, it seems better to just
remove them since this code is on its way out anyway.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/DocBook/device-drivers.tmpl | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/DocBook/device-drivers.tmpl b/Documentation/DocBook/device-drivers.tmpl
index f2130586ef5d..faf09d4a0ea8 100644
--- a/Documentation/DocBook/device-drivers.tmpl
+++ b/Documentation/DocBook/device-drivers.tmpl
@@ -190,23 +190,6 @@ X!Edrivers/pnp/system.c
 !Idrivers/message/fusion/mptfc.c
 !Idrivers/message/fusion/mptlan.c
      </sect1>
-     <sect1><title>I2O message devices</title>
-!Iinclude/linux/i2o.h
-!Idrivers/message/i2o/core.h
-!Edrivers/message/i2o/iop.c
-!Idrivers/message/i2o/iop.c
-!Idrivers/message/i2o/config-osm.c
-!Edrivers/message/i2o/exec-osm.c
-!Idrivers/message/i2o/exec-osm.c
-!Idrivers/message/i2o/bus-osm.c
-!Edrivers/message/i2o/device.c
-!Idrivers/message/i2o/device.c
-!Idrivers/message/i2o/driver.c
-!Idrivers/message/i2o/pci.c
-!Idrivers/message/i2o/i2o_block.c
-!Idrivers/message/i2o/i2o_scsi.c
-!Idrivers/message/i2o/i2o_proc.c
-     </sect1>
   </chapter>
 
   <chapter id="snddev">
-- 
2.1.0
