From: Tony Luck <tony.luck@intel.com>
Subject: more PID churn during boot?
Date: Mon, 9 Jan 2012 16:32:56 -0800
Message-ID: <CA+8MBbKKTmZ2fD-j0xnQuxDh9jBO8jfV=gjP2cVvuPZg4r42+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:50675 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933544Ab2AJAc5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 19:32:57 -0500
Received: by vbbfc26 with SMTP id fc26so3130278vbb.19
        for <linux-next@vger.kernel.org>; Mon, 09 Jan 2012 16:32:56 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Just noticed that linux-next kernels from late 2011 threw out this
message during boot:

udevd (124): /proc/124/oom_adj is deprecated, please use
/proc/124/oom_score_adj instead.

while the 2012 editions print:

udevd (341): /proc/341/oom_adj is deprecated, please use
/proc/341/oom_score_adj instead.


So we are somehow burning through over 200 more PIDs just booting the
system than
we were last month.  Anyone know why?

[This is on an ia64 running a SLES 11-SP1 user space - hence the old
udevd binary]

-Tony
