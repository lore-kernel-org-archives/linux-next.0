From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] mei: trace: Remove unused TRACE_SYSTEM_STRING define
Date: Mon, 13 Apr 2015 12:07:27 -0400
Message-ID: <20150413120727.3bb82df0@gandalf.local.home>
References: <20150413193720.56083fbf@canb.auug.org.au>
	<20150413104328.GB6390@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0242.hostedemail.com ([216.40.44.242]:56068 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932380AbbDMQHb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 12:07:31 -0400
In-Reply-To: <20150413104328.GB6390@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

TRACE_SYSTEM_STRING is defined in mei-trace.h but is unused. Worse yet,
the ftrace tracing infrastructure is using it now and this causes
warnings about redefined macros.

Remove the define of TRACE_SYSTEM_STRING from mei-trace.h

Link: http://lkml.kernel.org/r/20150413193720.56083fbf@canb.auug.org.au

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
diff --git a/drivers/misc/mei/mei-trace.h b/drivers/misc/mei/mei-trace.h
index 5f4e1a17360b..c9e24d2b698a 100644
--- a/drivers/misc/mei/mei-trace.h
+++ b/drivers/misc/mei/mei-trace.h
@@ -26,7 +26,6 @@
 #undef TRACE_SYSTEM
 
 #define TRACE_SYSTEM mei
-#define TRACE_SYSTEM_STRING __stringify(TRACE_SYSTEM)
 
 TRACE_EVENT(mei_reg_read,
 	TP_PROTO(const struct device *dev, const char *reg, u32 offs, u32 val),
