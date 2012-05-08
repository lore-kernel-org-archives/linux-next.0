From: Kay Sievers <kay@vrfy.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (driver-core tree related)
Date: Tue, 08 May 2012 13:04:17 +0200
Message-ID: <1336475057.1179.2.camel@mop>
References: <20120508180245.002eca30eee763fce1ad468b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:47150 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753043Ab2EHLEu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 07:04:50 -0400
Received: by werb10 with SMTP id b10so1820500wer.19
        for <linux-next@vger.kernel.org>; Tue, 08 May 2012 04:04:49 -0700 (PDT)
In-Reply-To: <20120508180245.002eca30eee763fce1ad468b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, William Douglas <william.douglas@intel.com>

On Tue, 2012-05-08 at 18:02 +1000, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> kernel/built-in.o: In function `devkmsg_read':
> printk.c:(.text+0x27e8): undefined reference to `__udivdi3'

Oops, let's use do_div().

Thanks,
Kay


From: Kay Sievers <kay@vrfy.org>
Subject: kmsg: use do_div() to divide 64bit integer

On Tue, May 8, 2012 at 10:02 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> kernel/built-in.o: In function `devkmsg_read':
> printk.c:(.text+0x27e8): undefined reference to `__udivdi3'
> Most probably the "msg->ts_nsec / 1000" since
> ts_nsec is a u64 and this is a 32 bit build ...

Signed-off-by: Kay Sievers <kay@vrfy.org>
---
 kernel/printk.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -407,6 +407,7 @@ static ssize_t devkmsg_read(struct file
 {
 	struct devkmsg_user *user = file->private_data;
 	struct log *msg;
+	u64 ts_usec;
 	size_t i;
 	size_t len;
 	ssize_t ret;
@@ -441,8 +442,10 @@ static ssize_t devkmsg_read(struct file
 	}
 
 	msg = log_from_idx(user->idx);
+	ts_usec = msg->ts_nsec;
+	do_div(ts_usec, 1000);
 	len = sprintf(user->buf, "%u,%llu,%llu;",
-		      msg->level, user->seq, msg->ts_nsec / 1000);
+		      msg->level, user->seq, ts_usec);
 
 	/* escape non-printable characters */
 	for (i = 0; i < msg->text_len; i++) {
